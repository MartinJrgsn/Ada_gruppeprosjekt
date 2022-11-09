With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with Ultrasonic; use Ultrasonic;
with Ultrasonic_2; use Ultrasonic_2;

package body TaskSense is

    task body sense is
      myClock : Time;
   begin
      Ultrasonic.Setup(4,5);
      Ultrasonic_2.Setup(10,19);
      loop
         myClock := Clock; --important to get current time such that the period is exactly 200ms.
                           --you need to make sure that the instruction NEVER takes more than this period. 
                           --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
                           --What if for some known or unknown reason the execution time becomes larger?
                           --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
                           --In this template we put the responsiblity on the designer/developer.
         
         
         Brain.SetMeasurementSensor1 (Integer'Value(Ultrasonic.Read'Image)); -- random value, hook up a sensor here!
         Put_Line ("Read sensor 1" & Integer'Image(Brain.GetMeasurementSensor1)); -- a console line delay the loop significantly
         
         Brain.SetMeasurementSensor2 (Integer'Value(Ultrasonic_2.Read'Image));
         Put_Line ("Read sensor 2" & Integer'Image(Brain.GetMeasurementSensor2));
            
         delay until myClock + Milliseconds(200); --random period
      end loop;
   end sense;

end TaskSense;
