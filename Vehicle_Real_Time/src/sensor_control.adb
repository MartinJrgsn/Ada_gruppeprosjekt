with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Servos; use MicroBit.Servos;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package body Sensor_Control is

   Task body Sensor_Read is
      Time_Now : Ada.Real_Time.Time;
      delay_counter : Integer := 100;
      delay_interval : Integer := 100;
      
   begin
      loop
         Time_Now := Ada.Real_Time.Clock;
         
         
         Go(10, 0);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 45);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 90);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 135);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 180);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 135);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 90);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         Go(10, 45);
         delay until Time_now + Ada.Real_Time.Milliseconds(delay_counter);
         delay_counter := delay_counter + delay_interval;
         
         delay_counter := delay_interval;
         end loop;
   end Sensor_Read;
end Sensor_Control;
