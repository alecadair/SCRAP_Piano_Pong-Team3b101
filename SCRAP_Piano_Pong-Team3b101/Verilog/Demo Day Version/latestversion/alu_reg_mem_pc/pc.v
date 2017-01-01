`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:12 10/29/2015 
// Design Name: 
// Module Name:    pc 
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
module pc(
	input clk,
	input PCEn, 		//PC+1
	input branchEn,	//PC+Offset
	input [9:0] branchOffsetImm,
	input jumpEn,		//PC = jumpAddr
	input [9:0] jumpAddr,
	input reset,
	output reg [13:0] PCOut = 14'd1
	);

	always @(posedge clk) begin
		if(reset) begin
			PCOut <= 10'd9;
		end
		else if (branchEn) begin
			PCOut <= PCOut + $signed(branchOffsetImm);
		end
		else if (jumpEn) begin
			PCOut <= jumpAddr;
		end
		else if (PCEn) begin
			PCOut <= PCOut + 1;
		end
		else begin
			PCOut <= PCOut;
		end
	end

endmodule
