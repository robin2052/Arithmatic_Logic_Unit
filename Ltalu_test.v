module Ltalu_test;
reg clk,reset;
reg [7:0] A,B; //declared a resister as they are input
reg [4:0] opcode;
wire [15:0] result;
wire carry, overflow, zero;


//now the module instantiation
Ltalu dut( .clk(clk),
           .reset(reset),
           .A(A),
			  .B(B),
			  .opcode(opcode),
			  .result(result),
			  .carry(carry),
			  .overflow(overflow),
			  .zero(zero));
	
always #2 clk=~clk;
	
initial begin 
  
	
	
	A=16'h0; B=16'h0; opcode=5'b00000;reset=0;clk=1;//addition
	#4 reset=1;
	
	#2 reset=0;
	
	
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b000000;//addition
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b000001;//subtraction
	#4 A=8'b01010101; B=8'b00010011;opcode= 5'b000001;//subtraction
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b000010;//multiply
	#4 A=8'b01010101; B=8'b0010011;opcode= 5'b000011;//division
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b00100;//increment
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b00101;//decrement
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b00110;//Negate
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b00111;//absolute
	#4 reset=1;
	
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01000;//logical and
	#4 reset=0;
	
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01001;//bitwise or
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01010;//bitwise xor
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01011;//bitwise negate
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01100;//bitwise nand
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01101;//bitwise nor
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01110;//bitwise xnor
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b01111;//A & ~B
	
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10000;//A << 1
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10001;//A>>1
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10010;//a>>>1
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10011;//Rotate Left
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10100;//rotate right
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10101;//Circular Shift Left
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10110;//circular right shift
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b10111;//swap nibbles
	
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b11000;//(A == B) ? 1 : 0;
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b11001;//A != B) ? 1 : 0;
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b11010;//(A > B) ? 1 : 0;
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b11011;//(A < B) ? 1 : 0;
	
	#4 A=8'b01010101; B=2;opcode= 5'b11100;//Bit Set
	#4 A=8'b01010101; B=2;opcode= 5'b11101;//bit clear
	#4 A=8'b01010101; B=2;opcode= 5'b11110;// Bit Toggle
	#4 A=8'b01010101; B=8'b10010011;opcode= 5'b11111;//even odd parity check
	#4 $finish;
   end
	always @(posedge clk )begin
	$display("time= %0t | A=%b |B=%b |opcode =%b| result=%b| overflow=%b| carry=%b | zero=%b clk=%b| reset=%b", $time,A,B,opcode,result,overflow,carry,zero,clk,reset); 
	end
endmodule