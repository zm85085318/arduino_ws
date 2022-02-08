// #include <ar_track_alvar_msgs/AlvarMarkers.h>
#include "ros/ros.h"
#include "dockingrobot/Docking.h" 
#include "distanceangle/DistanceAngle.h"
#include "dockingrobot/Command.h"
#include "string"
#include <sstream>
#include <geometry_msgs/Twist.h>
#include <math.h> 
#include <std_msgs/String.h>

using namespace std;

#define PI 3.14
float maxangle {1};
float maxorient {1};

float maxdistance {3}; // 4 meters
float maxvel {0.15};
float minvel {0.04};
float maxtwist1 {0.55};
float maxtwist2 {0.7};
int Phimax {43};
int Phimin{23};
int PhiAng{37};
int maxang{40};
float ARdist{0.4};
bool dockingCommand =  false;
string running_status = "stopped";

ros::Publisher Velocities_pub;
ros::Publisher runningStatus_pub;
geometry_msgs::Twist motor;


void velocitiesfunction(const distanceangle::DistanceAngle station1, float twist);
void RunningStatus(string running_status);

void velocitiesfunction(const distanceangle::DistanceAngle station1, float twist)
{
      motor.linear.x = minvel + (maxvel-minvel)*(station1.distance/maxdistance); //retta minvel to maxvel. The more close we are to the station, the lower has to be the velocity
  
      motor.angular.z = twist*(station1.distance/maxdistance); 
  
      ROS_INFO("linear [%f], angular [%f]", motor.linear.x, motor.angular.z);

      Velocities_pub.publish(motor);

}

void RunningStatus(string running_status){
  std_msgs::String string_pub;
  string_pub.data = running_status;
  runningStatus_pub.publish(string_pub);
}





void docking_callback(const distanceangle::DistanceAngle station)
{

  if(dockingCommand == true)
  {
        float Phi;

        Phi = Phimin + (Phimax-Phimin)*(station.distance/maxdistance) + PhiAng*(fabs(station.angle)/maxang);
      
    // I have to find a orientation for the first step such that we approach at the perpendicular line with a good distance. 
        //  Phi = atan(b/c)*180/PI;  

    // Phi has not to be too high, otherwise the camera will lose the contact with the AR tags
    
    // I can compute always Phi since if the robot follows the orientation of Phi, the Phi becomes constant

    // there are 2 cases: turn right (clockwise) and turn left. Approach means approaching to the perpendicular line. Adjust means recover the trajectory if Phi becomes higher

    // being on the left of the camera, angle is positive and viceversa. being in clockwise orientation is positive and viceversa

    if (station.distance > ARdist)
    {

      if (station.angle < -maxangle && station.orientation < Phi)
        {      

          velocitiesfunction(station,maxtwist1);

        } 

      else if (station.angle > maxangle && station.orientation < -Phi)
        {      

            velocitiesfunction(station,maxtwist1);

          } 

      else if(station.angle > maxangle && station.orientation > -Phi)
          {

            velocitiesfunction(station,-maxtwist1);
        
          }

      else if(station.angle < -maxangle && station.orientation > Phi)
          {

            velocitiesfunction(station,-maxtwist1);
        
          }

      else if((station.angle < maxangle) && (station.angle>-maxangle))
          {

        if (station.orientation>maxorient)
          {

              velocitiesfunction(station,-maxtwist2);

          } 

        else if (station.orientation<-maxorient)
          {

              velocitiesfunction(station,maxtwist2);

          }

        else
          {

          velocitiesfunction(station,0);

          }
        }
        running_status = "running";
    }

      else 
    {
          motor.linear.x = 0.0;
      
          motor.angular.z = 0.0; 
      
          ROS_INFO("linear [%f], angular [%f]", motor.linear.x, motor.angular.z);

          Velocities_pub.publish(motor);
          running_status = "minimum_range";
    }
    
    
  }
  else{
    running_status = "stopped";
  }
  RunningStatus(running_status);
}

void command_callback(const std_msgs::String::ConstPtr& command_received){
  // ROS_INFO("The received command is: %s", command_received->data.c_str());
  std::string received_msgs = command_received->data.c_str();

  if(received_msgs == "start"){
    dockingCommand = true;
  }
  if(received_msgs == "stop"){
    dockingCommand = false;
    
  }
}

// void chargingStatusCallback(const std_msgs::String::ConstPtr& chargingStatus_received){
//   string temp = chargingStatus_received->data.c_str();
//   if(temp == "connected"){
//     chargingStatus = true;
//     ROS_INFO("chargingStatus equals TRUE");
//   }
//   else if(temp == "disconnected"){
//     chargingStatus = false;
//     ROS_INFO("chargingStatus equals FALSE");
//   }
// }




int main(int argc, char **argv)
{ 
  ros::init(argc, argv, "docking");

  ros::NodeHandle n;
  
  runningStatus_pub = n.advertise<std_msgs::String>("/docking_robot/running_status", 10);
  Velocities_pub = n.advertise<geometry_msgs::Twist>("/cmd_vel", 1000);

  ros::Subscriber daSub = n.subscribe("DistanceAngle", 1, docking_callback);
  ros::Subscriber dockCommandSub = n.subscribe("/docking_robot/docking_command", 1, command_callback);
  // ros::Subscriber chargeStat = n.subscribe("charging_status", 1, chargingStatusCallback);


  ros::spin();

  return 0;
}
