// #include <ar_track_alvar_msgs/AlvarMarkers.h>
#include "ros/ros.h"
#include "dockingrobot/Docking.h" 
#include "distanceangle/DistanceAngle.h"
#include <geometry_msgs/Twist.h>
#include <math.h> 
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
float ARdist {0.3};

ros::Publisher Velocities_pub;
geometry_msgs::Twist motor;


void velocitiesfunction(const distanceangle::DistanceAngle station1, float twist);

void velocitiesfunction(const distanceangle::DistanceAngle station1, float twist)
{
      motor.linear.x = minvel + (maxvel-minvel)*(station1.distance/maxdistance); //retta minvel to maxvel. The more close we are to the station, the lower has to be the velocity
  
      motor.angular.z = twist*(station1.distance/maxdistance); 
  
      ROS_INFO("linear [%f], angular [%f]", motor.linear.x, motor.angular.z);

      Velocities_pub.publish(motor);

}



void dockingCallback(const distanceangle::DistanceAngle station)
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
  }

  else 
 {
      motor.linear.x = 0.0;
  
      motor.angular.z = 0.0; 
  
      ROS_INFO("linear [%f], angular [%f]", motor.linear.x, motor.angular.z);

      Velocities_pub.publish(motor);
 }
}

int main(int argc, char **argv)
{ 
  ros::init(argc, argv, "docking");

  ros::NodeHandle n;

  Velocities_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 1000);

  ros::Subscriber da_sub = n.subscribe("DistanceAngle", 1, dockingCallback);


  ros::spin();

  return 0;
}
