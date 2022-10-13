with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;--timer 0

package body Sensor_Control is

   Task body Sensor_Read is
      Time_Now : Ada.Real_Time.Time;
      
      Trigger : Analog_Value := 1;
      --Echo : Analog_Value;
      
      --Ulstrasonic sensor TRIGGER
      Trigger_Pin : constant Pin_Id := 1;
      --Ultrasonic sensor ECHO
      Echo_pin: constant Pin_Id := 0;
 
   begin
      MicroBit.IOsForTasking.Set_Analog_Period_Us(10000);
      loop
         Time_Now := Ada.Real_Time.Clock;
         
         Write(Trigger_Pin, Trigger);
         --Echo := Analog(Echo_pin); 
         --Put_Line(Analog_Value'Image (Echo));
         delay until Time_Now + Ada.Real_Time.Milliseconds(1000);
         
      end loop;
   end Sensor_Read;

end Sensor_Control;
