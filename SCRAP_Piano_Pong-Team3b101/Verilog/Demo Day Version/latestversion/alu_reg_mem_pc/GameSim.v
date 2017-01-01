`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:20:46 12/09/2015
// Design Name:   Game
// Module Name:   C:/Users/u0725062/Desktop/NEWPROJECTFINAL/latestversion/alu_reg_mem_pc/GameSim.v
// Project Name:  alu_reg_mem_pc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Game
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GameSim;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] midiNoteWire;
	reg noteForMem;
	// Outputs
	wire HS;
	wire VS;
	wire [7:0] RGB;
	wire [7:0] digit;
	wire [3:0] segment;
	wire midiRx;

	// Instantiate the Unit Under Test (UUT)
	Game uut (
		.midiNoteWire(midiNoteWire),
		.noteForMem(noteForMem),
		.clk(clk), 
		.reset(reset), 
		.midiFromKeyboard(midiFromKeyboard), 
		.HS(HS), 
		.VS(VS), 
		.RGB(RGB), 
		.digit(digit), 
		.segment(segment), 
		.midiRx(midiRx)
	);
	always #1 clk = ~clk;

	initial begin
// Initialize Inputs
		#10
		noteForMem = 0;
		midiNoteWire = 16'h2d2d;
		clk = 0;
		reset = 0;
		#15		
		// Add stimulus here
		noteForMem = 1;
		
		#15
		
		noteForMem = 0;
	end
      
endmodule

