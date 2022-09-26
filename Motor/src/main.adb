with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Time;


procedure Main is
   --Motor 1
   PIN_ENA : constant Pin_Id := 0;
   PIN_IN1 : constant Pin_Id := 1;
   PIN_IN2 : constant Pin_Id := 2;
   --Motor 2
   PIN_ENB : constant Pin_Id := 0;
   PIN_IN3 : constant Pin_Id := 1;
   PIN_IN4 : constant Pin_Id := 2;

begin

   loop
      Write (PIN_IN1, 0);
      Write (PIN_IN2, 1023);
      for Value in Analog_Value range 370 .. 1023 loop
         Write (PIN_ENA, Value);
         MicroBit.Time.Delay_Ms (20);
         end loop;
   end loop;
end Main;
