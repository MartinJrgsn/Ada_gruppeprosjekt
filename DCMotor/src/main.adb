with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Time;

procedure Main is
   --Motor 1 (FR)
   PIN_EN1 : constant Pin_Id := 0;
   PIN_IN1 : constant Pin_Id := 11;
   PIN_IN2 : constant Pin_Id := 12;
   --Motor 2 (FL)
   PIN_EN2 : constant Pin_Id := 1;
   PIN_IN3 : constant Pin_Id := 13;
   PIN_IN4 : constant Pin_Id := 14;

begin
   loop
      --Initial direction
      --Motor 1
      Set (PIN_IN1, False);
      Set (PIN_IN2, True);
      --Motor 2
      Set (PIN_IN3, False);
      Set (PIN_IN4, True);


      --For loop for testing purposes.
      --(Fading LED to check wheter flash is successfull)
      for Value in Analog_Value range 0 .. 256 loop
         Write (10, Value);
         MicroBit.Time.Delay_Ms(5);
      end loop;
   end loop;
end Main;
