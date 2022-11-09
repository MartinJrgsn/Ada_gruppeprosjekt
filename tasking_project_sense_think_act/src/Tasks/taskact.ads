with MyMotorDriver; use MyMotorDriver;
with MyServoDriver; use MyServoDriver;

package TaskAct is

   task Act with Priority=> 3;

   --Drive motors
   procedure SetupMotors;
   procedure Drive (direction : Directions);
   procedure ControlMotor(Instruction : DriveInstruction; Pins : MotorControllerPins);
   
   --Servo for ultrasonic spinnamagikk
   procedure SetupServo;
   procedure Rotate (angle : Angles);
   procedure ControlServo(Instruction : ServoInstruction; Pins : ServoControllerPins);
   
end TaskAct;
