with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Time;


procedure Main is
   --Motor 1
   PIN_EN1 : constant Pin_Id := 0;
   PIN_IN1 : constant Pin_Id := 1;
   PIN_IN2 : constant Pin_Id := 2;
   --Motor 2
   PIN_EN2 : constant Pin_Id := 4;
   PIN_IN3 : constant Pin_Id := 5;
   PIN_IN4 : constant Pin_Id := 6;
   --Motor 3
   PIN_EN3 : constant Pin_Id := 7;
   PIN_IN5 : constant Pin_Id := 8;
   PIN_IN6 : constant Pin_Id := 9;
   --Motor 4
   PIN_EN4 : constant Pin_Id := 10;
   PIN_IN7 : constant Pin_Id := 11;
   PIN_IN8 : constant Pin_Id := 12;
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
