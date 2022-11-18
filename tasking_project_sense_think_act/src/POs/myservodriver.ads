with MicroBit.Servos; use MicroBit.Servos;
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package MyServoDriver is
   
   -- Add extra preset rotation positions here
   type Angles is (Front_Back, Left_Right, Stop);

   type ServoInstruction is record
      ServoAngle : Servo_Set_Point;
   end record;
   
   type ServoControllerPins is record
      ServoEn : Pin_Id;
   end record;
   
   protected ServoDriver is
      
      function GetAngle return Angles;
      function GetServoPins return ServoControllerPins;
      
      procedure SetServoPins (V : ServoControllerPins);
      procedure SetAngle (V : Angles);
   private
      --Set start position of servo
      ServoAngle : Angles := Front_Back;
      Pins : ServoControllerPins;
   end ServoDriver;
   
end MyServoDriver;
