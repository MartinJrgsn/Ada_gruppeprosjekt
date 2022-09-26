with MicroBit.IOs; use MicroBit.IOs;

procedure Main is
   --Motor 1
   PIN_EN1 : constant Pin_Id := 0;
   PIN_IN1 : constant Pin_Id := 1;
   PIN_IN2 : constant Pin_Id := 2;
begin
   loop
      Write (PIN_EN1, 0);
      Write (PIN_IN1, 0);
      Write (PIN_IN2, 0);
   end loop;
end Main;
