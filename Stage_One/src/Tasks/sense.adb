with Ada.Real_Time; use Ada.Real_Time;
with Ultrasonic; use Ultrasonic;
with MicroBit.Console; use MicroBit.Console;
with Car_Brain; use Car_Brain;

package body Sense is

   task body sense is
      myClock : Time;
   begin
      loop
         myClock := Clock; --important to get current time such that the period is exactly 200ms.
                           --you need to make sure that the instruction NEVER takes more than this period. 
                           --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
                           --What if for some known or unknown reason the execution time becomes larger?
                           --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
                           --In this template we put the responsiblity on the designer/developer.
         delay (0.024); --simulate a sensor eg the ultrasonic sensors needs at least 24ms for 400cm range.
         Brain.SetMeasurementSensor1 (10); -- random value, hook up a sensor here!
         Brain.SetMeasurementSensor2 (1);
            
         delay until myClock + Milliseconds(200); --random period
      end loop;
   end sense;
   
   
   -- This is commented out, but will possibly be part of the task body sense above 
--   Task body Sense is
--      Distance : Distance_cm;
--   begin
--      setup(trigger_pin => 14,
--            echo_pin    => 15);
--      loop
--         myclock := Clock;
--         Distance := Read;
--         Car_Brain.SetUltrasonic(Distance);
--         Put_Line("Read is: " & Distance'Image);
--         delay until myclock + Milliseconds(50); -- Figure out how many milliseconds for 400cm
--      end loop;
--      
--   end Sense;
   

end Sense;
