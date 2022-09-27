with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Time;

procedure Main is
   --Shared PWM (Direction can still be changed individually, and 1 motor can also be stopped)
   --Max simultaneous analog write=3
   PIN_EN_FL_RR : constant Pin_Id := 0;
   PIN_EN_FR_RL : constant Pin_Id := 1;
   --Motor 1 (FL)
   PIN_IN1 : constant Pin_Id := 11;
   PIN_IN2 : constant Pin_Id := 12;
   --Motor 2 (FR)
   PIN_IN3 : constant Pin_Id := 13;
   PIN_IN4 : constant Pin_Id := 14;
   --Motor 3 (RL)
   PIN_IN5 : constant Pin_Id := 15;
   PIN_IN6 : constant Pin_Id := 16;
   --Motor 3 (RR)
   PIN_IN7 : constant Pin_Id := 19;
   PIN_IN8 : constant Pin_Id := 20;

   --States
   Forward : Boolean := True;
   Backward : Boolean := False;
   Sideways_R : Boolean := False;
   Sideways_L : Boolean := False;
   Diagonal_FR : Boolean := False;
   Diagonal_FL : Boolean := False;
   Diagonal_RR : Boolean := False;
   Diagonal_RL : Boolean := False;


begin
   loop
      --Initial direction
      --Motor 1 (FL)
      Set (PIN_IN1, False);
      Set (PIN_IN2, True);
      --Motor 2 (FR)
      Set (PIN_IN3, False);
      Set (PIN_IN4, True);
      --Motor 3 (RL)
      Set (PIN_IN5, False);
      Set (PIN_IN6, True);
      --Motor 4 (RR)
      Set (PIN_IN7, False);
      Set (PIN_IN8, True);

      --Simple Statemachine for testing movement
      if Forward then
         --Motor 1 (FL)
         Set (PIN_IN1, False);
         Set (PIN_IN2, True);
         --Motor 2 (FR)
         Set (PIN_IN3, False);
         Set (PIN_IN4, True);
         --Motor 3 (RL)
         Set (PIN_IN5, False);
         Set (PIN_IN6, True);
         --Motor 4 (RR)
         Set (PIN_IN7, False);
         Set (PIN_IN8, True);
      elsif Backward then
         --Motor 1 (FL)
         Set (PIN_IN1, True);
         Set (PIN_IN2, False);
         --Motor 2 (FR)
         Set (PIN_IN3, True);
         Set (PIN_IN4, False);
         --Motor 3 (RL)
         Set (PIN_IN5, True);
         Set (PIN_IN6, False);
         --Motor 4 (RR)
         Set (PIN_IN7, True);
         Set (PIN_IN8, False);
      elsif Sideways_R then
         --Motor 1 (FL)
         Set (PIN_IN1, False);
         Set (PIN_IN2, True);
         --Motor 2 (FR)
         Set (PIN_IN3, True);
         Set (PIN_IN4, False);
         --Motor 3 (RL)
         Set (PIN_IN5, True);
         Set (PIN_IN6, False);
         --Motor 4 (RR)
         Set (PIN_IN7, False);
         Set (PIN_IN8, True);
      elsif Sideways_L then
         --Motor 1 (FL)
         Set (PIN_IN1, True);
         Set (PIN_IN2, False);
         --Motor 2 (FR)
         Set (PIN_IN3, False);
         Set (PIN_IN4, True);
         --Motor 3 (RL)
         Set (PIN_IN5, False);
         Set (PIN_IN6, True);
         --Motor 4 (RR)
         Set (PIN_IN7, True);
         Set (PIN_IN8, False);
      elsif Diagonal_FR then
         --Motor 1 (FL)
         Set (PIN_IN1, False);
         Set (PIN_IN2, True);
         --Motor 2 (FR)
         Set (PIN_IN3, False);
         Set (PIN_IN4, False);
         --Motor 3 (RL)
         Set (PIN_IN5, False);
         Set (PIN_IN6, False);
         --Motor 4 (RR)
         Set (PIN_IN7, False);
         Set (PIN_IN8, True);
      elsif Diagonal_FL then
         --Motor 1 (FL)
         Set (PIN_IN1, False);
         Set (PIN_IN2, False);
         --Motor 2 (FR)
         Set (PIN_IN3, False);
         Set (PIN_IN4, True);
         --Motor 3 (RL)
         Set (PIN_IN5, False);
         Set (PIN_IN6, True);
         --Motor 4 (RR)
         Set (PIN_IN7, False);
         Set (PIN_IN8, False);
      elsif Diagonal_RR then
         --Motor 1 (FL)
         Set (PIN_IN1, False);
         Set (PIN_IN2, False);
         --Motor 2 (FR)
         Set (PIN_IN3, True);
         Set (PIN_IN4, False);
         --Motor 3 (RL)
         Set (PIN_IN5, True);
         Set (PIN_IN6, False);
         --Motor 4 (RR)
         Set (PIN_IN7, False);
         Set (PIN_IN8, False);
      elsif Diagonal_RL then
         --Motor 1 (FL)
         Set (PIN_IN1, True);
         Set (PIN_IN2, False);
         --Motor 2 (FR)
         Set (PIN_IN3, False);
         Set (PIN_IN4, False);
         --Motor 3 (RL)
         Set (PIN_IN5, False);
         Set (PIN_IN6, False);
         --Motor 4 (RR)
         Set (PIN_IN7, True);
         Set (PIN_IN8, False);


      end if;



      --For loop for testing purposes.
      --(Fading LED to check wheter flash is successfull)
      for Value in Analog_Value range 0 .. 256 loop
         --Write (PIN_EN1, Value);
         --Write (PIN_EN2, Value);
         --Write (PIN_EN3, Value);
         --Write (PIN_EN4, Value);
         --MicroBit.Time.Delay_Ms(5);
      end loop;
   end loop;
end Main;
