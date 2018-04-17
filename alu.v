module alu(opcode,reg1,reg2,out);

input [4:0] opcode ;
input [15:0] reg1,reg2;
output [15:0] out ;
reg [15:0] out ;

always @(*) 
begin
		case (opcode )
                        5'b00000:begin			//addition	                  
				out = reg1+reg2 ;
                        end	
                        5'b00001:begin			//subraction
				out = reg1+(~reg2)+1;
                        end
                        5'b00010:begin			//addition with carry
				out = reg1+reg2+1;
                        end
                        5'b00011:begin			//subtraction with borrow
				out = reg1+(~reg2);
                        end
                        5'b00100:begin			//multiplication
				out = reg1*reg2;                                
                        end
                        5'b00101:begin			//division
				out = reg1/reg2;
                        end
                        5'b00110:begin			//remainder
				out=reg1%reg2;
                        end
                        5'b00111:begin			//bitwise and
				out=reg1&reg2;
                        end
                        5'b01000:begin			//bitwise or
				out=reg1|reg2;
                        end
                        5'b01001:begin			//negation
				out=~reg1; 
                        end
                        5'b01010: begin			//shift one bit left
				out = reg1<<1;
                        end
                        5'b01011: begin			//shift one bit right
				out = reg1>>1;
			end
			5'b01100: begin			//rotate right
				out = (reg1 >> 1)|(reg1 << 15);
			end
			5'b01101:begin			//rotate left
				out = (reg1 << 1)|(reg1 >> 15);
			end
                       	5'b01110:begin			//increment
				out = reg1+1;                        
                        end
                        5'b01111:begin			//decrement
				out = reg1-1;
                        end
		endcase
end 
endmodule
