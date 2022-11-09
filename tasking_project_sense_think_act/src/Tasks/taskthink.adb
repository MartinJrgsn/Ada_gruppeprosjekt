With Ada.Real_Time; use Ada.Real_Time;

package body TaskThink is

  task body think is
      myClock : Time;
      servoInterval : Integer := 2000;
      intervalCounter : Integer := 0;
   begin
      loop
         myClock := Clock;

         
         
         --make a decision (could be wrapped nicely in a procedure)
         if Brain.GetMeasurementSensor1 > 5 and Brain.GetMeasurementSensor2 > 5 then            
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values        
         else
            MotorDriver.SetDirection (Stop); 
         end if;
         
         
         ServoDriver.SetAngle (Front_Back);
         delay until myClock + Milliseconds(100);  --random period
         
         
         ServoDriver.SetAngle (Left_Right);
         delay until myClock + Milliseconds(200);  --random period
         
      end loop;
   end think;


end TaskThink;
