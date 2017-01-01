`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:19 11/19/2015
// Design Name:   vga_timing
// Module Name:   C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/vgaTimingUUT.v
// Project Name:  alu_reg_mem_pc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_timing
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vgaTimingUUT;

	// Inputs
	reg pixelClock;

	// Outputs
	wire hs;
	wire vs;
	wire bright;

	// Instantiate the Unit Under Test (UUT)
	vga_timing uut (
		.pixelClock(pixelClock), 
		.hs(hs), 
		.vs(vs), 
		.bright(bright)
	);

	always #1 pixelClock = ~pixelClock;
	
	initial begin
		// Initialize Inputs
		pixelClock = 0;
       
		// Add stimulus here

	end
      
endmodule

