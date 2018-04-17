`include "control.v"

module processor_tb;

   reg 	 clock;

   processor p(clock);

   initial
     clock = 1'b1;
     
   always begin
     #1 clock = ~clock;
     end
     
   initial
     #400 $finish;         //processor runs for 400 cycles but since last instruction is halt, the extra cycles wont execute
     
   
endmodule 
