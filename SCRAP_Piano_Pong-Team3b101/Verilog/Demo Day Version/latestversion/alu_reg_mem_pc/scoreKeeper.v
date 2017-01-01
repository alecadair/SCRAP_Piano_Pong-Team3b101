`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:41 12/11/2015 
// Design Name: 
// Module Name:    scoreKeeper 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module scoreKeeper(
	 input clk,
    input p1miss,
    input p2miss,
    output reg [4:0] score = 10
    );
	 
	 reg [4:0] nextscore = 10;
	 
	 always @(posedge clk) begin
		score <=  nextscore;
	 end
	
	always @ (p1miss or p2miss) begin
		nextscore <= nextscore;
		if (p1miss == 1) begin
			nextscore <= score + 1;
		end
		if (p2miss == 1) begin
			nextscore  <= score - 1;
		end
	end

endmodule
