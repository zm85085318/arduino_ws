#! /usr/bin/env python3
# import roslib; roslib.load_manifest('behavior_tree')
import rospy
from std_msgs.msg import *
from behavior_tree.msg import Analog

class VoltageTranslate(object):
    
    def __init__(self):
        rospy.loginfo("Voltage_translater is online!")
        self.pub_battery_voltage = rospy.Publisher("/behaviors_tree/battery_voltage", Float32, queue_size=1)
        self.pub_connecter_voltage = rospy.Publisher("/behaviors_tree/connecter_voltage", Float32, queue_size=1)


        self.sub_battery_voltage_raw = rospy.Subscriber("/arduino/sensor/battery_voltage_raw", Analog, self.BatteryVoltageCallback, queue_size=1)  
        self.sub_connecter_voltage_raw = rospy.Subscriber("/arduino/sensor/connecter_voltage_raw", Analog, self.ConnecterVoltageCallback, queue_size=1)  

    def BatteryVoltageCallback(self, battery_raw):
        temp0 = battery_raw.value
        temp1 = temp0/3.9
        temp5 = int(temp1)
        temp3 = int(temp5/100)
        temp2 = int((temp5%100)/10)
        temp4 = float(temp5%10)
        final_value = temp3 * 10 + temp2 + (0.1 * temp4)
        self.pub_battery_voltage.publish(final_value)
    
    def ConnecterVoltageCallback(self, connecter_raw):
        temp0 = connecter_raw.value
        temp1 = temp0/3.9
        temp5 = int(temp1)
        temp3 = int(temp5/100)
        temp2 = int((temp5%100)/10)
        temp4 = float(temp5%10)
        final_value = temp3 * 10 + temp2 + (0.1 * temp4)
        self.pub_connecter_voltage.publish(final_value)

def translaterVoltage():
    translater = VoltageTranslate()
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        rospy.spin()
        rate.sleep()




if __name__ == "__main__":
    try:
        rospy.init_node("voltage_translate")
        translaterVoltage()
    except rospy.ROSInterruptException as e:
        rospy.ERROR(e)
        pass