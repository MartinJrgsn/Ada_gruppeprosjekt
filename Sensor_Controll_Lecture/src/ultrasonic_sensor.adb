With MicroBit.Console; use MicroBit.Console;
With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with nRF.Clock;     use nRF.Clock;

package body Ultrasonic_Sensor is

   Task body Read_Ultrasonic_Sensor is 
      Time_Now : Ada.Real_Time.Time;
      Trigger : Analog_Value := 10;
      Echo : Analog_Value := 0;
      
      Trigger_Pin : constant Pin_Id := 0;
      Echo_Pin : constant Pin_Id := 1;
      
      --Value : constant MicroBit.IOsForTasking.Analog_Value := 10;
      
   begin
      --Enable the High Frequency clock on the processor. This is a pre-requisite for
	   --the RADIO module. Without this clock, no communication is possible.
      Set_High_Freq_Source (HFCLK_XTAL);
      Start_High_Freq;
      while not High_Freq_Running loop
         null;
      end loop;

      
      MicroBit.IOsForTasking.Set_Analog_Period_Us(1000);
      MicroBit.IOsForTasking.Write(Trigger_Pin, Trigger); -- Trigger
     
      loop
         Time_Now := Ada.Real_Time.Clock;
         
         --MicroBit.IOsForTasking.Write(Trigger_Pin, Trigger); -- Trigger
         --Echo := MicroBit.IOsForTasking.Analog(Echo_Pin); -- Echo
         --MicroBit.Console.Put_Line(Str => Analog_Value'Image(Echo));
         delay until Time_Now + Ada.Real_Time.Seconds(2);
         
      end loop;
      
   end Read_Ultrasonic_Sensor;
   
end Ultrasonic_Sensor;
