#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist, TwistStamped

import time


def callback(cmdVelocity):

    baseVelocity = TwistStamped()

    baseVelocity = cmdVelocity

    now = rospy.get_rostime()
    print(baseVelocity.header.stamp.secs)
    print(baseVelocity.header.stamp.nsecs)
    if baseVelocity.header.stamp.secs == now.secs and baseVelocity.header.stamp.nsecs < now.nsecs + 5000:
    # baseVelocity.header.stamp.nsecs = now.nsecs

        baseVelocityPub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
        baseVelocityPub.publish(baseVelocity)


def cmd_vel_listener():
    
    r = rospy.Rate(10)
    while not rospy.is_shutdown:
        rospy.Subscriber("/cmd_vel/auto_dock", TwistStamped, callback)

        rospy.spin()
        r.sleep()

if __name__ == '__main__':
    rospy.init_node('cmd_vel_listener', anonymous=True)
    cmd_vel_listener()