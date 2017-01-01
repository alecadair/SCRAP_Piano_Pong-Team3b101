`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:54 09/30/2015
// Design Name:   FSM_alu_reg_mem_top_module
// Module Name:   C:/Users/u0376370/Desktop/alu_reg_mem_v2/alu_reg_mem_v2/FSM_test_bench.v
// Project Name:  alu_reg_mem_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_alu_reg_mem_top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test_bench;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] segment;
	wire [7:0] digit;

	// Instantiate the Unit Under Test (UUT)
	FSM_alu_reg_mem_top_module uut (
		.clk(clk), 
		.reset(reset), 
		.segment(segment), 
		.digit(digit)
	);
	
	always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;		// Add stimulus here

	end
      
endmodule

