module register(reg1, reg2, rdst, in, out1, out2, rd);

   input[4:0] reg1, reg2, rdst;
   input [15:0] in;
   output [15:0] out1, out2;
   reg [15:0] out1, out2;
   input rd;

   reg [15:0] mem[15:0];

   initial begin	//memory to store preinitialised variables
		mem[0]=16'd1;
		mem[1]=16'd2;
		mem[2]=16'd3;
		mem[3]=16'd4;
		mem[4]=16'd5;
		mem[5]=16'd6;
		mem[6]=16'd7;
		mem[7]=16'd8;
		mem[8]=16'd9;
		mem[9]=16'd10;
		mem[10]=16'd11;
		mem[11]=16'd12;
		mem[12]=16'd13;
		mem[13]=16'd14;
		mem[14]=16'd15;
		mem[15]=16'd0;
	end // initial begin
   
	always @ (*) begin
		if(rd) begin	//read two elements from memory reg1 and reg2
			out1 <= mem[reg1];
			out2 <= mem[reg2];
		end
		else begin		//write into memory reg rdst
			mem[rdst] <= in;
		end
	end
endmodule 
