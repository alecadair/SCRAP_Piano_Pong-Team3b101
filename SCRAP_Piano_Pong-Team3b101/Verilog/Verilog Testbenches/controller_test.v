`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:39:31 11/02/2015
// Design Name:   controller_alu_reg_mem_pc
// Module Name:   C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/controller_test.v
// Project Name:  alu_reg_mem_pc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller_alu_reg_mem_pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [0:7] digit;
	wire [0:3] segment;

	// Instantiate the Unit Under Test (UUT)
	controller_alu_reg_mem_pc uut (
		.clk(clk), 
		.reset(reset), 
		.digit(digit), 
		.segment(segment)
	);

	always #1 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

	end
      
endmodule

