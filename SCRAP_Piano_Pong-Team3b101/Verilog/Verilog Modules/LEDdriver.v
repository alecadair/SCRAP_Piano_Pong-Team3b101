`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:39 09/10/2015 
// Design Name: 
// Module Name:    LEDdriver 
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
module LEDdriver(RESULTLedIn, CLK, Segment, Digit, Reset);
    input [15:0] RESULTLedIn;
	 input CLK;
	 input Reset;
	 output reg [3:0] Segment = 0;
	 output reg [7:0] Digit = 0;
	 
	 reg [20:0] CLKCounter = 0;
	 reg [3:0] DigitToShow = 0;
	 
	 always@(posedge CLK)begin
		if (Reset) CLKCounter <= 0;
		else if (CLKCounter > 21'd1600000) CLKCounter <= 0;
		else CLKCounter <= CLKCounter + 1;
	end
	
	always @(*) begin
		if((CLKCounter >= 0)&&(CLKCounter <= 21'd400000)) Segment <= 4'b1110;
		else if ((CLKCounter > 21'd400000) && (CLKCounter <= 21'd800000))	Segment <= 4'b1101;
		else if ((CLKCounter > 21'd800000) && (CLKCounter <= 21'd1200000))	Segment <= 4'b1011;
		else if ((CLKCounter > 21'd1200000) && (CLKCounter <= 21'd1600000))Segment <= 4'b0111;
		else Segment <= 4'b1111;	
	end
	
	always @(*) begin
		if((CLKCounter >= 0)&&(CLKCounter <= 21'd400000))	DigitToShow <= RESULTLedIn[3:0];
		else if ((CLKCounter > 21'd400000) && (CLKCounter <= 21'd800000))	DigitToShow <= RESULTLedIn[7:4];
		else if ((CLKCounter > 21'd800000) && (CLKCounter <= 21'd1200000))	DigitToShow <= RESULTLedIn[11:8];
		else DigitToShow <= RESULTLedIn[15:12];
	end
	
	always @(*) begin
		case (DigitToShow)
		//0
		4'b0000: begin
					Digit = 8'b10000001;
					end
		//1
		4'b0001: begin
					Digit = 8'b11001111;
					end
		//2
		4'b0010: begin
					Digit = 8'b10010010;
					end
		//3
		4'b0011: begin
					Digit = 8'b10000110;
					end
		//4
		4'b0100: begin
					Digit = 8'b11001100;
					end
		//5
		4'b0101: begin
					Digit = 8'b10100100;
					end
		//6
		4'b0110: begin
					Digit = 8'b10100000;
					end
		//7
		4'b0111: begin
					Digit = 8'b10001111;
					end
		//8
		4'b1000: begin
					Digit = 8'b10000000;
					end
		//9
		4'b1001: begin
					Digit = 8'b10000100;
					end
		//a
		4'b1010: begin
					Digit =	8'b10001000;
					end
		//b
		4'b1011: begin
					Digit = 8'b11100000;
					end
		//c
		4'b1100: begin
					Digit = 8'b10110001;
					end
		//d
		4'b1101: begin
					Digit = 8'b11000010;
					end
		//e
		4'b1110: begin
					Digit = 8'b10110000;
					end
		//f
		4'b1111: begin
					Digit = 8'b10111000;
					end
		default: begin
					Digit = 8'b11111111;
					end
		endcase
	end
endmodule
