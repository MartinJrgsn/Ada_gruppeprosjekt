with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;

package body Vehicle_Control is

   Task body Control_Motors is
      Time_Now : Ada.Real_Time.Time;
      On : Boolean := True;
      Speed : Analog_Value := 512;
      
      counter : Integer := 0;
      
      --Motor PWM signal
      PIN_EN_A : constant Pin_Id := 0;
      PIN_EN_B : constant Pin_Id := 1;
      --Motor 1 (FL)
      PIN_IN1 : constant Pin_Id := 6;
      PIN_IN2 : constant Pin_Id := 7;
      --Motor 2 (FR)
      PIN_IN3 : constant Pin_Id := 2;
      PIN_IN4 : constant Pin_Id := 3;
      --Motor 3 (RL)
      PIN_IN5 : constant Pin_Id := 12;
      PIN_IN6 : constant Pin_Id := 13;
      --Motor 3 (RR)
      PIN_IN7 : constant Pin_Id := 14;
      PIN_IN8 : constant Pin_Id := 15;
   begin
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000);
      loop
         Time_Now := Ada.Real_Time.Clock;
         --Forward
         set(PIN_IN1, On);
         set(PIN_IN2, not On);
         set(PIN_IN3, On);
         set(PIN_IN4, not On);
         set(PIN_IN5, On);
         set(PIN_IN6, not On);
         set(PIN_IN7, On);
         set(PIN_IN8, not On);

         Write(PIN_EN_A, Speed);
         Write(PIN_EN_B, Speed);
         
         counter := counter + 1;
         if counter mod 300 = 0 then
            Put_Line("Control_Motors = modulo");
         end if;
         
         delay until Time_Now + Ada.Real_Time.Milliseconds(10);
      end loop;
   end Control_Motors;
   
   Task body Control_LED is
      Time_Now_2 : Ada.Real_Time.Time;
      PIN_LED : constant Pin_Id := 4;
   begin
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000);
      loop
         Time_Now_2 := Ada.Real_Time.Clock;
         Set(PIN_LED, False);
         --for Value in Analog_Value range 0 .. 256 loop
          --  Write(PIN_LED, Value);
          --  delay until Time_Now + Ada.Real_Time.Milliseconds(1000);
         --end loop;
         delay until Time_Now_2 + Ada.Real_Time.Milliseconds(500);
         Set(PIN_LED, True);
         delay until Time_Now_2 + Ada.Real_Time.Milliseconds(1000);
      end loop;
   end Control_LED;
   
   
end Vehicle_Control;
