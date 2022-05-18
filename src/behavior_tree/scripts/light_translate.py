#! /usr/bin/env python3
# import roslib; roslib.load_manifest('behavior_tree')
import rospy
from std_msgs.msg import *
from behavior_tree.msg import Analog

class LightTranslate(object):
    
    def __init__(self):
        rospy.loginfo("light_translater is online!")
        self.pub_left_light = rospy.Publisher("/behaviors_tree/left_light_strength", Float32, queue_size=1)
        self.pub_right_light = rospy.Publisher("/behaviors_tree/right_light_strength", Float32, queue_size=1)
        self.pub_back_light = rospy.Publisher("/behaviors_tree/back_light_strength", Float32, queue_size=1)

        self.sub_left_light_raw = rospy.Subscriber("/sensors_base/sensor/left_light_raw", Analog, self.leftLightCallback, queue_size=1)  
        self.sub_right_light_raw = rospy.Subscriber("/sensors_base/sensor/right_light_raw", Analog, self.rightLightCallback, queue_size=1)
        self.sub_back_light_raw = rospy.Subscriber("/sensors_base/sensor/back_light_raw", Analog, self.backLightCallback, queue_size=1)

    def leftLightCallback(self, battery_raw):
        temp0 = battery_raw.value
        temp1 = temp0/3.9
        temp5 = int(temp1)
        temp3 = int(temp5/100)
        temp2 = int((temp5%100)/10)
        temp4 = float(temp5%10)
        final_value = temp3 * 10 + temp2 + (0.1 * temp4)
        self.pub_left_light.publish(final_value)
    
    def rightLightCallback(self, battery_raw):
        temp0 = battery_raw.value
        temp1 = temp0/3.9
        temp5 = int(temp1)
        temp3 = int(temp5/100)
        temp2 = int((temp5%100)/10)
        temp4 = float(temp5%10)
        final_value = temp3 * 10 + temp2 + (0.1 * temp4)
        self.pub_right_light.publish(final_value)

    def backLightCallback(self, battery_raw):
        temp0 = battery_raw.value
        temp1 = temp0/3.9
        temp5 = int(temp1)
        temp3 = int(temp5/100)
        temp2 = int((temp5%100)/10)
        temp4 = float(temp5%10)
        final_value = temp3 * 10 + temp2 + (0.1 * temp4)
        self.pub_back_light.publish(final_value)

def translaterLightStrength():
    translater = LightTranslate()
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        rospy.spin()
        # rate.sleep()




if __name__ == "__main__":
    try:
        rospy.init_node("light_strength_translate")
        translaterLightStrength()
    except rospy.ROSInterruptException as e:
        rospy.ERROR(e)
        pass