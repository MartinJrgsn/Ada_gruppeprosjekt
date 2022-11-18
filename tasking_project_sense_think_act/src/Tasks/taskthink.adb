With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskThink is

  task body think is
      myClock : Time;
      --Time_Now_Stopwatch : Time;
      --Time_Now_CPU : CPU_Time;
      --Elapsed_Stopwatch : Time_Span;
      --Elapsed_CPU : Time_Span;
      
      --Variables
      Rotate_Time : Integer := 300;
      Read_Time : Integer := 100;
      Stop_Distance : Integer := 40;
      Angle_direction : Boolean:= False;
      Distance_Front, Distance_Right, Distance_Back, Distance_Left : Integer := 0;
      Turn_Around_Clock : time;
      Turn_Around_Counter : Integer := 0;
   begin
      loop
         myClock := Clock;
         --Elapsed_Stopwatch := Time_Span_Zero;
         --Elapsed_CPU := Time_Span_Zero;
         --Time_Now_Stopwatch := Clock;
         --Time_Now_CPU := Clock;

         if Angle_direction then
            ServoDriver.SetAngle(V => Left_Right);
            delay until myClock + Milliseconds (Rotate_Time);
            Distance_Right := Brain.GetMeasurementSensor1;
            Distance_Left := Brain.GetMeasurementSensor2;
            Angle_direction := False;
         elsif not Angle_direction then
            ServoDriver.SetAngle(V => Front_Back);
            delay until myClock + Milliseconds (Rotate_Time);
            Distance_Front := Brain.GetMeasurementSensor1;
            Distance_Back := Brain.GetMeasurementSensor2;
            Angle_direction := True;
         end if;

         delay until myClock + Milliseconds (Rotate_Time+Read_Time); -- The time it takes to read and overwrite previous Distance Front & Back
         
         --minst sannsynlige først
         if Distance_Front < Stop_Distance and Distance_Right < (Stop_Distance-10) then
            MotorDriver.SetDirection(V => DiagonalBL);
         elsif Distance_Front < Stop_Distance and Distance_Left < (Stop_Distance-10) then
            MotorDriver.SetDirection(V => DiagonalBR);
         elsif Distance_Back < Stop_Distance and Distance_Left < (Stop_Distance-10) then
            MotorDriver.SetDirection(V => DiagonalFR);
         elsif Distance_Back < Stop_Distance and Distance_Right < (Stop_Distance-10) then
            MotorDriver.SetDirection(V => DiagonalFL);
         elsif Distance_Front < Stop_Distance then
            MotorDriver.SetDirection(V => Backward);
         elsif Distance_Back < Stop_Distance then
            MotorDriver.SetDirection(V => Forward);
            Turn_Around_Clock := Clock;
         elsif Distance_Right < Stop_Distance then
            MotorDriver.SetDirection(V => Leftward);
         elsif Distance_Left < Stop_Distance then
            MotorDriver.SetDirection(V => Rightward);
         else
            MotorDriver.SetDirection(V => Forward);
            Turn_Around_Clock := Clock;
         end if;

         --If setting direction to forward three times in short time, then rotate CCW
         if (Turn_Around_Clock - myClock) < Milliseconds(60) then
            Turn_Around_Counter := Turn_Around_Counter + 1;
            if Turn_Around_Counter mod 3 = 0 then
               MotorDriver.SetDirection(V => RotateCCW);
            end if;
         end if;

         --Elapsed_CPU := Clock - Time_Now_CPU;
         --Elapsed_Stopwatch := Clock - Time_Now_Stopwatch;
         --Put_Line ("THINK: CPU time: " & To_Duration (Elapsed_CPU)'Image & " seconds");
         --Put_Line ("THINK: Stopwatch time: " & To_Duration (Elapsed_Stopwatch)'Image & " seconds");
         
         delay until myClock + Milliseconds(Rotate_Time+Read_Time+30);
      end loop;
      
   end think;
   
end TaskThink;
