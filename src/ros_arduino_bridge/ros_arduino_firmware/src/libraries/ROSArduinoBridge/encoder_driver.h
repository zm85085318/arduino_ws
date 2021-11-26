/* *************************************************************
   Encoder driver function definitions - by James Nugen
   ************************************************************ */


#ifdef ARDUINO_ENC_COUNTER
//below can be changed, but should be PORTD pins;
//otherwise additional changes in the code are required
#define LEFT_ENC_PIN_A PD2  //pin 2
#define LEFT_ENC_PIN_B PD3  //pin 3

//below can be changed, but should be PORTC pins
#define RIGHT_ENC_PIN_A PC4  //pin A4
#define RIGHT_ENC_PIN_B PC5   //pin A5

#elif defined ARDUINO_MY_COUNTER

#define LEFT_A 2
#define LEFT_B 5
#define RIGHT_A 3
#define RIGHT_B 15
#define BACK_A 18
#define BACK_B 19
/**
   Function
*/
void initEncoder();

//Interrupt function
void leftEncoderEventA();
void rightEncoderEventA();
void backEncoderEventA();

#endif

long readEncoder(int i);
void resetEncoder(int i);
void resetEncoders();
