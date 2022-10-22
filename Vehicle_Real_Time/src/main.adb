with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main with priority => 0 is
   Time_now : Ada.Real_Time.Time;

begin
   loop
      Time_now := Ada.Real_Time.Clock;
      Put_line("Main");
      delay until Time_now + Ada.Real_Time.Seconds(1);
   end loop;
end Main;
