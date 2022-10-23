with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;

package body Sensor_Control is

   Task body Sensor_Read is
      Time_Now : Ada.Real_Time.Time;
      
   begin
      loop
         Time_Now := Ada.Real_Time.Clock;
         Put_line("Sensor_Read");
         delay until Time_now + Ada.Real_Time.Seconds(1);
      end loop;
   end Sensor_Read;
end Sensor_Control;
