with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;--timer 0

package body Motor_Controller is

   Task body Drive is
      Time_Now : Ada.Real_Time.Time;
      On : Boolean := True;
      Speed : Analog_Value := 512;
      
      --Motor PWM signal
      PIN_EN_A : constant Pin_Id := 0;
      PIN_EN_B : constant Pin_Id := 1;
      --Motor 1 (FL)
      PIN_IN1 : constant Pin_Id := 6;
      PIN_IN2 : constant Pin_Id := 7;
      --Motor 2 (FR)
      PIN_IN3 : constant Pin_Id := 8;
      PIN_IN4 : constant Pin_Id := 9;
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
         
         
         delay until Time_Now + Ada.Real_Time.Seconds(2);
         --Sideways L
         set(PIN_IN1, not On);
         set(PIN_IN2, On);
         set(PIN_IN3, On);
         set(PIN_IN4, not On);
         set(PIN_IN5, On);
         set(PIN_IN6, not On);
         set(PIN_IN7, not On);
         set(PIN_IN8, On);         
         
         delay until Time_Now + Ada.Real_Time.Seconds(4);
         --Backwards
         On := false;
         set(PIN_IN1, On);
         set(PIN_IN2, not On);
         set(PIN_IN3, On);
         set(PIN_IN4, not On);
         set(PIN_IN5, On);
         set(PIN_IN6, not On);
         set(PIN_IN7, On);
         set(PIN_IN8, not On);
         
         delay until Time_Now + Ada.Real_Time.Seconds(6);
         --Sideways R
         set(PIN_IN1, not On);
         set(PIN_IN2, On);
         set(PIN_IN3, On);
         set(PIN_IN4, not On);
         set(PIN_IN5, On);
         set(PIN_IN6, not On);
         set(PIN_IN7, not On);
         set(PIN_IN8, On);
         
         delay until Time_Now + Ada.Real_Time.Seconds(8);
         On := true;
      end loop;
   end Drive;

end Motor_Controller;
