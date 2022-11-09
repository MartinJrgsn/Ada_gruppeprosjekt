package Vehicle_Control is

   --Task Emergency_Stop with Priority => 5;
   Task Control_Motors with Priority => 0;
   Task Control_LED with Priority => 1;

end Vehicle_Control;
