`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:55:10 11/19/2015
// Design Name:   pixelClock
// Module Name:   C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/pixelClockUUT.v
// Project Name:  alu_reg_mem_pc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pixelClock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pixelClockUUT;

	// Inputs
	reg clkIn;

	// Outputs
	wire pixelClock;

	// Instantiate the Unit Under Test (UUT)
	pixelClock uut (
		.clkIn(clkIn), 
		.pixelClock(pixelClock)
	);
	
	always #1 clkIn = ~clkIn;
	initial begin
		// Initialize Inputs
		clkIn = 0;
 
		// Add stimulus here

	end
      
endmodule

