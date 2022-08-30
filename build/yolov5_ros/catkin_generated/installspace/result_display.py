#!/usr/bin/env python3

import rospy
from std_msgs.msg import *
from detection_msgs.msg import BoundingBox, BoundingBoxes

class RecognitionDisplay:
    def __init__(self):
        self.sub_detection_objects = rospy.Subscriber("yolov5/detections", BoundingBoxes, self.detectionsCallback, queue_size=1)
    
    def detectionsCallback(self, received_values):
        rospy.loginfo(received_values.BoundingBox.Class)
    
def recognitionDisplayMain():
    recognition_display = RecognitionDisplay()
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        rospy.spin()
        rate.sleep()

if __name__ == "__main__":
    try:
        rospy.init_node("result_display")
        recognitionDisplayMain()
    except rospy.ROSInterruptException as e:
        rospy.ERROR(e)
        pass