with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Servos; use MicroBit.Servos;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package body Sensor_Control is

   Task body Sensor_Read is
      Time_Now : Ada.Real_Time.Time;

      
   begin
      loop
         Time_Now := Ada.Real_Time.Clock;

         Go(10, 0);
         delay until Time_now + Ada.Real_Time.Milliseconds(200);
         Go(10, 45);
         delay until Time_now + Ada.Real_Time.Milliseconds(400);
         Go(10, 90);
         delay until Time_now + Ada.Real_Time.Milliseconds(600);
         Go(10, 135);
         delay until Time_now + Ada.Real_Time.Milliseconds(800);
         Go(10, 180);
         delay until Time_now + Ada.Real_Time.Milliseconds(1000);
         Go(10, 135);
         delay until Time_now + Ada.Real_Time.Milliseconds(1200);
         Go(10, 90);
         delay until Time_now + Ada.Real_Time.Milliseconds(1400);
         Go(10, 45);
         delay until Time_now + Ada.Real_Time.Milliseconds(1600);
         
         
         
         
         
         
         
         
--         Put_line("Sensor_Read");
  --       delay until Time_now + Ada.Real_Time.Seconds(1);
      end loop;
   end Sensor_Read;
end Sensor_Control;
