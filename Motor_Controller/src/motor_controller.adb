With MicroBit.Console; use MicroBit.Console;
With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package body Motor_Controller is

   Task body Drive is 
         
      --Shared PWM (Direction and start/stop can still be changed individually)
      --All motors, if they are engaged, will rotate at same RPM
      --Max simultaneous analog write=3
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
      
      --Options
      Time_Now : Ada.Real_Time.Time;
      On : Boolean := True;
      Speed : Analog_Value := 800;
   
   begin
      
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20000);
      loop 
         -- Forward for 2 seconds
         Time_Now := Ada.Real_Time.Clock;
         --Motor 1 (FL)
         Set (PIN_IN1, On);
         Set (PIN_IN2, not On);
         --Motor 2 (FR)
         Set (PIN_IN3, On);
         Set (PIN_IN4, not On);
         --Motor 3 (RL)
         Set (PIN_IN5, On);
         Set (PIN_IN6, not On);
         --Motor 4 (RR)
         Set (PIN_IN7, On);
         Set (PIN_IN8, not On);
         
         write(0, speed);
         write(1, speed);
       
         delay until Time_Now + Ada.Real_Time.Seconds(2); -- Set T = 1 seconds
         
         -- Right for 2 seconds
         Time_Now := Ada.Real_Time.Clock;
         --Motor 1 (FL)
         Set (PIN_IN1, On);
         Set (PIN_IN2, not On);
         --Motor 2 (FR)
         Set (PIN_IN3, On);
         Set (PIN_IN4, not On);
         --Motor 3 (RL)
         Set (PIN_IN5, On);
         Set (PIN_IN6, not On);
         --Motor 4 (RR)
         Set (PIN_IN7, On);
         Set (PIN_IN8, not On);
         
         write(0, speed);
         write(1, speed);
       
         delay until Time_Now + Ada.Real_Time.Seconds(2); -- Set T = 1 seconds
         
         -- Backward for 2 seconds
         Time_Now := Ada.Real_Time.Clock;
         --Motor 1 (FL)
         Set (PIN_IN1, not On);
         Set (PIN_IN2, On);
         --Motor 2 (FR)
         Set (PIN_IN3, not On);
         Set (PIN_IN4, On);
         --Motor 3 (RL)
         Set (PIN_IN5, not On);
         Set (PIN_IN6, On);
         --Motor 4 (RR)
         Set (PIN_IN7, not On);
         Set (PIN_IN8, On);
         
         write(0, speed);
         write(1, speed);
       
         delay until Time_Now + Ada.Real_Time.Seconds(2); -- Set T = 1 seconds
         
         -- Left for 2 seconds
         Time_Now := Ada.Real_Time.Clock;
         --Motor 1 (FL)
         Set (PIN_IN1, On);
         Set (PIN_IN2, not On);
         --Motor 2 (FR)
         Set (PIN_IN3, On);
         Set (PIN_IN4, not On);
         --Motor 3 (RL)
         Set (PIN_IN5, On);
         Set (PIN_IN6, not On);
         --Motor 4 (RR)
         Set (PIN_IN7, On);
         Set (PIN_IN8, not On);
         
         write(0, speed);
         write(1, speed);
       
         delay until Time_Now + Ada.Real_Time.Seconds(2); -- Set T = 1 seconds
 
      end loop;
   end Drive;

end Motor_Controller;
