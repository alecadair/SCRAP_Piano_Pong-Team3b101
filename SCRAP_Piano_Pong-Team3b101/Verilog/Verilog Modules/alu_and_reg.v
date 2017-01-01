`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:46 09/15/2015 
// Design Name: 
// Module Name:    alu_and_reg 
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
//add with carry - carry goes through the mux (either add carry or add 0)
module alu_and_reg(
	 input [7:0] aluOp,
    input [4:0] RegEn,
    input [15:0] imm,
	 input immEn,
	 input [15:0] memRead,
	 input memReadEn,
	 input reset, //resets the register values to zero
    input clk,
	 input cin,
    input [4:0] BufEnA,  //the register being read into buf1 (alu value A)
    input [4:0] BufEnB,	 //the register being read into buf2 (alu value B)
    input aluResultEn,
	 
    output [4:0] flags,//= 0, 
	 output [15:0] busAOut,
	 output [15:0] busBOut,
	 output [15:0] R8out
    );

wire [15:0] busA, busB, regInput, aluResult;
wire [15:0] R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, /*R8out,*/ R9out, R10out, R11out, R12out, R13out, R14out, R15out;
reg [16:0] BufEnAbinary = 0;
reg [16:0] BufEnBbinary =0;
reg [15:0] regEnBinary = 0;

assign busAOut = busA;
assign busBOut = busB;

//RegFile:
RegFile regBank(clk, reset, regEnBinary, regInput, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out);

//RegFile Enable Control:
always @(RegEn) begin
	case(RegEn)
		5'd0 : regEnBinary <= 16'd1;
		5'd1 : regEnBinary <= 16'd2;
		5'd2 : regEnBinary <= 16'd4;
		5'd3 : regEnBinary <= 16'd8;
		5'd4 : regEnBinary <= 16'd16;
		5'd5 : regEnBinary <= 16'd32;
		5'd6 : regEnBinary <= 16'd64;
		5'd7 : regEnBinary <= 16'd128;
		5'd8 : regEnBinary <= 16'd256;
		5'd9 : regEnBinary <= 16'd512;
		5'd10 : regEnBinary <= 16'd1024;
		5'd11 : regEnBinary <= 16'd2048;
		5'd12 : regEnBinary <= 16'd4096;
		5'd13 : regEnBinary <= 16'd8192;
		5'd14 : regEnBinary <= 16'd16384;
		5'd15 : regEnBinary <= 16'd32768;
		5'd16 : regEnBinary <= 16'd0;
		default : regEnBinary <= 16'd0;
	endcase
end

//buffers:
Tri_Buf immBuf(imm, immEn, busB);
Tri_Buf memReadBuf(memRead, memReadEn, regInput);
Tri_Buf aluResultBuf(aluResult, aluResultEn, regInput);
Tri_Buf R0A(R0out, BufEnAbinary[0], busA);
Tri_Buf R0B(R0out, BufEnBbinary[0], busB);
Tri_Buf R1A(R1out, BufEnAbinary[1], busA);
Tri_Buf R1B(R1out, BufEnBbinary[1], busB);
Tri_Buf R2A(R2out, BufEnAbinary[2], busA);
Tri_Buf R2B(R2out, BufEnBbinary[2], busB);
Tri_Buf R3A(R3out, BufEnAbinary[3], busA);
Tri_Buf R3B(R3out, BufEnBbinary[3], busB);
Tri_Buf R4A(R4out, BufEnAbinary[4], busA);
Tri_Buf R4B(R4out, BufEnBbinary[4], busB);
Tri_Buf R5A(R5out, BufEnAbinary[5], busA);
Tri_Buf R5B(R5out, BufEnBbinary[5], busB);
Tri_Buf R6A(R6out, BufEnAbinary[6], busA);
Tri_Buf R6B(R6out, BufEnBbinary[6], busB);
Tri_Buf R7A(R7out, BufEnAbinary[7], busA);
Tri_Buf R7B(R7out, BufEnBbinary[7], busB);
Tri_Buf R8A(R8out, BufEnAbinary[8], busA);
Tri_Buf R8B(R8out, BufEnBbinary[8], busB);
Tri_Buf R9A(R9out, BufEnAbinary[9], busA);
Tri_Buf R9B(R9out, BufEnBbinary[9], busB);
Tri_Buf R10A(R10out, BufEnAbinary[10], busA);
Tri_Buf R10B(R10out, BufEnBbinary[10], busB);
Tri_Buf R11A(R11out, BufEnAbinary[11], busA);
Tri_Buf R11B(R11out, BufEnBbinary[11], busB);
Tri_Buf R12A(R12out, BufEnAbinary[12], busA);
Tri_Buf R12B(R12out, BufEnBbinary[12], busB);
Tri_Buf R13A(R13out, BufEnAbinary[13], busA);
Tri_Buf R13B(R13out, BufEnBbinary[13], busB);
Tri_Buf R14A(R14out, BufEnAbinary[14], busA);
Tri_Buf R14B(R14out, BufEnBbinary[14], busB);
Tri_Buf R15A(R15out, BufEnAbinary[15], busA);
Tri_Buf R15B(R15out, BufEnBbinary[15], busB);

//Bus A buffer control:
always @(BufEnA) begin
	case (BufEnA)
		5'd16 : BufEnAbinary <= 16'd0; // no reg on BusA
		5'd0 : BufEnAbinary <= 16'd1; //R0 on BusA
		5'd1 : BufEnAbinary <= 16'd2;
		5'd2 : BufEnAbinary <= 16'd4;
		5'd3 : BufEnAbinary <= 16'd8;
		5'd4 : BufEnAbinary <= 16'd16;
		5'd5 : BufEnAbinary <= 16'd32;
		5'd6 : BufEnAbinary <= 16'd64;
		5'd7 : BufEnAbinary <= 16'd128;
		5'd8 : BufEnAbinary <= 16'd256;
		5'd9 : BufEnAbinary <= 16'd512;
		5'd10 : BufEnAbinary <= 16'd1024;
		5'd11 : BufEnAbinary <= 16'd2048;
		5'd12 : BufEnAbinary <= 16'd4096;
		5'd13 : BufEnAbinary <= 16'd8192;
		5'd14 : BufEnAbinary <= 16'd16384;
		5'd15 : BufEnAbinary <= 16'd32768; //R15 on BusA
		default : BufEnAbinary <= 16'd0;
	endcase
end

//Bus B buffer control:
always @(BufEnB) begin
	case (BufEnB)
		5'd16 : BufEnBbinary <= 16'd0; // no reg on BusA
		5'd0 : BufEnBbinary <= 16'd1; //R0 on BusA
		5'd1 : BufEnBbinary <= 16'd2;
		5'd2 : BufEnBbinary <= 16'd4;
		5'd3 : BufEnBbinary <= 16'd8;
		5'd4 : BufEnBbinary <= 16'd16;
		5'd5 : BufEnBbinary <= 16'd32;
		5'd6 : BufEnBbinary <= 16'd64;
		5'd7 : BufEnBbinary <= 16'd128;
		5'd8 : BufEnBbinary <= 16'd256;
		5'd9 : BufEnBbinary <= 16'd512;
		5'd10 : BufEnBbinary <= 16'd1024;
		5'd11 : BufEnBbinary <= 16'd2048;
		5'd12 : BufEnBbinary <= 16'd4096;
		5'd13 : BufEnBbinary <= 16'd8192;
		5'd14 : BufEnBbinary <= 16'd16384;
		5'd15 : BufEnBbinary <= 16'd32768; //R15 on BusA
		default : BufEnBbinary <= 16'd0;
	endcase
end

//ALU
alu aluUnit(aluOp, busA, busB, cin, aluResult, flags[0], flags[1], flags[2], flags[3], flags[4]);
endmodule
