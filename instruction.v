module program(add,out);

input [4:0] add ;
output [31:0] out ;
reg [31:0] out ;


reg  [31:0]  pmemory [31:0];


always @(*) begin

        out = pmemory[add];
        
end

initial begin

pmemory[0]  = 32'b00000000100010100001000000000000;//add
pmemory[1]  = 32'b10001100011000100010000000000000;//JUMP, here; two positions

pmemory[2]  = 32'b10000011100000000000000000001110;
pmemory[3]  = 32'b10000011110000000000000000001111;

pmemory[4]  = 32'b00001000010000000010000000000000;//add with carry
pmemory[5]  = 32'b00010000000000100010000000000000;//subtract
pmemory[6]  = 32'b00011010010010100011000000000000;//subtract with borrow
pmemory[7]  = 32'b00100000110010000101000000000000;//multiplication
pmemory[8]  = 32'b00101011100010000000000000000000;//division
pmemory[9]  = 32'b00110000010000000010000000000000;//remainder(modulus)
pmemory[10] = 32'b00111010000000100000000000000000;//bitwise and
pmemory[11] = 32'b01000000100010100001000000000000;//bitwise or
pmemory[12] = 32'b01001000100010100001000000000000;//bitwise neg
pmemory[13] = 32'b01010000110010100001000000000000;//left shift
pmemory[14] = 32'b01011000110010100001000000000000;//right shift
pmemory[15] = 32'b01100000110010100001000000000000;//rotate left
pmemory[16] = 32'b01101000110010100001000000000000;//rotate right
pmemory[17] = 32'b01110000110010100001000000000000;//increment
pmemory[18] = 32'b01111000110010100001000000000000;//decrement

pmemory[19] = 32'b10000000100010100001000000000000;//halt

/* ******************************************************** fibonacci series upto 8(5 times) *************************************************
to run fibonacci, comment the above instructions and run these;

pmemory[1] = 32'b00000011110000001001000000000000;// 0+1=1
pmemory[2] = 32'b00000000000100101010000000000000;// 1+1=2
pmemory[3] = 32'b00000000010101001011000000000000;// 1+2=3
pmemory[4] = 32'b00000000100101101100000000000000;// 2+3=5
pmemory[5] = 32'b00000000110110001101000000000000;// 3+5=8
pmemory[6] = 32'b10000000100010100001000000000000;// halt
*/

end

endmodule