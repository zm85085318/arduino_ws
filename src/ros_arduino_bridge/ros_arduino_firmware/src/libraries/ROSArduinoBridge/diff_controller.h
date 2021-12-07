/* Functions and type-defs for PID control.

   Taken mostly from Mike Ferguson's ArbotiX code which lives at:

   http://vanadium-ros-pkg.googlecode.com/svn/trunk/arbotix/
*/

/* PID setpoint info For a Motor */
typedef struct {
  double TargetTicksPerFrame;    // target speed in ticks per frame
  long Encoder;                  // encoder count
  long PrevEnc;                  // last encoder count

  /*
    Using previous input (PrevInput) instead of PrevError to avoid derivative kick,
    see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-derivative-kick/
  */
  int PrevInput;                // last input
  //int PrevErr;                   // last error

  /*
    Using integrated term (ITerm) instead of integrated error (Ierror),
    to allow tuning changes,
    see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-tuning-changes/
  */
  //int Ierror;
  int ITerm;                    //integrated term

  long output;                    // last motor setting
}
SetPointInfo;

SetPointInfo leftPID, rightPID, backPID;

/**
 * PID param setup
 */
int Kp = 8;
int Kd = 2;
int Ki = 0;
int Ko = 50;

/**
 * Setting PID separately
 */
int Kp_b = 200;
int Kd_b = 20;
int Ki_b = 1;
int Ko_b = 500;

int Kp_l = 100;
int Kd_l = 20;
int Ki_l = 1;
int Ko_l = 500;

int Kp_r = 100;
int Kd_r = 20;
int Ki_r = 1;
int Ko_r = 500;



unsigned char moving = 0; // is the base in motion?

/*
  Initialize PID variables to zero to prevent startup spikes
  when turning PID on to start moving
  In particular, assign both Encoder and PrevEnc the current encoder value
  See http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-initialization/
  Note that the assumption here is that PID is only turned on
  when going from stop to moving, that's why we can init everything on zero.
*/
void resetPID() {
  leftPID.TargetTicksPerFrame = 0.0;
  leftPID.Encoder = readEncoder(LEFT);
  leftPID.PrevEnc = leftPID.Encoder;
  leftPID.output = 0;
  leftPID.PrevInput = 0;
  leftPID.ITerm = 0;

  rightPID.TargetTicksPerFrame = 0.0;
  rightPID.Encoder = readEncoder(RIGHT);
  rightPID.PrevEnc = rightPID.Encoder;
  rightPID.output = 0;
  rightPID.PrevInput = 0;
  rightPID.ITerm = 0;

  backPID.TargetTicksPerFrame = 0.0;
  backPID.Encoder = readEncoder(BACK);
  backPID.PrevEnc = backPID.Encoder;
  backPID.output = 0;
  backPID.PrevInput = 0;
  backPID.ITerm = 0;
}

/* PID routine to compute the next motor commands */
void doPID(SetPointInfo * p) {
  long Perror;
  long output;
  int input;

  //Perror = p->TargetTicksPerFrame - (p->Encoder - p->PrevEnc);
  input = p->Encoder - p->PrevEnc;
  Perror = p->TargetTicksPerFrame - input;
//  Serial.println(input);


  /*
    Avoid derivative kick and allow tuning changes,
    see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-derivative-kick/
    see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-tuning-changes/
  */
  //output = (Kp * Perror + Kd * (Perror - p->PrevErr) + Ki * p->Ierror) / Ko;
  // p->PrevErr = Perror;
  output = (Kp * Perror - Kd * (input - p->PrevInput) + p->ITerm) / Ko;
  p->PrevEnc = p->Encoder;

  output += p->output;
  // Accumulate Integral error *or* Limit output.
  // Stop accumulating when output saturates
  if (output >= MAX_PWM)
    output = MAX_PWM;
  else if (output <= -MAX_PWM)
    output = -MAX_PWM;
  else
    /*
      allow turning changes, see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-tuning-changes/
    */
    p->ITerm += Ki * Perror;

  p->output = output;
  p->PrevInput = input;
}

void doPID_param(SetPointInfo * p, int t_Kp, int t_Ki, int t_Kd, int t_Ko) {
  long Perror;
  long output;
  int input;

  //Perror = p->TargetTicksPerFrame - (p->Encoder - p->PrevEnc);
  input = p->Encoder - p->PrevEnc;
  Perror = p->TargetTicksPerFrame - input;
//  Serial.println(input);


  /*
    Avoid derivative kick and allow tuning changes,
    see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-derivative-kick/
    see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-tuning-changes/
  */
  //output = (Kp * Perror + Kd * (Perror - p->PrevErr) + Ki * p->Ierror) / Ko;
  // p->PrevErr = Perror;
  output = (t_Kp * Perror - t_Kd * (input - p->PrevInput) + p->ITerm) / t_Ko;
  p->PrevEnc = p->Encoder;

  output += p->output;
  // Accumulate Integral error *or* Limit output.
  // Stop accumulating when output saturates
  if (output >= MAX_PWM)
    output = MAX_PWM;
  else if (output <= -MAX_PWM)
    output = -MAX_PWM;
  else
    /*
      allow turning changes, see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-tuning-changes/
    */
    p->ITerm += t_Ki * Perror;

  p->output = output;
  p->PrevInput = input;
}



/* Read the encoder values and call the PID routine */
void updatePID() {
  /* Read the encoders */
  leftPID.Encoder = readEncoder(LEFT);
  rightPID.Encoder = readEncoder(RIGHT);
  backPID.Encoder = readEncoder(BACK);

  /* If we're not moving there is nothing more to do */
  if (!moving) {
    /*
      Reset PIDs once, to prevent startup spikes,
      see http://brettbeauregard.com/blog/2011/04/improving-the-beginner%E2%80%99s-pid-initialization/
      PrevInput is considered a good proxy to detect
      whether reset has already happened
    */
    if (leftPID.PrevInput != 0 || rightPID.PrevInput != 0 || backPID.PrevInput != 0) resetPID();
    return;
  }

  /* Compute PID update for each motor */
  //doPID(&rightPID);
  //doPID(&leftPID);
  //doPID(&backPID);
  doPID_param(&rightPID, Kp_r, Ki_r, Kd_r, Ko_r);
  doPID_param(&leftPID, Kp_l, Ki_l, Kd_l, Ko_l);
  doPID_param(&backPID, Kp_b, Ki_b, Kd_b, Ko_b);
  
  /* Set the motor speeds accordingly */
  //  setMotorSpeeds(leftPID.output, rightPID.output);
  setThreeMotorSpeeds(leftPID.output, rightPID.output, backPID.output);
  //setThreeMotorSpeeds(leftPID.TargetTicksPerFrame, rightPID.TargetTicksPerFrame, backPID.TargetTicksPerFrame);
}
