#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
 
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;
 
int main(int argc, char** argv){
  ros::init(argc, argv, "simple_navigation_goals");
 
  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);
 
  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }
 
  move_base_msgs::MoveBaseGoal goal;
 
  //we'll send a goal to the robot to move 1 meter forward
  goal.target_pose.header.frame_id = "base_footprint";
  goal.target_pose.header.stamp = ros::Time::now();
 
  goal.target_pose.pose.position.x = 1.0;
  goal.target_pose.pose.orientation.w = 1.0;
  
// TODO: In theory, if we want to move the robot back to the original position, we shold 1.use "map" header; 2. set the pose.x equals zero.(Orientation might not be necessary)

// So, here we needs two different functions. The first one is for moving robot forward, the second one is for send the robot back to the original position.
    
  ROS_INFO("Sending goal");
  ac.sendGoal(goal);
 
  ac.waitForResult();
 
  if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    ROS_INFO("Hooray, the base moved 1 meter forward");
  else
    ROS_INFO("The base failed to move forward 1 meter for some reason");
 
  return 0;
}