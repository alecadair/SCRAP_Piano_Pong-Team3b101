`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:21:55 09/17/2015
// Design Name:   StateMachineTest1
// Module Name:   C:/Users/u0376370/Desktop/ECE3710RegFile/statemachinefibtest.v
// Project Name:  ECE37010RegFile
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachineTest1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module statemachinefibtest;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] segment;
	wire [7:0] digit;

	// Instantiate the Unit Under Test (UUT)
	StateMachineTest1 uut (
		.clk(clk), 
		.segment(segment), 
		.digit(digit)
	);
	always #1 clk = ~clk; 
	initial begin
		
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

