With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;

package Ultrasonic_2 is

   type Distance_2_cm is range 0 .. 400; -- if < 2 it is invalid
   
   function Read return Distance_2_cm;
   
   procedure SendTriggerPulse;
   
   procedure Setup (trigger_pin : Pin_Id; echo_pin : Pin_Id);
   
   function WaitForEcho return Integer;
   
   function ConvertEchoToDistance (echo_time_us : Integer) return Distance_2_cm;
end Ultrasonic_2;
