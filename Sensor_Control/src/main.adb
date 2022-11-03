with MicroBit.Console; use MicroBit.Console;
with Sensor_Control;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main with priority => 0 is
   Time_Now : Ada.Real_Time.Time;


begin
   loop
      Time_Now := Ada.Real_Time.Clock;

      --Put_Line("Main");

      --delay until Time_Now + Ada.Real_Time.Seconds(1);
   end loop;
end Main;
