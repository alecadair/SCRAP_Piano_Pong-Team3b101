`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  15:58:08 09/03/2015 
// Design Name: 
// Module Name:  alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module alu(OP, A, B, Cin, RESULT, CARRY, LOW, OVF, ZERO, NEG);

	input [7:0] OP;
	input [15:0] A;
	input [15:0] B;
	input Cin;
	
	reg [16:0] carryDetect;
	
	output reg [15:0] RESULT;
	output reg CARRY;
	output reg LOW;
	output reg OVF;
	output reg ZERO;
	output reg NEG;
	
	
	parameter ADD = 8'h05;//done
	parameter ADDU = 8'h06;
	//parameter ADDC = 8'h07;
	parameter SUB = 8'h09;
	//parameter SUBC = 8'h0A;
	parameter CMP = 8'h0C;
	parameter CMPU = 8'h0B;
	parameter AND = 8'h01;
	parameter OR = 8'h02;
	parameter XOR = 8'h03;
	parameter LSH = 8'h84;
	parameter ASH = 8'h86;
	parameter NOT = 8'h0E;
	parameter NOP = 8'h00;
	parameter MOV = 8'h0D;
	//parameter ADDI 2'h5
	
	always@(*)begin
		case (OP)
		ADD:
				begin
				 carryDetect = $signed(A) + $signed(B) + Cin;
				 RESULT = carryDetect[15:0];
				 CARRY = carryDetect[16];
				if(RESULT == 16'h0000) ZERO = 1'b1;
				else ZERO =1'b0;
				if((~A[15] & ~B[15] & RESULT[15])|(A[15] & B[15] & ~RESULT[15])) OVF = 1'b1;
				else OVF = 1'b0;
				 NEG = 1'b0;
				 LOW = 1'b0;
				 CARRY = 1'b0;
				end
		ADDU:
				begin
				 carryDetect = $unsigned(A) + $unsigned(B) + Cin;
				 RESULT = carryDetect[15:0];
				 CARRY = carryDetect[16];
				if(RESULT == 16'h0000) ZERO = 1'b1;
				else  ZERO = 1'b0;
				 NEG = 1'b0;
				 LOW = 1'b0;
				 OVF = 1'b0;
				end
		SUB:
				begin
				 RESULT = A - B;
				if(RESULT == 16'h0000) ZERO = 1'b1;
				else ZERO = 1'b0;
				if((~A[15] & ~B[15] & RESULT[15]) |(A[15] & B[15] & ~RESULT[15])) OVF = 1'b1;
				else OVF = 1'b0;
				 NEG = 1'b0;
				 LOW = 1'b0;
				 carryDetect = A - B;
				 CARRY = carryDetect[16];
				end
		CMP:
			begin
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				if($signed(B) < $signed(A))begin
					 NEG = 1'b1;
					 ZERO = 1'b0;
					 RESULT = RESULT;
				end
				else begin
					 NEG = 1'b0;
					 ZERO = 1'b1;
					 RESULT = RESULT;
				end
			end
		CMPU:
			begin
				 NEG = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				if($unsigned(B) < $unsigned(A))begin
					 LOW = 1'b1;
					 ZERO = 1'b0;
					 RESULT = RESULT;
				end
				else begin
					 LOW =1'b0;
					 ZERO = 1'b1;
					 RESULT = RESULT;
				end
			end
		AND:
			begin
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				 RESULT = A&B;
				 NEG = 1'b0;
				if(RESULT == 16'h0000) ZERO = 1'b1;
				else ZERO = 1'b0;
			end
		OR:
			begin
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				 RESULT = A|B;
				 NEG = 1'b0;
				if(RESULT == 16'h0000) ZERO = 1'b1;
				else ZERO = 1'b0;
			end
		NOT://Not flips the bits in input A.
			begin
				 NEG = 1'b0;
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				 RESULT = ~A;
				if(RESULT == 16'h0000) ZERO = 1'b0;
				else ZERO = 1'b0;
			end
		XOR:
			begin
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				 RESULT = A^B;
				 NEG = 1'b0;
				if(RESULT == 16'h0000) ZERO = 1'b1;
				else ZERO = 1'b0;
			end
		LSH:
			begin
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				//if b is positive shift left otherwise shift right
				if(B[15] ==1'b0) RESULT = A << 1;
				else RESULT = A>>1;
				 NEG = 1'b0;
				if(RESULT == 16'h0) ZERO = 1'b1;
				else ZERO = 1'b0;
			end
		ASH:
			begin
				 LOW = 1'b0;
				 CARRY = 1'b0;
				 OVF = 1'b0;
				 NEG = 1'b0;
				if(B[15] == 1'b0)begin	 RESULT = A << 1;end
				else begin
					 RESULT = A >> 1;
					if(RESULT[14] == 1'b1) RESULT [15] = 1'b1;
					else RESULT [15] = 1'b0;
				end
				if(RESULT == 16'h0) ZERO = 1'b1;
				else ZERO = 1'b0;
			end
		MOV:
			begin
				LOW = LOW;
				CARRY = CARRY;
				OVF = OVF;
				NEG = NEG;
				RESULT = B;
				ZERO = ZERO;
			end
		NOP:
			begin
				LOW = LOW;
				CARRY = CARRY;
				OVF = OVF;
				NEG = NEG;
				ZERO = ZERO;
				RESULT = RESULT;
			end
		default:
			begin
				LOW = LOW;
				CARRY = CARRY;
				OVF = OVF;
				NEG = NEG;
				ZERO = ZERO;
				RESULT = RESULT;
			end		
		endcase
	end	
endmodule
