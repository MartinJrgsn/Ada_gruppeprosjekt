with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.DisplayRT; use MicroBit.DisplayRT;
with MicroBit.IOsForTasking;  use MicroBit.IOsForTasking;

procedure Main is
begin
   loop
      --Put_Line ("Serial: Hello Ravenscar!"); -- open a serial port to see this message

      --Scroll_Text("Joachim"); --what happens if we have a longer text?

      write(2, 512);

      delay until Clock + Milliseconds (1000);
   end loop;
end Main;
