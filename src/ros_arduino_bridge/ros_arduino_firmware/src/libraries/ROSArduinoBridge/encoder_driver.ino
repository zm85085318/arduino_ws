/* *************************************************************
   Encoder definitions

   Add an "#ifdef" block to this file to include support for
   a particular encoder board or library. Then add the appropriate
   #define near the top of the main ROSArduinoBridge.ino file.

   ************************************************************ */

#ifdef USE_BASE

#ifdef ROBOGAIA
/* The Robogaia Mega Encoder shield */
#include "MegaEncoderCounter.h"

/* Create the encoder shield object */
MegaEncoderCounter encoders = MegaEncoderCounter(4); // Initializes the Mega Encoder Counter in the 4X Count mode

/* Wrap the encoder reading function */
long readEncoder(int i) {
  if (i == LEFT) return encoders.YAxisGetCount();
  else return encoders.XAxisGetCount();
}

/* Wrap the encoder reset function */
void resetEncoder(int i) {
  if (i == LEFT) return encoders.YAxisReset();
  else return encoders.XAxisReset();
}
#elif defined(ARDUINO_ENC_COUNTER)
volatile long left_enc_pos = 0L;
volatile long right_enc_pos = 0L;
static const int8_t ENC_STATES [] = {0, 1, -1, 0, -1, 0, 0, 1, 1, 0, 0, -1, 0, -1, 1, 0}; //encoder lookup table

/* Interrupt routine for LEFT encoder, taking care of actual counting */
ISR (PCINT2_vect) {
  static uint8_t enc_last = 0;

  enc_last <<= 2; //shift previous state two places
  enc_last |= (PIND & (3 << 2)) >> 2; //read the current state into lowest 2 bits

  left_enc_pos += ENC_STATES[(enc_last & 0x0f)];
}

/* Interrupt routine for RIGHT encoder, taking care of actual counting */
ISR (PCINT1_vect) {
  static uint8_t enc_last = 0;

  enc_last <<= 2; //shift previous state two places
  enc_last |= (PINC & (3 << 4)) >> 4; //read the current state into lowest 2 bits

  right_enc_pos += ENC_STATES[(enc_last & 0x0f)];
}

/* Wrap the encoder reading function */
long readEncoder(int i) {
  if (i == LEFT) return left_enc_pos;
  else return right_enc_pos;
}

/* Wrap the encoder reset function */
void resetEncoder(int i) {
  if (i == LEFT) {
    left_count = 0L;
    return;
  } else if (i == RIGHT) {
    right_count = 0L;
    return;
  } else {
    back_count = 0L;
    return;
  }
}

#elif defined ARDUINO_MY_COUNTER
//target: achieve the interrupt counting
//1. define counters
volatile long left_count = 0L;
volatile long right_count = 0L;
volatile long back_count = 0L;
//2. initilization
void initEncoder() {
  pinMode(LEFT_A, INPUT);
  pinMode(LEFT_B, INPUT);
  pinMode(RIGHT_A, INPUT);
  pinMode(RIGHT_B, INPUT);
  pinMode(BACK_A, INPUT);
  pinMode(BACK_B, INPUT);
  attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(LEFT_A), leftEncoderEventA, CHANGE);
  attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(RIGHT_A), rightEncoderEventA, CHANGE);
  attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(BACK_A), backEncoderEventA, CHANGE);
}
//3. callback functions
void leftEncoderEventA() {
  if (digitalRead(LEFT_A) == HIGH) {
    if (digitalRead(LEFT_B) == HIGH) {
      left_count++;
    }
    else {
      left_count--;
    }
  }
  else {
    if (digitalRead(LEFT_B) == LOW) {
      left_count++;
    }
    else {
      left_count--;
    }
  }
}
void rightEncoderEventA() {
  if (digitalRead(RIGHT_A) == HIGH) {
    if (digitalRead(RIGHT_B) == HIGH) {
      right_count++;
    }
    else {
      right_count--;
    }
  }
  else {
    if (digitalRead(RIGHT_B) == LOW) {
      right_count++;
    }
    else {
      right_count--;
    }
  }
}
void backEncoderEventA() {
  if (digitalRead(BACK_A) == HIGH) {
    if (digitalRead(BACK_B) == HIGH) {
      back_count++;
    }
    else {
      back_count--;
    }
  }
  else {
    if (digitalRead(BACK_B) == LOW) {
      back_count++;
    }
    else {
      back_count--;
    }
  }
}
//4. 实现编码器数据读出和清零
long readEncoder(int i) {
  if (i == LEFT) {
    return left_count;
  }
  else if (i == RIGHT) {
    return right_count;
  }
  else {
    return back_count;
  }
}
void resetEncoder(int i) {
  if (i == LEFT) {
    left_count = 0L;
    return;
  } else if (i == RIGHT) {
    right_count = 0L;
    return;
  } else {
    back_count = 0L;
    return;
  }
}

#else
#error A encoder driver must be selected!
#endif

/* Wrap the encoder reset function */
void resetEncoders() {
  resetEncoder(LEFT);
  resetEncoder(RIGHT);
  resetEncoder(BACK);
}

#endif
