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
         
         
         
         
         --if ServoDriver.GetAngle = Front_Back then
         
         ServoDriver.SetAngle (Left_Right);
         --end if;
         
         delay until myClock + Milliseconds(100);
         
         

         ServoDriver.SetAngle (Front_Back);
         --delay until myClock + Milliseconds(200);
         -- leser distance
         -- ny delay for å prosesere lesing av distance
         --if (back) < 20 cm && front > 20 cm kjør frem
         
         
         
         -- ny rotering
         delay until myClock + Milliseconds(200);
      end loop;
   end think;


end TaskThink;
