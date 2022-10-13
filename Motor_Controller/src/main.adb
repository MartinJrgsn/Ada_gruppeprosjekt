With MicroBit.Console; use MicroBit.Console;
With Motor_Controller;
With Ada.Real_Time; use Ada.Real_Time;

procedure Main with Priority => 0 is
   Time_Now : Ada.Real_Time.Time;

begin
   loop
      Time_Now := Ada.Real_Time.Clock;

      Put_Line("Main"); -- Do something

      delay until Time_Now + Ada.Real_Time.Seconds(1); -- Set T = 2 seconds
   end loop;
end Main;
