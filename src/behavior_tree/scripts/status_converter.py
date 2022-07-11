#! /usr/bin/env python3

from turtle import distance, forward
import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from behavior_tree.msg import RobotStatusControllerAction, RobotStatusControllerGoal
from behavior_tree.msg import TurningAroundAction, TurningAroundGoal

from std_msgs.msg import *
from fiducial_msgs.msg import FiducialTransformArray
from geometry_msgs.msg import Transform
from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped


class StatusConverter(object):
    CMD_VEL_ANGULAR_RATE = 0.35 #rad/s negative is clockwise
    TURN_RADIANS = -1.0472/2
    MIN_TURN_PERIOD = 0.3
    TURN_TIME_INTERVAL = 1
    MANAGER_PERIOD = 0.1
    LIGHT_SENSORS_ACCURATE = 0.5
    STEP_LENGTH = 0.5
    UNDOCK_DISTANCE = 1.0

    cmd_vel_angular = 0
    cmd_vel_msg = TwistStamped()
    cmd_vel_msg.header.frame_id = "base_footprint"

    is_in_view = False
    is_turning = False
    is_in_action = False
    docking_command_flag = False
    docking_process_status_flag = False
    light_pursuit_command_flag = False
    connecter_connected_flag = False
    battery_fully_charged_flag = False
    stop_flag = False

    left_light_strength = 0
    right_light_strength = 0
    back_light_strength = 0
    connecter_voltage = 0
    battery_voltage = 0
    turning_counter = 0

    last_dock_aruco_tf = Transform()
    dock_aruco_tf = Transform()
    status_string = "no information"
    tag_finding_status_string = "no information"


    def __init__(self):
        # rospy.init_node("rotation_client")
        # client = actionlib.SimpleActionClient('rotation_go', TurningAroundAction)
        # client.wait_for_server()


        rospy.loginfo("status_converter is online!")
        self.pub_docking_command = rospy.Publisher("/docking_robot/docking_command", String, queue_size=1)
        self.pub_behaviors_status = rospy.Publisher("/behaviors_tree/behaviors_status", String, queue_size=1)
        self.pub_tag_finding_status = rospy.Publisher("/behaviors_tree/tag_finding_status", String, queue_size=1)

        # TODO: Problems happened at the following line
        self.pub_cmd_vel = rospy.Publisher('cmd_vel', Twist, queue_size=10)
        
        self.sub_aruco_detect = rospy.Subscriber("/fiducial_transforms",FiducialTransformArray, self.arucoDetectCallback, queue_size=1)
        self.sub_docking_command = rospy.Subscriber("/behaviors_tree/docking_command", String, self.dockingCommandCallback ,queue_size=1)
        self.sub_docking_process_status = rospy.Subscriber("/docking_robot/running_status", String, self.dockingProcessStatusCallback, queue_size=1)
        self.light_pursuit_command = rospy.Subscriber("/behaviors_tree/light_pursuit_command", String, self.lightPursuitCallback, queue_size=1)

        self.sub_left_light = rospy.Subscriber("/behaviors_tree/left_light_strength", Float32, self.leftLightStrengthCallback, queue_size=1)
        self.sub_right_light = rospy.Subscriber("/behaviors_tree/right_light_strength", Float32, self.rightLightStrengthCallback, queue_size=1)
        self.sub_back_light = rospy.Subscriber("/behaviors_tree/back_light_strength", Float32, self.backLightStrengthCallback, queue_size=1)
        self.sub_connecter_voltage = rospy.Subscriber("/behaviors_tree/connecter_voltage", Float32, self.connecterVoltageCallback, queue_size=1)
        self.sub_battery_voltage = rospy.Subscriber("/behaviors_tree/battery_voltage", Float32, self.batteryVoltageCallback, queue_size=1)
        self.behaviors_running_timer = rospy.Timer(rospy.Duration(self.MANAGER_PERIOD), self.behaviorsRunning, oneshot=False)

    def dockingCommandCallback(self, command):
        # rospy.loginfo("command is: " + command.data)
        if command.data == "start":
            self.docking_command_flag = True
        if command.data == "stop":
            self.docking_command_flag = False
            

    def arucoDetectCallback(self, fid_tf_array):
        try:
            #If there is no 0 index of transform, then aruco was not found
            fid_tf = fid_tf_array.transforms[0]
            self.last_dock_aruco_tf = self.dock_aruco_tf
            self.dock_aruco_tf = fid_tf
            self.is_in_view = True
            self.tag_finding_status_string = '[Behaviors_tree]: marker detected'
        except:
            self.is_in_view = False
            self.tag_finding_status_string = "[Behaviors_tree]: no marker in sight"
        self.pub_tag_finding_status.publish(self.tag_finding_status_string)
    
    def dockingProcessStatusCallback(self, dp_status):
        if dp_status.data == "running":
            self.docking_process_status_flag = True
        elif dp_status.data == "stopped":
            self.docking_process_status_flag = False
    
    def lightPursuitCallback(self, command):
        if command.data == "go":
            self.light_pursuit_command_flag = True
        elif command.data == "stop":
            self.light_pursuit_command_flag = False
        elif command.data == "back":
            self.backToOrigin()
    
    def leftLightStrengthCallback(self, value):
        self.left_light_strength = value.data
    
    def rightLightStrengthCallback(self, value):
        self.right_light_strength = value.data

    def backLightStrengthCallback(self, value):
        self.back_light_strength = value.data

    def connecterVoltageCallback(self, value):
        self.connecter_voltage = value.data
        if self.connecter_voltage > 25:
            self.connecter_connected_flag = True
        else:
            self.connecter_connected_flag = False
    
    def batteryVoltageCallback(self, value):
        self.battery_voltage = value.data
        if self.battery_voltage > 11.5:
            self.battery_fully_charged_flag = True
        else:
            self.battery_fully_charged_flag = False

    #================About docking and tag searching===================================
    def dockingExecutive(self):
        if self.docking_process_status_flag == False and self.is_in_view == False:
            turning_count = 0
            if turning_count > 100:
                self.status_string = "Error: ArTag is invisiable"
                self.docking_command_flag = False
            else:
                self.status_string = "searching tag..."
                self.robotTurn(-self.TURN_RADIANS)
                turning_count +=1
        
        elif self.is_in_view == True and self.docking_process_status_flag == False:
            self.status_string = "start dock approaching ..."
            self.pub_docking_command.publish("start")
            self.docking_process_status_flag = True
            # self.docking_command_flag = False
        
        elif self.docking_process_status_flag == True and self.is_in_view == True:
            self.status_string = "docking..."
        
        elif self.docking_process_status_flag == True and self.is_in_view == False:
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag = False

        elif self.connecter_connected_flag == True:
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag = False
            self.status_string = "docked"
        
        self.pub_behaviors_status.publish(self.status_string)
        rospy.sleep(0.1)
    
    def stopDockingExecutive(self):
        if self.docking_process_status_flag == True:
            self.status_string = "stop docking"
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag == False          
                
        elif self.is_in_view == False:
            self.status_string = "stop searching ArTag"
            self.robotTurnStop()
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag == False
        self.pub_behaviors_status.publish(self.status_string)
        rospy.sleep(0.1)

    def robotTurn(self, radians):
        turn_period = abs(radians/self.CMD_VEL_ANGULAR_RATE)
        if turn_period < self.MIN_TURN_PERIOD:
            turn_period = self.MIN_TURN_PERIOD
        self.turn_timer = rospy.Timer(rospy.Duration(turn_period), self.robotTurnTimerCalllback, oneshot=True)
        if radians>0:
            rospy.loginfo("Turn right for %f", turn_period)
            self.cmd_vel_angular = -self.CMD_VEL_ANGULAR_RATE
        else:
            rospy.loginfo("Turn Left for %f", turn_period)
            self.cmd_vel_angular = self.CMD_VEL_ANGULAR_RATE
        self.cmd_vel_msg.twist.angular.z = self.cmd_vel_angular
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)

    def robotTurnTimerCalllback(self, event):
        rospy.loginfo("openrover_turn_timer_cb: Turning ended")
        self.robotTurnStop()
        self.is_turning = False
        self.is_in_action = False

    def openrover_linear_timer_cb(self, event):
        rospy.loginfo("openrover_linear_timer_cb: Stop moving forward")
        self.is_in_action = False
        self.robotTurnStop()
    
    def robotTurnStop(self):
        self.cmd_vel_msg.twist.linear.x = 0
        self.cmd_vel_msg.twist.angular.z = 0
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)
    
    def robotForward(self, distance):
        jog_period = abs(distance/self.CMD_VEL_LINEAR_RATE)
        rospy.loginfo('jog_period: %f', jog_period)
        self.linear_timer = rospy.Timer(rospy.Duration(jog_period), self.openrover_linear_timer_cb, oneshot=True)
        if distance>0:
            rospy.loginfo("Moving forward")
            self.cmd_vel_linear = self.CMD_VEL_LINEAR_RATE
        else:
            rospy.loginfo("Moving Backward")
            self.cmd_vel_linear = -self.CMD_VEL_LINEAR_RATE*1.5
        self.cmd_vel_msg.twist.linear.x = self.cmd_vel_linear
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)
    
    def robotUndockExecutive(self):
        if self.status_string == "docked":
            rospy.loginfo("Undock turning")
            self.robotForward(-self.UNDOCK_DISTANCE)
            self.robotTurn(3.1)
            self.robotTurnStop
            self.status_string == "undocking"



    #==============================About Turning Towards To The Light Source============================
    def robotLeftTurn(self):
        turn_period = abs(self.TURN_TIME_INTERVAL/self.CMD_VEL_ANGULAR_RATE)
        if turn_period < self.MIN_TURN_PERIOD:
            turn_period = self.MIN_TURN_PERIOD
        self.turn_timer = rospy.Timer(rospy.Duration(turn_period), self.turningTimerCalllback, oneshot=True)
        # rospy.loginfo("Turn Left for %f", turn_period)
        self.cmd_vel_angular = self.CMD_VEL_ANGULAR_RATE
        self.cmd_vel_msg.twist.angular.z = self.cmd_vel_angular
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)
    
    def robotRightTurn(self):
        turn_period = abs(self.TURN_TIME_INTERVAL/self.CMD_VEL_ANGULAR_RATE)
        if turn_period < self.MIN_TURN_PERIOD:
            turn_period = self.MIN_TURN_PERIOD
        self.turn_timer = rospy.Timer(rospy.Duration(turn_period), self.turningTimerCalllback, oneshot=True)
        # rospy.loginfo("Turn Right for %f", turn_period)
        self.cmd_vel_angular = -self.CMD_VEL_ANGULAR_RATE
        self.cmd_vel_msg.twist.angular.z = self.cmd_vel_angular
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)

    '''
        goal = TurningAroundGoal()
        client.send_goal(goal)
    '''

    def lightPursuitExecutive(self):
        if self.left_light_strength + self.back_light_strength > 2 * self.right_light_strength:
            self.robotLeftTurn()
            rospy.loginfo("Case 1")
        elif self.back_light_strength + self.right_light_strength > 2 * self.left_light_strength:
            self.robotRightTurn()
            rospy.loginfo("Case 2")
        else:
            if self.left_light_strength - self.right_light_strength > self.LIGHT_SENSORS_ACCURATE:
                self.robotLeftTurn()
                rospy.loginfo("Case 3-1")
            elif self.right_light_strength - self.left_light_strength > self.LIGHT_SENSORS_ACCURATE:
                self.robotRightTurn()
                rospy.loginfo("Case 3-2")
            else:
                if self.turning_counter < 5:
                    self.turning_counter += 1
                    rospy.loginfo("case 4-1")
                else:
                    rospy.loginfo("Case 4-2")
                    self.cmd_vel_msg.twist.linear.x = 0
                    self.cmd_vel_msg.twist.angular.z = 0
                    self.light_pursuit_command_flag = False
                    exec_result = self.moveByNav(distance=self.STEP_LENGTH,back_home_flag=False)
                    if not exec_result:
                        exec_result = self.moveByNav(distance=self.STEP_LENGTH / 2, back_home_flag=False)
                        if not exec_result:
                            self.light_pursuit_command_flag = False
                            self.turning_counter = 0
                    rospy.loginfo(exec_result)
        rospy.sleep(1)
    
    def backToOrigin(self):
        self.moveByNav(back_home_flag=True)
    
    def turningTimerCalllback(self, event):
        rospy.loginfo("Turning ended")
        self.robotTurnStop()

    #=================About Navigating to somewhere===============================
    def moveByNav(self, distance=0.0, back_home_flag=True):
        client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        client.wait_for_server()
        goal = MoveBaseGoal()
        if back_home_flag:
            goal.target_pose.header.frame_id = "map"
            goal.target_pose.pose.position.x = 0.0
            goal.target_pose.pose.position.y = 0.0
        else:
            goal.target_pose.header.frame_id = 'base_footprint'
            goal.target_pose.pose.position.x = distance
        goal.target_pose.pose.orientation.w = 1.0

        client.send_goal(goal)
        wait = client.wait_for_result(rospy.Duration(5))
        if not wait:
            client.cancel_goal()
            rospy.logwarn("Time out achieving goal")
            return False
        else:
            return True
        


    #=================Primary Running Function=================================
    def behaviorsRunning(self, event):
        if self.docking_command_flag == True:
            self.stop_flag = True
            self.dockingExecutive()
        elif self.stop_flag == True:
            self.stopDockingExecutive()
            self.stop_flag = False
        if self.light_pursuit_command_flag == True:
            self.lightPursuitExecutive()
    
    # TODO: We need to make a cycle for checking if light strength is enough/ Or we've reached the edge of wall.
    # TODO: In this cycle, we need to consider two features, the First is "power supply ability", and the Second is "the available running space"
    # TODO: The best situation is, robot can reached to the desired place, where there is enough light strength;
    # TODO: The not-that-much-best situation is, robot meets the wall edge before reached to the desired place(require path planing checking ability)
    # TODO: This function should be able to judge what kind of charging method should be apply, light or wireless charge?
    
    #--------------------------Under Construction-------------------------------------------------------

    #--------------------------The End of Construction Area---------------------------------------------


def statusConverterMain():
    status_converter = StatusConverter()
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        rospy.spin()
        rate.sleep()

if __name__ == "__main__":
    try:
        rospy.init_node("status_converter")
        statusConverterMain()
    except rospy.ROSInterruptException as e:
        rospy.ERROR(e)
        pass