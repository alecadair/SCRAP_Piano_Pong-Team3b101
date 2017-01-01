`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:26 11/21/2015 
// Design Name: 
// Module Name:    VGA_Module 
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
module VGA_Module(
	input [15:0] VGA_Data,
	input [15:0] midiNote,
	input clock, //pixel clock 25MHz
	input note0en,
	input reset,
	output MemEnB,
	output MemWEnB,
	output [9:0] VGADataAddr,
	output p1Miss,
	output p2Miss,
	output p1turn,
	output p2turn,
	output HS, 
	output VS,
	output [7:0] RGBVal,
	output correctNote0,
	output note0timerOn,
	output [4:0] score
    );

	wire bright;
	wire [7:0] note0GlyphData;
	wire note0Flag;
	wire [7:0] rgbWarGlyph;
	wire inWarGlyph;
	
	wire[9:0] hPixelCount, vPixelCount;
	reg [7:0] backgroundColor = 8'b10010001;
	reg [7:0] nextBackgroundColor = 8'b01001001;
	
	assign MemEnB = 1;
	assign MemWEnB = 0;
	
	always@(negedge clock) begin
		backgroundColor <= nextBackgroundColor;
	end
	
	always @(midiNote)begin
		nextBackgroundColor <= nextBackgroundColor;
		if (backgroundColor[1] == 1) begin
			nextBackgroundColor[7] <= 1;
			nextBackgroundColor[0] <= backgroundColor[1];
			nextBackgroundColor[6:1] <= (backgroundColor[7:2] ^ 6'b0011000);
		end
		else begin
			nextBackgroundColor <= (backgroundColor >> 1);
		end
		if (backgroundColor == 8'd0) begin
			nextBackgroundColor <= 8'b10001110;
		end
	end
	
	vga_timing Timer (
		 .pixelClock(clock), 
		 .hs(HS), 
		 .vs(VS), 
		 .bright(bright), 
		 .hPixelCount(hPixelCount), 
		 .vPixelCount(vPixelCount)
		 );

	bitGen BitGen (
		 .rgb(RGBVal),
		 .vCount(vPixelCount), 
		 .hCount(hPixelCount), 
		 .bright(bright), 
		 .pixelClk(clock),
		 .backgroundColor(backgroundColor),
		 .InGlyphNote0(note0Flag),
		 .RGBNote0(note0GlyphData),
		 .inWarGlyph(inWarGlyph),
		 .rgbWarGlyph(rgbWarGlyph)
		 ); 
		 
	noteGlyphManager note0 (
    .note0en(note0en), 
    .midiNoteIn(midiNote), 
    .pixelClk(clock), 
    .vCount(vPixelCount), 
    .hCount(hPixelCount), 
    .rgb(note0GlyphData), 
    .inGlyph(note0Flag),
	 .glyphData(8'b00011101),
	 .glyphMemAddress(),
	 .noteMemAddr(14'h3fff),
	 .p1Miss(p1Miss),
	 .p2Miss(p2Miss),
	 .correctNote(correctNote0),
	 .timerOn(note0timerOn),
	 .reset(reset)
    );
	 
	 TugOfWar tugOfWarModule (
    .hPixelCounter(hPixelCount), 
    .vPixelCounter(vPixelCount), 
    .score(score), 
    .pixelClk(clock), 
    .glyphData(VGA_Data), 
    .rgb(rgbWarGlyph), 
    .inWarGlyph(inWarGlyph), 
    .glyphMemAddress(VGADataAddr)
    );
	 
	 scoreKeeper scoreModule (
    .clk(clock), 
    .p1miss(p1Miss), 
    .p2miss(p2Miss), 
    .score(score)
    );


endmodule
