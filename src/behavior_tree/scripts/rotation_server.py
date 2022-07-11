#! /usr/bin/env python3

import rospy
import actionlib
from behavior_tree.msg import TurningAroundAction, TurningAroundFeedback, TurningAroundResult

class TurningAroundServer():
    
    def __init__(self):
        self.rotation_server = actionlib.SimpleActionServer(
            "rotation_as", TurningAroundAction, execute_cb=self.execute_cb, auto_start=False
        )
        self.rotation_server.start()
    
    def execute_cb(self, goal):

        success = True