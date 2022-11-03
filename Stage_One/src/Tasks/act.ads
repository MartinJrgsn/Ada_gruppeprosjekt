with Motor_Driver; use Motor_Driver;

package Act is

   task Act with Priority => 3; -- Highest priority will be to act

   procedure SetupMotors;
   procedure Drive (direction : Directions);
   procedure ControlMotor(Instruction : DriveInstruction; Pins : MotorControllerPins);

end Act;
