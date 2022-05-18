#! /usr/bin/env python3

import numpy as np
import os
import time
import math
import rospy
from std_msgs.msg import *
from fiducial_msgs.msg import FiducialTransformArray
from geometry_msgs.msg import Transform
from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped


class StatusConverter(object):
    CMD_VEL_ANGULAR_RATE = 0.5 #rad/s negative is clockwise
    TURN_RADIANS = -1.0472/2
    MIN_TURN_PERIOD = 0.3
    TURN_TIME_INTERVAL = 3
    MANAGER_PERIOD = 0.1
    LIGHT_SENSORS_ACCURATE = 0.3

    cmd_vel_angular = 0
    cmd_vel_msg = TwistStamped()
    cmd_vel_msg.header.frame_id = "base_footprint"

    is_in_view = False
    is_turning = False
    is_in_action = False
    docking_command_flag = False
    docking_process_status_flag = False
    light_pursuit_command_flag = False

    left_light_strength = 0
    right_light_strength = 0
    back_light_strength = 0

    last_dock_aruco_tf = Transform()
    dock_aruco_tf = Transform()
    status_string = "no information"
    tag_finding_status_string = "no information"


    def __init__(self):
        rospy.loginfo("status_converter is online!")
        self.pub_docking_command = rospy.Publisher("/docking_robot/docking_command", String, queue_size=1)
        self.pub_behaviors_status = rospy.Publisher("/behaviors_tree/behaviors_status", String, queue_size=1)
        self.pub_tag_finding_status = rospy.Publisher("/behaviors_tree/tag_finding_status", String, queue_size=1)
        self.pub_cmd_vel = rospy.Publisher('cmd_vel', Twist, queue_size=1)
        
        self.sub_aruco_detect = rospy.Subscriber("/fiducial_transforms",FiducialTransformArray, self.arucoDetectCallback, queue_size=1)
        self.sub_docking_command = rospy.Subscriber("/behaviors_tree/docking_command", String, self.dockingCommandCallback ,queue_size=1)
        self.sub_docking_process_status = rospy.Subscriber("/docking_robot/running_status", String, self.dockingProcessStatusCallback, queue_size=1)
        self.light_pursuit_command = rospy.Subscriber("/behaviors_tree/light_pursuit_command", String, self.lightPursuitCallback, queue_size=1)

        self.sub_left_light = rospy.Subscriber("/behaviors_tree/left_light_strength", Float32, self.leftLightStrengthCallback, queue_size=1)
        self.sub_right_light = rospy.Subscriber("/behaviors_tree/right_light_strength", Float32, self.rightLightStrengthCallback, queue_size=1)
        self.sub_back_light = rospy.Subscriber("/behaviors_tree/back_light_strength", Float32, self.backLightStrengthCallback, queue_size=1)
        
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
        if command.data == "start":
            self.light_pursuit_command_flag = True
        elif command.data == "stop":
            self.light_pursuit_command_flag = False
    
    def leftLightStrengthCallback(self, value):
        self.left_light_strength = value.data
    
    def rightLightStrengthCallback(self, value):
        self.right_light_strength = value.data

    def backLightStrengthCallback(self, value):
        self.right_light_strength = value.data

    #================About docking and tag searching===================================
    #TODO: Charging ststus detection/Auto stop

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
    
    def robotTurnStop(self):
        self.cmd_vel_msg.twist.linear.x = 0
        self.cmd_vel_msg.twist.angular.z = 0
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)

    #==============================About Turning Towards To The Light Source============================
    def robotLeftTurn(self):
        turn_period = abs(self.TURN_TIME_INTERVAL/self.CMD_VEL_ANGULAR_RATE)
        if turn_period < self.MIN_TURN_PERIOD:
            turn_period = self.MIN_TURN_PERIOD
        self.turn_timer = rospy.Timer(rospy.Duration(turn_period), self.robotTurnTimerCalllback, oneshot=True)
        rospy.loginfo("Turn Left for %f", turn_period)
        self.cmd_vel_angular = self.CMD_VEL_ANGULAR_RATE
        self.cmd_vel_msg.twist.angular.z = self.cmd_vel_angular
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)
    
    def robotRightTurn(self):
        turn_period = abs(self.TURN_TIME_INTERVAL/self.CMD_VEL_ANGULAR_RATE)
        if turn_period < self.MIN_TURN_PERIOD:
            turn_period = self.MIN_TURN_PERIOD
        self.turn_timer = rospy.Timer(rospy.Duration(turn_period), self.robotTurnTimerCalllback, oneshot=True)
        rospy.loginfo("Turn Right for %f", turn_period)
        self.cmd_vel_angular = -self.CMD_VEL_ANGULAR_RATE
        self.cmd_vel_msg.twist.angular.z = self.cmd_vel_angular
        self.pub_cmd_vel.publish(self.cmd_vel_msg.twist)

    def lightPursuitExecutive(self):
        if self.back_light_strength - self.right_light_strength > self.LIGHT_SENSORS_ACCURATE and self.left_light_strength - self.right_light_strength > self.LIGHT_SENSORS_ACCURATE:
            self.robotLeftTurn()
        elif self.back_light_strength - self.left_light_strength > self.LIGHT_SENSORS_ACCURATE and self.right_light_strength - self.left_light_strength > self.LIGHT_SENSORS_ACCURATE:
            self.robotRightTurn()
        elif self.left_light_strength - self.back_light_strength > self.LIGHT_SENSORS_ACCURATE and self.right_light_strength - self.back_light_strength > self.LIGHT_SENSORS_ACCURATE:
            if self.left_light_strength - self.right_light_strength > self.LIGHT_SENSORS_ACCURATE:
                self.robotLeftTurn()
            elif self.right_light_strength - self.left_light_strength > self.LIGHT_SENSORS_ACCURATE:
                self.robotRightTurn()
        rospy.sleep(1)
    
    def TurningTimerCalllback(self, event):
        rospy.loginfo("Turning ended")
        self.robotTurnStop()

    #=================Primary Running Function=================================
    def behaviorsRunning(self, event):
        if self.docking_command_flag == True:
            self.dockingExecutive()
        else:
            self.stopDockingExecutive()
        if self.light_pursuit_command_flag == True:
            self.lightPursuitExecutive()


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