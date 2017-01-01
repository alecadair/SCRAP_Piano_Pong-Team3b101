`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:39 12/01/2015 
// Design Name: 
// Module Name:    HardwareTimer 
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
module HardwareTimer(
	input CLK,
	input Start,
	output reg FinishPulse = 0,
	output reg isCounting = 0
    );

	parameter QuarterSecond = 20000000; //corresponds to 25,000,000 clock cycles.
	reg [31:0] Counter = 0;
	
	always @(posedge CLK)begin
		FinishPulse <= 1'b0;
		//isCounting <= isCounting;
		Counter <= Counter;
		if(Start)begin
			isCounting <= 1'b1;
			FinishPulse <= 1'b0;
		end
		if(isCounting)begin
			if(Counter == QuarterSecond)begin
				FinishPulse <= 1'b1;
				Counter <= 32'd0;
				isCounting <= 1'b0;
			end
			else begin
				Counter <= Counter + 1;
				FinishPulse <= 1'b0;
				isCounting <= 1'b1;
			end
		end
	end
endmodule
