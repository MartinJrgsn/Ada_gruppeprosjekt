package body MyServoDriver is

   protected body ServoDriver is
      
      procedure SetAngle (V : Angles) is
      begin
         ServoAngle := V;
      end SetAngle;
      
      function GetAngle return Angles is
      begin
         return ServoAngle;   
      end GetAngle;
      
      procedure SetServoPins (V : ServoControllerPins) is
      begin
         Pins := V;
      end SetServoPins;
      
      function GetServoPins return ServoControllerPins is
      begin
         return Pins;
      end GetServoPins;
      
   end ServoDriver;

end MyServoDriver;
