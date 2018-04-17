`include "instruction.v"
`include "registerfile.v"
`include "alu.v"

module processor(clock);

reg [4:0] pc;

reg [4:0] madd,padd ;
input clock;
reg [4:0] rsrc1,rsrc2,rdst,opcode,op;
reg [15:0] ar1,ar2;
reg mread  ,rr; 
reg [15:0]min,rin ;
wire [15:0] mout,aout,r1,r2 ;
wire [31:0] pout;
reg [31:0] ir ;
integer f , d , e , w ;

program p1(padd,pout);

alu a1(op,ar1,ar2,aout);

register reg1(rsrc1,rsrc2,rdst,rin,r1,r2,rr);

initial begin        //counter initialisation
pc = 0;
f = 1 ; 
d = 0 ; 
e = 0 ; 
w = 0 ;
rr = 1 ;
end 

always @(posedge clock) begin // instruction fetch
        
        #0 if(f) begin 
       
        padd = pc ;
        #1 ir = pout;   
        f = 0;
        d = 1 ;
        w=0;
        $display($time,"c; instruction =  %b\n",ir);
        end 

end

always @(posedge clock) begin        //decode
        
        #3 if (d) begin 
                rr = 1 ;
                opcode = ir [31:27] ;   // OPCODE 
		if(opcode==5'b10001)     //FOR JMP
		begin
		pc=pc+2;
		end
                rsrc1   = ir [26:22] ;   // RDST 
                rsrc2  = ir [21:17]   ;   // SRC1
                rdst  = ir [16:12]   ;   // SRC2
         $display($time,"c; opcode = %b   src1 = %b   rsrc2 = %b   dst = %b\n",opcode , rsrc1 ,rsrc2,rdst);
         e  = 1;
         d = 0;
         w=0;
         end
end 

always @(posedge clock) begin           //execute
        #4 if (e ) begin 
                 op = opcode;
                 ar1 = r1;
                 ar2 = r2;
                 w = 1;
                 e = 0;  
        #1 $display($time,"c; a = %b   b = %b   ans = %b\n",ar1, ar2 ,aout);
        end
end 

always @(posedge clock) begin      //write
        #6 if (w) begin 
            rr=0;
            rin = aout;
            w=0;
            #1  f=1;
            #1 pc = pc+1;
        end
end 

always @(posedge clock) begin            //for halt  
	if(opcode==5'b10000)
	begin
		forever
		begin
			wait(~pc);
		end
	end
end 

endmodule
