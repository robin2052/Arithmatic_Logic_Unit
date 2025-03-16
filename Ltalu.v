module Ltalu (
    input clk,reset,
    input [7:0] A, B,
    input [4:0] opcode, // 5-bit opcode for 32 operations
    output reg [15:0] result,
    output reg carry, zero, overflow
);

always @(posedge clk) begin
    if (reset)
	 begin
	 carry<=0;
	 overflow<=0;
	 
	 result <= 16'h0;
	 end
	 else 
	 begin
	 
   
    
    case (opcode)
        // Arithmetic Operations
        5'b00000: begin // Add
            {carry, result[7:0]} <= A + B;
            if ((A[7] == B[7]) && (result[7] != A[7])) // Overflow detection
                overflow <= 1;
        end
        
        5'b00001: begin // Subtract
            {carry, result[7:0]} <= A - B;
            if ((A[7] != B[7]) && (result[7] != A[7])) // Overflow detection
                overflow <= 1;
        end
        
        5'b00010: result <= A * B; // Multiply
        5'b00011: result <= (B != 0) ? {A % B, A / B} : 16'h0; // Divide

        5'b00100: result <= A + 1; // Increment
        5'b00101: result <= A - 1; // Decrement
        5'b00110: result <= -A; // Negate
        5'b00111: result <= (A[7]) ? -A : A; // Absolute

        // Logical Operations
        5'b01000: result <= A & B;
        5'b01001: result <= A | B;
        5'b01010: result <= A ^ B;
        5'b01011: result <= ~A;
        5'b01100: result <= ~(A & B);
        5'b01101: result <= ~(A | B);
        5'b01110: result <= ~(A ^ B);
        5'b01111: result <= A & ~B;

        // Shift & Rotate
        5'b10000: result <= A << 1;
        5'b10001: result <= A >> 1;
        5'b10010: result <= A >>> 1; // Arithmetic Shift Right
        5'b10011: result <= {A[6:0], A[7]}; // Rotate Left
        5'b10100: result <= {A[0], A[7:1]}; // Rotate Right
        5'b10101: result <= {A[5:0], A[7:6]}; // Circular Shift Left
        5'b10110: result <= {A[1:0], A[7:2]}; // Circular Shift Right
        5'b10111: result <= {A[3:0], A[7:4]}; // Swap Nibbles

        // Comparison
        5'b11000: result <= (A == B) ? 1 : 0;
        5'b11001: result <= (A != B) ? 1 : 0;
        5'b11010: result <= (A > B) ? 1 : 0;
        5'b11011: result <= (A < B) ? 1 : 0;

        // Special Operations
        5'b11100: result <= A | (1 << B); // Bit Set
        5'b11101: result <= A & ~(1 << B); // Bit Clear
        5'b11110: result <= A ^ (1 << B); // Bit Toggle
        5'b11111: result <= ^A; // Parity Check (Odd/Even)

        default: result <= 0;
    endcase
	 

     end
	  end
	 always @(posedge clk) begin
	 if (reset)
	 zero<=1;
	 else
	 zero<= (result ==0)? 1:0;
	 end


endmodule

		        
				 
		       
				  
				  