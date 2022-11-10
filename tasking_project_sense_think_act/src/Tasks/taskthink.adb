With Ada.Real_Time; use Ada.Real_Time;

package body TaskThink is

  task body think is
      myClock : Time;
      Rotate_Time : Integer := 100;
      Read_Time : Integer := 60;
      
      Stop_Distance : Integer := 20;
      Ignore_Distance : Integer := 30;
      
      
      Distance_Front, Distance_Right, Distance_Back, Distance_Left : Integer := 0;
   begin
      loop
         myClock := Clock;

         --make a decision (could be wrapped nicely in a procedure)
         -- If front is clear, drive front, if back is clear, drive back, etc.
         
         -- Rotating Front_Back, reading and overwriting distance variables
         
         ServoDriver.SetAngle(V => Front_Back);
         delay until myClock + Milliseconds (Rotate_Time); -- The time it takes to rotate and stop
         
         Distance_Front := Brain.GetMeasurementSensor1;
         Distance_Back := Brain.GetMeasurementSensor2;
         
         delay until myClock + Milliseconds (Rotate_Time+Read_Time); -- The time it takes to read and overwrite previous Distance Front & Back
         
         if Distance_Front > Distance_Back and Distance_Front > Distance_Left then
            MotorDriver.SetDirection(V => Forward);
         elsif Distance_Back > Distance_Front and Distance_Back > Distance_Left then
            MotorDriver.SetDirection(V => Backward);
         end if;
         delay until myClock + Milliseconds(Rotate_Time+Read_Time+30);
         
         -- Rotating Front_Back; reading and overwriting distance variables.
         
         ServoDriver.SetAngle(V => Left_Right);
         delay until myClock + Milliseconds (2*Rotate_Time + Read_Time); -- The time it takes to rotate and stop
         
         Distance_Left := Brain.GetMeasurementSensor1;
         Distance_Right := Brain.GetMeasurementSensor2;
         delay until myClock + Milliseconds (2*Rotate_Time + 2*Read_Time); -- The time it takes to read and overwrite previous Distance Front & Back
         
         if Distance_Left > Distance_Right and Distance_Left > Distance_Front then
            MotorDriver.SetDirection(V => Leftward);
         elsif Distance_Right > Distance_Left and Distance_Left > Distance_Front then
            MotorDriver.SetDirection(V => Rightward);
         end if;
         delay until myClock + Milliseconds(Rotate_Time+Read_Time+60);
           
      end loop;
   end think;


end TaskThink;
