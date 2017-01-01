`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:46 11/21/2015 
// Design Name: 
// Module Name:    bitGen 
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
module bitGen(
	/*output reg [9:0] glyphMemAddress,*/
	output reg [7:0] rgb,
	input [7:0] RGBNote0,
	input InGlyphNote0,
	input [9:0] vCount,
	input [9:0] hCount,
	input bright,
	/*input [15:0] glyphData,*/
	input pixelClk,
	input [7:0] backgroundColor,
	input inWarGlyph,
	input [7:0] rgbWarGlyph
	);
		
	always @(*) begin
		//show black if offscreen
		if (~bright) begin
			rgb <= 8'b00000000;
		end
		else begin
			//draw background:
			if (((hCount >= 0) && (hCount <= 65) && (vCount <= 420)) || ((hCount >= 575) && (hCount <= 640) && (vCount <= 420)))begin
				//division of white keys every 30 pixels
				if ((vCount % 30)==0) begin
					rgb <= 8'b00000000;
				end
				//white background of keys
				else begin
					rgb <= 8'b11111111;
				end
				//overwrite white background with black keys
				if ((hCount >= 0) && (hCount <= 45) || (hCount >= 595) && (hCount <= 640)) begin
				//black keys:
					if (((vCount >=23) && (vCount <=37)) || ((vCount >=53) && (vCount <=67)) || ((vCount >=83) && (vCount <=97))
						|| ((vCount >=143) && (vCount <=157)) || ((vCount >=173) && (vCount <=187)) || ((vCount >=233) && (vCount <=247))
						|| ((vCount >=263) && (vCount <=277)) || ((vCount >=293) && (vCount <=307)) || ((vCount >=353) && (vCount <=367))
						|| ((vCount >=383) && (vCount <=397))) begin
						rgb <= 8'b00000000;
					end
				//key borders:
					if (hCount == 65 || hCount == 575) begin
						rgb <= 8'b0;
					end
				end

			end
			else
				rgb <= backgroundColor;
			if ((hCount == 95) || (hCount == 545)) begin
					rgb <= 8'b11100000;
			end
			if (vCount >= 420) begin
				rgb <= 8'b0;
			end
			//override background with moving glpyh
			//if (inGlyphX && inGlyphY) begin
			//		rgb <= glyphData[7:0];
			//end
			if ((vCount >= 454) && (vCount <456)) begin
				rgb <= 8'hff;
			end
			if(InGlyphNote0)begin
				rgb <= RGBNote0[7:0];
			end
			if(inWarGlyph)begin
				rgb <= rgbWarGlyph[7:0];
			end
			
			//else ifs here for more "Glyphs"
		end
	end

	
endmodule
