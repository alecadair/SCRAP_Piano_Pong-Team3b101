`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:22 09/10/2015 
// Design Name: 
// Module Name:    Register16Bit 
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
module Register16Bit(
	input [15:0] DataIn,
	input enable,
	input clr,
	input clk,
	output reg [15:0] DataOut);
	
	reg [15:0] nextDataIn;
	
	always @(*) begin
		nextDataIn <= DataIn;
	end

	always @ (posedge clk)begin
		if(clr)
			DataOut <= 16'd0;	
		else if (enable == 1)
			DataOut <= nextDataIn; 
		else 
			DataOut <= DataOut;
	end
endmodule
	