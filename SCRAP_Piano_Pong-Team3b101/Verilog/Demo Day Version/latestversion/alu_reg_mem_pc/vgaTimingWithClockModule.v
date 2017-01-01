`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:52 11/19/2015 
// Design Name: 
// Module Name:    vgaTimingWithClockModule 
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
module vgaTimingWithClockModule(
    input clk,
	 input [7:0] rgbSwitch,
    output hs,
    output vs,
    output [7:0] rgb,
	 output [3:0] segment,
	 output [7:0] digit
	 
    );
	 
	 wire reset;
	 wire bright;
	 wire pixelClockWire;
	 
	 reg [15:0] sevenSeg = 0;
	 reg [15:0] sevenSegCounter = 0;
	 
	 assign reset = 0;
	 
	 always@(posedge normalClock) begin
		if (sevenSegCounter == 16'd10000000) begin
			sevenSegCounter <= 0;
			sevenSeg <= sevenSeg + 1;
		end
		else begin
			sevenSegCounter <= sevenSegCounter + 1;
			sevenSeg <= sevenSeg;
		end
	 end
	 
	 assign rgb = (bright? rgbSwitch : 8'b00000000);
	 
	 vga_timing vgaTimerModule (
    .pixelClock(pixelClockWire), 
    .hs(hs), 
    .vs(vs), 
    .bright(bright)
    );
	 
pixelClock pixelClockModule (
    .clkIn(clk), 
    .pixelClock(pixelClockWire), 
    .normalClock(normalClock)
    );
	 
	 LEDdriver sevenSegUnit (
    .RESULTLedIn(sevenSeg), 
    .CLK(normalClock), 
    .Segment(segment), 
    .Digit(digit), 
    .Reset(reset)
    );
	 
	



endmodule
