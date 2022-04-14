/***************************************************************
   Motor driver function definitions - by James Nugen
   *************************************************************/

#ifdef L298_MOTOR_DRIVER
  #define RIGHT_MOTOR_BACKWARD 5
  #define LEFT_MOTOR_BACKWARD  6
  #define RIGHT_MOTOR_FORWARD  9
  #define LEFT_MOTOR_FORWARD   10
  #define RIGHT_MOTOR_ENABLE 12
  #define LEFT_MOTOR_ENABLE 13

#elif defined OMNI3WD_MOTOR_DRIVER
//  #define LEFT_DIR 6
//  #define LEFT_PWM 11
//  #define RIGHT_DIR 7
//  #define RIGHT_PWM 10
//  #define BACK_DIR 8
//  #define BACK_PWM 9
  #define LEFT_DIR 2
  #define LEFT_PWM 3
  #define RIGHT_DIR 11
  #define RIGHT_PWM 10
  #define BACK_DIR 8
  #define BACK_PWM 9
#endif

void initMotorController();
void setMotorSpeed(int i, int spd);
void setMotorSpeeds(int leftSpeed, int rightSpeed);
void setThreeMotorSpeeds(int leftSpeed, int rightSpeed, int backSpeed);
