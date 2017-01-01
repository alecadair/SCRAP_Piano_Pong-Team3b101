`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:44 11/01/2015 
// Design Name: 
// Module Name:    alu_reg_mem_pc_controller 
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
module alu_reg_mem_pc_controller(
	input clk,
	input reset,
	output [3:0] digit,
	output [7:0] segment
	);
	
	wire immEn, cin, memReadEn, aluResultEn, memEnA, memWeA, memEnB, memWeB, memOutEnA, memOutEnB, pcAddrEn, regAddrEn, PCEn, branchEn, jumpEn;
	wire [15:0] memOutA;
	
	alu_reg_mem alu_reg_mem_unit(clk, reset, immEn, imm, bufEnA, bufEnB, aluOp, regEn, cin, memReadEn, aluResultEn, memEnA, memWeA, memEnB, memWeB, memOutEnA, memOutEnB, pcAddrEn, regAddrEn, aluDataOut, memOutA, memOutB, aluFlags, busBDataOut, PCEn, branchEn, branchOffsetImm, jumpEn, PCOut);
	ControlUnit controller_unit(memOutA, clk, reset, memOutEnA, regEn, aluResultEn, cin, immEn, memReadEn, aluToMemEn, aluOp, bufEnA, bufEnB, imm, memOutEnB, memEnA, memEnB, memWeA, memWeB, branchOffsetImm, branchEn, jumpEn, PCen, pcAddrEn, regAddrEn);
	LEDdriver led_unit(memOutA, clk, segment, digit, reset);

endmodule
