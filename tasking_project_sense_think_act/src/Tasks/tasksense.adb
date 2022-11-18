With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with Ultrasonic; use Ultrasonic;
with Ultrasonic_2; use Ultrasonic_2;
with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskSense is

    task body sense is
      myClock : Time;
      --Time_Now_Stopwatch : Time;
      --Time_Now_CPU : CPU_Time;
      --Elapsed_Stopwatch : Time_Span;
      --Elapsed_CPU : Time_Span;
   begin
      Ultrasonic.Setup(4,5);
      Ultrasonic_2.Setup(10,19);
      loop
         myClock := Clock;
         --Elapsed_Stopwatch := Time_Span_Zero;
         --Elapsed_CPU := Time_Span_Zero;
         --Time_Now_Stopwatch := Clock;
         --Time_Now_CPU := Clock;
         
         Brain.SetMeasurementSensor1 (Integer'Value(Ultrasonic.Read'Image)); -- random value, hook up a sensor here!
         --Put_Line ("Read sensor 1" & Integer'Image(Brain.GetMeasurementSensor1)); -- a console line delay the loop significantly
         
         Brain.SetMeasurementSensor2 (Integer'Value(Ultrasonic_2.Read'Image));
         --Put_Line ("Read sensor 2" & Integer'Image(Brain.GetMeasurementSensor2));

         --Elapsed_CPU := Clock - Time_Now_CPU;
         --Elapsed_Stopwatch := Clock - Time_Now_Stopwatch;
         --Put_Line ("Sense CPU time: " & To_Duration (Elapsed_CPU)'Image & " seconds");
         --Put_Line ("Sense Stopwatch time: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds");
         delay until myClock + Milliseconds(80); --random period
      end loop;
   end sense;

end TaskSense;
