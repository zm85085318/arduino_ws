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
    MIN_TURN_PERIOD = 0.5
    MANAGER_PERIOD = 0.1

    cmd_vel_angular = 0
    cmd_vel_msg = TwistStamped()
    cmd_vel_msg.header.frame_id = "base_footprint"

    is_in_view = False
    is_turning = False
    is_in_action = False
    docking_command_flag = False
    docking_process_status_flag = False

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
        
        self.behaviors_running_timer = rospy.Timer(rospy.Duration(self.MANAGER_PERIOD), self.behaviorsRunning, oneshot=False)

    def dockingCommandCallback(self, command):
        # rospy.loginfo("command is: " + command.data)
        if command.data == "start":
            self.docking_command_flag = True
        if command.data == "stop":
            self.docking_command_flag = False
        # self.pub_behaviors_status.publish(self.status_string)
            

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

    #================About docking and tag_searching===================================
    #TODO: the following three functions haven't been finished.

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

    #=================Primary Running Function=================================
    def behaviorsRunning(self, event):
        if self.docking_command_flag == True and self.docking_process_status_flag == False and self.is_in_view == False:
            turning_count = 0
            if turning_count > 100:
                self.status_string = "Error: ArTag is invisiable"
                self.docking_command_flag = False
            else:
                self.status_string = "searching tag..."
                self.robotTurn(-self.TURN_RADIANS)
                turning_count +=1
        elif self.docking_command_flag == True and self.is_in_view == True and self.docking_process_status_flag == False:
            self.status_string = "start dock approaching ..."
            self.pub_docking_command.publish("start")
            self.docking_process_status_flag = True
            # self.docking_command_flag = False
        elif self.docking_command_flag == True and self.docking_process_status_flag == True and self.is_in_view == True:
            self.status_string = "docking..."
            # pass
        elif self.docking_command_flag == True and self.docking_process_status_flag == True and self.is_in_view == False:
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag = False
                
        elif self.docking_command_flag == False and self.docking_process_status_flag == True:
            self.status_string = "stop docking"
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag == False          
                
        elif self.docking_command_flag == False and self.is_in_view == False:
            self.status_string = "stop searching ArTag"
            self.robotTurnStop()
            self.pub_docking_command.publish("stop")
            self.docking_process_status_flag == False
        else:
            pass
        self.pub_behaviors_status.publish(self.status_string)
        rospy.sleep(0.1)
                    



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