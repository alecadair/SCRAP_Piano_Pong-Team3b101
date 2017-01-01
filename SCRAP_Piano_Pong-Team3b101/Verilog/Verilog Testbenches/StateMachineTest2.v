`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:32 09/22/2015 
// Design Name: 
// Module Name:    StateMachineTest2 
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
module StateMachineTest2(
    input clk,
    input reset,
	 output wire [3:0] segment,
    output wire [7:0] digit,
	 output wire [4:0] flags
    );
	 
	 wire [15:0] result, imm;
	 wire immen;
	 wire [4:0] bufa, bufb, regen;
	 wire[7:0] aluop;
	 wire cin;
	 wire [5:0] regg;
	 
	 
	 Tester2 tester(.CLK(clk), .RESET(reset), .CIN(cin), .REGEN(regen), .IMM(imm), .IMMEN(immen), .BUF1(bufa), .BUF2(bufb), .ALUOP(aluop));
	 alu_and_reg testMod(.aluOp(aluop), .RegEn(regen), .imm(imm), .immEn(immen), .reset(reset), .clk(clk), .cin(cin), .BufEnA(bufa), .BufEnB(bufb), .flags(flags), .regReadNumber(regg), .regReadData(result));
	 LEDdriver ledDriver(.RESULT(result), .CLK(clk), .Segment(segment), .Digit(digit));

endmodule

