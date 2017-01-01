`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:53 11/13/2015
// Design Name:   controller_mitertest
// Module Name:   C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/mitertest.v
// Project Name:  alu_reg_mem_pc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller_mitertest
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mitertest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [0:7] digit;
	wire [0:3] segment;

	// Instantiate the Unit Under Test (UUT)
	controller_mitertest uut (
		.clk(clk), 
		.reset(reset), 
		.digit(digit), 
		.segment(segment)
	);
	
	always #1 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

