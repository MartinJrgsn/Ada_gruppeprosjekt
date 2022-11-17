With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
with MicroBit.Servos; use MicroBit.Servos;
--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with Ada.Execution_Time; use Ada.Execution_Time;

package body TaskAct is

   task body act is
      myClock : Time;  
      Time_Now_Stopwatch : Time;
      Time_Now_CPU : CPU_Time;
      Elapsed_Stopwatch : Time_Span;
      Elapsed_CPU : Time_Span;
   begin
      
      SetupMotors;
      SetupServo;

      
      loop
         myClock := Clock;
         Time_Now_CPU := Clock;
         Elapsed_Stopwatch := Time_Span_Zero;
         Elapsed_CPU := Time_Span_Zero;
         
         Drive(MotorDriver.GetDirection);
         --Drive(DiagonalBR);
         Rotate(ServoDriver.GetAngle);
         Elapsed_CPU := Clock - Time_Now_CPU;
         Elapsed_Stopwatch := Clock - Time_Now_Stopwatch;
         --Put_Line ("ACT: CPU time: " & To_Duration (Elapsed_CPU)'Image & " seconds");

         delay until myClock + Milliseconds(200);  --random period, but faster than 20 ms is no use because Set_Analog_Period_Us(20000) !
                                       --then no change is set in the acting task for at least 5x (and is wasting power to wake up and execute task!)
      
      end loop;
   end act;
   
   procedure SetupMotors is

      Pins : MotorControllerPins;
   begin
      Pins.LeftFrontSpeedEnA := 0; -- set you MB pins here. Note that some pins overlap with other M:B functions! See the Microbit package to inspect which function lives on which pin.
      Pins.LeftFrontPin1In1 := 6;
      Pins.LeftFrontPin2In2 := 7;
      Pins.LeftBackSpeedEnB := 0;
      Pins.LeftBackPin1In3 := 12; --skal byttes med 12
      Pins.LeftBackPin2In4 := 13; -- 13
        
      Pins.RightFrontSpeedEnA := 1;
      Pins.RightFrontPin1In1 := 2; --2
      Pins.RightFrontPin2In2 := 3; --3
      Pins.RightBackSpeedEnB := 1;
      Pins.RightBackPin1In3 := 14;
      Pins.RightBackPin2In4 := 15;
      
      MotorDriver.SetMotorPins(Pins);
      
      --For example set the PWM period, as you only need to do this once
      Set_Analog_Period_Us (20_000); --20 ms = 50 Hz, typical for many actuators. You can change this, check the motor behavior with an oscilloscope.
                         
      null;
   end;

   procedure SetupServo is
      Pins : ServoControllerPins;
   begin
      Pins.ServoEn := 11;
      
      ServoDriver.SetServoPins(Pins);
      
      Set_Analog_Period_Us (20_000);
      
      null;
   end;

   procedure Drive(Direction : Directions) is
      Instruction : DriveInstruction;
   begin
      case Direction is 
         when Forward => 
            Instruction.LeftFrontSpeed := 300; -- speed is dutycycle between 0 and 100% => so a value between 0 and 1023
            Instruction.LeftFrontPin1 := True;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 300;  
            Instruction.LeftBackPin1 := True;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 300; -- the speed of right front wheel is equal to the left front wheel. For traditional steering (eg turn left) the speed of left wheel is slower than right wheel 
            Instruction.RightFrontPin1 := True;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 300;
            Instruction.RightBackPin1 := True;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
         when Backward =>
            Instruction.LeftFrontSpeed := 1023; -- speed is dutycycle between 0 and 100% => so a value between 0 and 1023
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 1023;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 1023; -- the speed of right front wheel is equal to the left front wheel. For traditional steering (eg turn left) the speed of left wheel is slower than right wheel 
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 1023;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
         when Rightward =>
            Instruction.LeftFrontSpeed := 512; -- speed is dutycycle between 0 and 100% => so a value between 0 and 1023
            Instruction.LeftFrontPin1 := True;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 512;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 512; -- the speed of right front wheel is equal to the left front wheel. For traditional steering (eg turn left) the speed of left wheel is slower than right wheel 
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 512;
            Instruction.RightBackPin1 := True;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
         when Leftward =>
            Instruction.LeftFrontSpeed := 512; -- speed is dutycycle between 0 and 100% => so a value between 0 and 1023
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 512;  
            Instruction.LeftBackPin1 := True;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 512; -- the speed of right front wheel is equal to the left front wheel. For traditional steering (eg turn left) the speed of left wheel is slower than right wheel 
            Instruction.RightFrontPin1 := True;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 512;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
         when DiagonalFR => 
            Instruction.LeftFrontSpeed := 512;
            Instruction.LeftFrontPin1 := True;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 512;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := False;
           
            Instruction.RightFrontSpeed := 512; 
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := False; 
            Instruction.RightBackSpeed := 512;
            Instruction.RightBackPin1 := True;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
         when DiagonalFL => 
            Instruction.LeftFrontSpeed := 512;
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := False; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 512;  
            Instruction.LeftBackPin1 := True;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 512; 
            Instruction.RightFrontPin1 := True;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 512;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := False;

         when DiagonalBL => 
            Instruction.LeftFrontSpeed := 512;
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 512;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := False;
           
            Instruction.RightFrontSpeed := 512; 
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := False;
            Instruction.RightBackSpeed := 512;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;
            
         when DiagonalBR => 
            Instruction.LeftFrontSpeed := 512;
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := False; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 512;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 512; 
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 512;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := False;
            
         when RotateCCW => 
            Instruction.LeftFrontSpeed := 768; -- speed is dutycycle between 0 and 100% => so a value between 0 and 1023
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := not Instruction.LeftFrontPin1; -- the second pin is always the opposite of the first!
            Instruction.LeftBackSpeed := 768;  
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := not Instruction.LeftBackPin1;
           
            Instruction.RightFrontSpeed := 768; -- the speed of right front wheel is equal to the left front wheel. For traditional steering (eg turn left) the speed of left wheel is slower than right wheel 
            Instruction.RightFrontPin1 := True;
            Instruction.RightFrontPin2 := not Instruction.RightFrontPin1; 
            Instruction.RightBackSpeed := 768;
            Instruction.RightBackPin1 := True;
            Instruction.RightBackPin2 := not Instruction.RightBackPin1;

         when Stop => 
            Instruction.LeftFrontSpeed := 0;
            Instruction.LeftFrontPin1 := False;
            Instruction.LeftFrontPin2 := False; -- here the second pin is the same as pin 1 because when both are off (false) there is no power consumption (not tested this!)
            Instruction.LeftBackSpeed := 0;
            Instruction.LeftBackPin1 := False;
            Instruction.LeftBackPin2 := False;
            
            Instruction.RightFrontSpeed := 0;
            Instruction.RightFrontPin1 := False;
            Instruction.RightFrontPin2 := False; 
            Instruction.RightBackSpeed := 0;
            Instruction.RightBackPin1 := False;
            Instruction.RightBackPin2 := False;
        end case;
      
        ControlMotor(Instruction, MotorDriver.GetMotorPins);
            
   end Drive;
   
   procedure Rotate(Angle : Angles) is
      Instruction : ServoInstruction;
   begin
      case Angle is
         when Front_Back =>
            Instruction.ServoAngle := 100;
         when Left_Right =>
            Instruction.ServoAngle := 0;
         when Stop =>
            null;
      end case;
      
      ControlServo(Instruction, ServoDriver.GetServoPins);
      --Put_Line ("Angle is: " & Angles'Image (Angle));
   end Rotate;
   
   procedure ControlMotor(Instruction : DriveInstruction; Pins: MotorControllerPins) is
      

        
      begin
         --LEFT
         --front   
         MicroBit.IOsForTasking.Set(Pins.LeftFrontPin1In1, Instruction.LeftFrontPin1); --IN1
         MicroBit.IOsForTasking.Set(Pins.LeftFrontPin2In2, Instruction.LeftFrontPin2); --IN2
   
         --back
         MicroBit.IOsForTasking.Set(Pins.LeftBackPin1In3, Instruction.LeftBackPin1); --IN3
         MicroBit.IOsForTasking.Set(Pins.LeftBackPin2In4, Instruction.LeftBackPin2); --IN4
   
         --RIGHT
         --front
         MicroBit.IOsForTasking.Set(Pins.RightFrontPin1In1, Instruction.RightFrontPin1); --IN1
         MicroBit.IOsForTasking.Set(Pins.RightFrontPin2In2, Instruction.RightFrontPin2); --IN2

         --back
         MicroBit.IOsForTasking.Set(Pins.RightBackPin1In3, Instruction.RightBackPin1); --IN3
         MicroBit.IOsForTasking.Set(Pins.RightBackPin2In4, Instruction.RightBackPin2); --IN4
      
         --speed 
         MicroBit.IOsForTasking.Write (Pins.LeftFrontSpeedEnA, Instruction.LeftFrontSpeed); --left speed control ENA ENB 
         MicroBit.IOsForTasking.Write (Pins.RightFrontSpeedEnA, Instruction.RightFrontSpeed); --right speed control ENA ENB

         --note that we can drive each wheel individually as well if each wheel has a unique pin
         --the code above combines two wheels as they are wired on the same pin.
         --MicroBit.IOs.Write (Pins.LeftBackSpeedEnB, Instruction.LeftBackSpeed); --disabled since same pin as above
         --MicroBit.IOs.Write (Pins.RightBackSpeedEnB, Instruction.RightBackSpeed); --disabled since same pin as above
   end ControlMotor;
   
   procedure ControlServo(Instruction : ServoInstruction; Pins : ServoControllerPins) is

   begin
      if ServoDriver.GetAngle = Left_Right or ServoDriver.GetAngle = Front_Back then
         MicroBit.Servos.Go(Pin => Pins.ServoEn, Setpoint => Instruction.ServoAngle);
      end if;
      
      if ServoDriver.GetAngle = Stop then
         MicroBit.Servos.Stop(Pin => Pins.ServoEn);
      end if;


   end ControlServo;


end TaskAct;
