#!/usr/bin/env python3

import rospy
import tf2_ros
from tf_conversions import transformations
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import *
from detection_msgs.msg import BoundingBoxes

class RecognitionDisplay:
    out_img = Image()
    current_robot_pose = None
    robot_record_pose = None
    tfbuffer = None
    position_listener = None

    def __init__(self):
        self.bridge = CvBridge()

        if self.tfbuffer is None or self.position_listener is None:
            self.tfbuffer = tf2_ros.Buffer()
            self.position_listener = tf2_ros.TransformListener(self.tfbuffer)

        self.sub_detection_objects = rospy.Subscriber("yolov5/detections", BoundingBoxes, self.detectionsCallback, queue_size=1)
        self.sub_detection_img = rospy.Subscriber("yolov5/image_out", Image,self.imageRenewCallback, queue_size=1)
        try:
            self.position_listener.waitForTransform('map', 'base_footprint', rospy.Time(), rospy.Duration(1.0))
        except:
            rospy.logwarn("position listener error, try again")
            rospy.sleep(100)
            try:
                self.position_listener.waitForTransform('map', 'base_footprint', rospy.Time(), rospy.Duration(1.0))
            except:
                rospy.logwarn("position listener error still happened, progress terminated")
                return
    
    def detectionsCallback(self, received_values):
        for count in range(len(received_values.bounding_boxes)):
            target_class = received_values.bounding_boxes[count].Class
            target_probability = received_values.bounding_boxes[count].probability
            if target_class == "potted plant" and target_probability > 0.85:
                position_flag = self.getPositionListener()
                if position_flag == True:
                    rospy.loginfo("find a person, and the possibility is: ")
                    # rospy.loginfo(target_class)
                    rospy.loginfo(target_probability)
                    rospy.loginfo(self.current_robot_pose["pos_x"])
                    rospy.loginfo(self.current_robot_pose["pos_y"])
    
    def imageRenewCallback(self, raw_img_object):
        try:
            self.out_img = self.bridge.imgmsg_to_cv2(raw_img_object, "bgr8")
        except CvBridgeError as e:
            print(e)
        # cv2.imshow("Image window", self.out_img)
        # cv2.waitKey(3)
    
    def getPositionListener(self):
        try:
            (pos, ori) = self.position_listener.lookupTransform("map", "bask_footprint", rospy.Time(0), rospy.Duration(0.0))
            msg_dict = {
                "pos_x" : pos[0],
                "pos_y" : pos[1],
                "pos_z" : pos[2],
                "ori_x" : ori[0],
                "ori_y" : ori[1],
                "ori_z" : ori[2],
                "ori_w" : ori[3]
            }
            self.current_robot_pose = msg_dict
            return True
        except:
            rospy.WARN("position tf error occured")
            return False
    
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