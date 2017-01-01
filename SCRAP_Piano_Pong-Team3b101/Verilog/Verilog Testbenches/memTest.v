`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:42 09/24/2015
// Design Name:   alu_reg_mem
// Module Name:   C:/Users/u0376370/Desktop/ECE3710RegFile/memTest.v
// Project Name:  ECE37010RegFile
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

module memTest;

	// Inputs
	reg clk;
	reg reset;
	reg immEn;
	reg [4:0] bufEnA;
	reg [4:0] bufEnB;
	reg [7:0] aluOp;
	reg [4:0] regEn;
	reg memEnA;
	reg memWeA;
	reg [9:0] memAddrA;
	reg memEnB;
	reg memWeB;
	reg [9:0] memAddrB;
	reg memOutEnA;
	reg memOutEnB;
		
	//outputs:
	wire [15:0] memOutA;
	wire [15:0] memOutB;

	// Instantiate the Unit Under Test (UUT)
	alu_reg_mem uut (
		.clk(clk), 
		.reset(reset), 
		.immEn(immEn), 
		.bufEnA(bufEnA), 
		.bufEnB(bufEnB), 
		.aluOp(aluOp), 
		.regEn(regEn), 
		.memEnA(memEnA), 
		.memWeA(memWeA), 
		.memAddrA(memAddrA),
		.memEnB(memEnB), 
		.memWeB(memWeB), 
		.memAddrB(memAddrB),
		.memOutEnA(memOutEnA),
		.memOutEnB(memOutEnB),
		.memOutA(memOutA),
		.memOutB(memOutB)
	);
	
	always #1 clk = ~clk; 
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;  //clear registers
		immEn = 0;
		bufEnA = 0;
		bufEnB = 0;
		aluOp = 0;
		regEn = 0;
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
		#10;
		
		//Add stimulus here
		        
		//working in memory block A:
		memOutEnA = 1; 
		memEnA = 1;	
		
		//write from blockA[1018] to R0:
		aluOp = 5'h05;
		bufEnA = 5'd15; //ALU bus A gets 0
		bufEnB = 5'd16; //ALU bus B disabled for immediate
		immEn = 1;		 //ALU bus B gets immediate
		memAddrA = 10'd1018;  //imm gets block A addr 1018
		#10;
		
		//write from blockA[1019] to R1:
		memAddrA = 10'd1019;  //imm gets block A addr 1019
		regEn = 5'd1;         //write value to R1
		#10;
		
		//blockA[1023] <= R0 + R1:
		memAddrA = 10'd1023;  //write into block A addr 1023
		memWeA = 1;           //enable write to memory
		regEn = 5'd16;        //disable write to registers
		immEn = 0;				 //disable immedate from memory
		bufEnA = 5'd0;        //ALU bus A gets R0 value
		bufEnB = 5'd1;        //ALU bus B gets R1 value
		#10;

	end
      
endmodule

