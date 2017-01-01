// Verilog Test Fixture Template

  `timescale 1 ns / 1 ps
/*
	 input [7:0] aluOp,
    input [4:0] RegEn,
    input [15:0] imm,
	 input immEn,
    input reset, //resets the register values to zero
    input clk,
	 input cin,
    input [4:0] BufEnA,  //the register being read into buf1 (alu value A)
    input [4:0] BufEnB, //the register being read into buf2 (alu value B)
  

    output [4:0] flags, 
	 output reg [5:0] regReadNumber = 0, //the register being output on regRead
	 output reg [15:0] regReadData = 0  //the value stored in regEn
*/

	
module RTLTest;
   integer i = 0;
	
	//inputs
	reg [15:0] imm;
	reg immEn;
	reg [4:0] RegEn;
	reg [7:0] aluOp;
	reg [4:0]BufEnA;
	reg [4:0]BufEnB;
	reg reset;
	reg clk;
	reg cin;
	
	//random test imm values;
	reg [15:0] randimm0=0;
	reg [15:0] randimm1=0;
	reg [15:0] randimmResult=0;
	
	//output
	wire [15:0] regReadData;
	wire [4:0] flags;
	wire [5:0] regReadNumber;

	alu_and_reg uut(
	.imm(imm),
	.immEn(immEn),
	.RegEn(RegEn),
	.aluOp(aluOp),
	.BufEnA(BufEnA),
	.BufEnB(BufEnB),
	.reset(reset),
	.clk(clk),
	.cin(cin),
	.regReadData(regReadData),
	.regReadNumber(regReadNumber),
	.flags(flags)
	);

	
	always #1 clk = ~clk; 
	initial begin
	//Initialize Inputs
	imm = 0;
	immEn=0;
	RegEn = 0;
	aluOp = 0;
	BufEnA = 0;
	BufEnB = 0;
	reset = 0;
	cin = 0;
	clk = 0;
	
	#10;
	
	//REGISTER/ALU WORKING TOGTHER
	
	reset = 1;  //Clear all values
	#10;
	reset = 0;
	#10;
	RegEn = 5'd0; //write to Reg 0
	BufEnA = 5'd3; //Bus A gets 0 from R3
	imm = 16'h1234; 
	BufEnB = 5'd16; //disable buff B for immediate
	immEn = 1; //Bus B gets imm
	aluOp =8'h05; //ADD
	#10;  //Reg0 should have 16h'1234
	if (regReadData != 16'h1234) begin
		$display("Register %d should have 16'h1234 but has %h", RegEn, regReadData);
	end
	#10;
	BufEnA = 5'd3; //Bus A gets 0
	RegEn = 5'd1; //write to Reg 1
	imm = 16'h1111;
	#10; //Reg1 should have 16'h1111
	if (regReadData != 16'h1111) begin
		$display("Register %d should have 16'h1111 but has %h", RegEn, regReadData);
	end
	#10;
	RegEn = 5'd2; //write to Reg2
	immEn = 0;
	BufEnA = 5'd0; //Bus A has 16'1234
	BufEnB = 5'd1; //Bus b has 16'1111
	#10; //Reg2 should have R0 + R1
	if (regReadData != 16'h2345) begin
		$display("Register %d should have 16'h1111 but has %h", RegEn, regReadData);
	end
  
   RegEn = 5'd3; //result write to Reg3
	BufEnA = 5'd2;
	aluOp = 8'h09; //SUB
	#10
	if (regReadData != 16'h1234) begin
		$display("Register %d should have 16'h1234 but has %h", RegEn, regReadData);
	end
	
	RegEn = 5'd4; //write xor result to Reg4
	BufEnA = 5'd1;
	BufEnB = 5'd16;
	immEn = 1;
	imm = 16'h8888;
	aluOp = 8'h03; // XOR
	#10;
	if (regReadData != 16'h9999) begin
		$display("Register %d should have 16'h9999 but has %h", RegEn, regReadData);
	end
	#50

	//RANDOM TESTS:
	//clear registers

	
	aluOp = 8'h05; //ADD
	for(i=0; i<10; i = i + 1) begin	
		reset=1;
		BufEnA=5'd0;
		BufEnB=5'd0;
		#10;
		reset=0;
		#10;
		RegEn = 5'd0; //write to Reg 0
		BufEnA = 5'd3; //Bus A gets 0 from R3
		BufEnB = 5'd16; //disable buff B for immediate
		immEn  = 1;
		imm = $random; //R0 has random
		randimm0=imm;
		#10;
		RegEn = 5'd1;
		imm = $random; //R1 has random
		randimm1=imm;
		#10;
		immEn = 0;
		BufEnA = 5'd0;
		BufEnB = 5'd1;
		RegEn = 5'd2;
		randimmResult = randimm0 + randimm1;
		#10;
		if (regReadData != randimmResult) begin
			$display("ADD: Register %d should have %h but has %h", RegEn, randimmResult, regReadData);
		end
		#10;
	end
	
	
	aluOp = 8'h01; //AND
	#10;
	for(i=0; i<10; i = i + 1) begin	
		reset=1;
		BufEnA=5'd0;
		BufEnB=5'd0;
		#10;
		reset=0;
		#10;
		aluOp = 8'h05; //ADD for loading values
		RegEn = 5'd0; //write to Reg 0
		BufEnA = 5'd3; //Bus A gets 0 from R3
		BufEnB = 5'd16; //disable buff B for immediate
		immEn  = 1;
		imm = $random; //R0 has random
		randimm0=imm;
		#10;
		RegEn = 5'd1;
		imm = $random; //R1 has random
		randimm1=imm;
		#10;
		aluOp = 8'h01; //AND for testing.
		immEn = 0;
		BufEnA = 5'd0;
		BufEnB = 5'd1;
		RegEn = 5'd2;
		randimmResult = randimm0 & randimm1;
		#10;
		if (regReadData != randimmResult) begin
			$display("AND: Register %d should have %h but has %h", RegEn, randimmResult, regReadData);
		end
		#10;
	end
	
	end
endmodule
