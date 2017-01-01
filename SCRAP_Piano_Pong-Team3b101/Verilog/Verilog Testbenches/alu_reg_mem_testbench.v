`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:49 09/30/2015
// Design Name:   alu_reg_mem
// Module Name:   C:/Users/u0376370/Desktop/alu_reg_mem_v2/alu_reg_mem_v2/alu_reg_mem_testbench.v
// Project Name:  alu_reg_mem_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_reg_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_reg_mem_testbench;

	// Inputs
	reg clk;
	reg reset;
	reg immEn;
	reg [15:0] imm;
	reg [4:0] bufEnA;
	reg [4:0] bufEnB;
	reg [7:0] aluOp;
	reg [4:0] regEn;
	reg cin;
	reg memReadEn;
	reg aluResultEn;
	reg manualRegEn;
	reg [15:0] manualRegImm;
	reg memEnA;
	reg memWeA;
	reg [9:0] memAddrA;
	reg memEnB;
	reg memWeB;
	reg [9:0] memAddrB;
	reg memOutEnA;
	reg memOutEnB;

	// Outputs
	wire [15:0] memOutA;
	wire [15:0] memOutB;
	wire [4:0] aluFlags;

	// Instantiate the Unit Under Test (UUT)
	alu_reg_mem uut (
		.clk(clk), 
		.reset(reset), 
		.immEn(immEn), 
		.imm(imm), 
		.bufEnA(bufEnA), 
		.bufEnB(bufEnB), 
		.aluOp(aluOp), 
		.regEn(regEn), 
		.cin(cin), 
		.memReadEn(memReadEn), 
		.aluResultEn(aluResultEn), 
		.manualRegEn(manualRegEn), 
		.manualRegImm(manualRegImm), 
		.memEnA(memEnA), 
		.memWeA(memWeA), 
		.memAddrA(memAddrA), 
		.memEnB(memEnB), 
		.memWeB(memWeB), 
		.memAddrB(memAddrB), 
		.memOutEnA(memOutEnA), 
		.memOutEnB(memOutEnB), 
		.memOutA(memOutA), 
		.memOutB(memOutB), 
		.aluFlags(aluFlags)
	);
	
	always #1 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		immEn = 0;
		imm = 0;
		bufEnA = 5'd16;
		bufEnB = 5'd16;
		aluOp = 0;
		regEn = 5'd16;
		cin = 0;
		memReadEn = 0;
		aluResultEn = 0;
		manualRegEn = 0;
		manualRegImm = 0;
		memEnA = 0;
		memWeA = 0;
		memAddrA = 0;
		memEnB = 0;
		memWeB = 0;
		memAddrB = 0;
		memOutEnA = 0;
		memOutEnB = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#2;
		
		//memory initialized with 0x1 at location 1018 on mem block A
		memEnA = 1;
		memOutEnA = 1;
		memAddrA = 10'd1018;
		memReadEn = 1;
		
		// put 0x1 on reg0
		regEn = 5'd0;
		#5;
		
		//stop reading from memory, start reading from alu result:
		memReadEn = 0;
		aluResultEn = 1;
		regEn = 5'd1;
		aluOp = 7'd5; //add
		bufEnA = 5'd0; // 1 on bus A
		bufEnB = 5'd15; // 0 on bus B
		
		//start writing to memory:
		memAddrA = 10'd1000;
		memWeA = 1;
		#5;
		
		//next part of fib sequence
		bufEnA = 5'd0;
		bufEnB = 5'd1;
		regEn = 5'd2;
		memAddrA = 10'd1001;
		#5;
		
		//next part of fib sequence
		bufEnA = 5'd1;
		bufEnB = 5'd2;
		regEn = 5'd3;
		memAddrA = 10'd1002;
		#5;
		
		//next part of fib sequence
		bufEnA = 5'd2;
		bufEnB = 5'd3;
		regEn = 5'd4;
		memAddrA = 10'd1003;
		#5;
		
		//next part of fib sequence
		bufEnA = 5'd3;
		bufEnB = 5'd4;
		regEn = 5'd5;
		memAddrA = 10'd1004;
		#5;
		
		//next part of fib sequence
		bufEnA = 5'd4;
		bufEnB = 5'd5;
		regEn = 5'd6;
		memAddrA = 10'd1005;
		#5;
		
		
	end
      
endmodule

