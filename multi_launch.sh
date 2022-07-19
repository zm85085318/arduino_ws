#!/bin/bash

roslaunch rplidar_ros rplidar.launch &
sleep 2
echo "launch lidar drivers successfully"

roslaunch mycar_start start.launch &
sleep 2
echo "launch car_base successfully"

roslaunch behavior_tree behaviors_tree.launch &
echo "launch behaviors_tree successfully"