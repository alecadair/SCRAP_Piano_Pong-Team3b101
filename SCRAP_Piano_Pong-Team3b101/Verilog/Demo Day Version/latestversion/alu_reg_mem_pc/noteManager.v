`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:54 12/01/2015 
// Design Name: 
// Module Name:    noteGlyphManager 
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
module noteGlyphManager(

	//instead of passing all of R8 we can just pass the one wire needed by this module.
    input note0en, //reads R8 from alu_reg_mem
	 input [15:0] midiNoteIn,
    input pixelClk,
	 input [9:0] vCount,  //current v pixel on screen
	 input [9:0] hCount,	 //current h pixel on screen
	 input [13:0] noteMemAddr,
	 input [15:0] noteCheckReg,
    output wire [7:0] rgb,  //glyph output
	 output inGlyph,
	 output reg p1Miss = 0,
	 output reg p2Miss = 0,
	 input [15:0] glyphData,
	 output reg [9:0] glyphMemAddress,
	 output reg correctNote = 1,
	 output timerOn,
	 output p1turn,
	 output p2turn,
	 input reset
    );
	
	parameter XOFFSET_NOTE_NOT_IN_PLAY = 32'd320;
	parameter YOFFSET_NOTE_NOT_IN_PLAY = 32'd430;
	
	parameter WHITE_KEY_BORDER_GLYPH_POINTER = 10'd0;
	parameter BLACK_SQUARE_GLYPH = 10'd64;
	parameter WHITE_SQUARE_GLYPH = 10'd128;
	parameter RED_SQUARE_GLYPH = 10'd192;
	parameter BLUE_SQUARE_GLYPH = 10'd256;
	
	reg StartTimer = 0;
	wire EndTimer;
	wire [15:0] plusComplementNote;
	wire [15:0] minusComplementNote;
	
	reg [31:0] hReadGlyphPixel = 0;
	reg [31:0] vReadGlyphPixel = 0;
	
	reg [31:0] xOffset = 300;
	reg [31:0] yOffset = 300;
	reg [10:0] lastVPos = 0;

	reg inGlyphX = 0;
	reg inGlyphY = 0;
	
	reg newKey = 0;
	
	reg[7:0] thisManagersNote = 0;
	reg[7:0] thisNotesComplement = 0;
	
	reg [31:0] moveYCounter = 0;
	reg movingRight = 1;
	
	reg [15:0] noteToCheck = 0;
	
	reg [31:0] moveXCounter = 0;
	reg [31:0] nextMoveXCounter = 1;
	reg [10:0] noteHPos = 300;
	reg [10:0] noteVPos = 300;
	reg [10:0] newNoteHPos = 300;
	reg [10:0] newNoteVPos = 300;
	
	reg scoreChanged = 0;
	reg nextp1Miss = 0;
	reg nextp2Miss = 0;
	
   assign rgb = glyphData[7:0];
	assign inGlyph = inGlyphX && inGlyphY;
	
	assign p2turn = (((timerOn==1) && (xOffset >= 525))? 1:0);
	assign p1turn = (((timerOn==1) && (xOffset <= 108))? 1:0);
	
	always @(posedge pixelClk) begin
		moveXCounter <= nextMoveXCounter;
		noteHPos <= newNoteHPos;
		noteVPos <= newNoteVPos;
	end
	
	always @(noteVPos or note0en) begin
		if(note0en == 1) begin
			yOffset <= noteVPos;
		end
		else begin
			yOffset <=YOFFSET_NOTE_NOT_IN_PLAY;
		end
	end
	
	always @(midiNoteIn or newKey or reset) begin
		if (reset) begin
			thisManagersNote <= 0;
		end
		else if (thisManagersNote == 0) begin
			thisManagersNote <= midiNoteIn[15:8];
		end
		else if (newKey == 1) begin
			thisManagersNote <= midiNoteIn[15:8];
		end
		else begin
			thisManagersNote <= thisManagersNote;
		end
		
	end
	
	always @(thisManagersNote) begin
		case (thisManagersNote)
			//b2
			8'h3b: begin
				newNoteVPos <= 11'd11;
				newNoteHPos <= 11'd65;
			end
			8'h5f:begin
				newNoteVPos <= 11'd11;
				newNoteHPos <= 11'd566;
			end
			//a#2
			8'h3a: begin
				newNoteVPos <= 11'd26;
				newNoteHPos <= 11'd65;
			end
			8'h5e: begin
				newNoteVPos <= 11'd26;
				newNoteHPos <= 11'd566;
			end
			//a2
			8'h39: begin
				newNoteVPos <= 11'd41;
				newNoteHPos <= 11'd65;
			end
			8'h5d: begin
				newNoteVPos <= 11'd41;
				newNoteHPos <= 11'd566;
			end
			//g#2
			8'h38: begin
				newNoteVPos <= 11'd56;
				newNoteHPos <= 11'd65;
			end
			8'h5c: begin
				newNoteVPos <= 11'd56;
				newNoteHPos <= 11'd566;
			end
			//g2
			8'h37: begin
				newNoteVPos <= 11'd71;
				newNoteHPos <= 11'd65;
			end
			8'h5b: begin
				newNoteVPos <= 11'd71;
				newNoteHPos <= 11'd566;
			end
			//f#2
			8'h36: begin
				newNoteVPos <= 11'd86;
				newNoteHPos <= 11'd65;
			end
			8'h5a: begin
				newNoteVPos <= 11'd86;
				newNoteHPos <= 11'd566;
			end
			//f2
			8'h35: begin
				newNoteVPos <= 11'd101;
				newNoteHPos <= 11'd65;
			end
			8'h59: begin
				newNoteVPos <= 11'd101;
				newNoteHPos <= 11'd566;
			end
			//e2
			8'h34: begin
				newNoteVPos <= 11'd131;
				newNoteHPos <= 11'd65;
			end
			8'h58: begin
				newNoteVPos <= 11'd131;
				newNoteHPos <= 11'd566;
			end
			//d#2
			8'h33: begin
				newNoteVPos <= 11'd146;
				newNoteHPos <= 11'd65;
			end
			8'h57: begin
				newNoteVPos <= 11'd146;
				newNoteHPos <= 11'd566;
			end
			//d2
			8'h32: begin
				newNoteVPos <= 11'd161;
				newNoteHPos <= 11'd65;
			end
			8'h56: begin
				newNoteVPos <= 11'd161;
				newNoteHPos <= 11'd566;
			end
			//c#1
			8'h31: begin
				newNoteVPos <= 11'd176;
				newNoteHPos <= 11'd65;
			end
			8'h55: begin
				newNoteVPos <= 11'd176;
				newNoteHPos <= 11'd566;
			end
			//c1
			8'h30: begin
				newNoteVPos <= 11'd191;
				newNoteHPos <= 11'd65;
			end
			8'h54: begin
				newNoteVPos <= 11'd191;
				newNoteHPos <= 11'd566;
			end
			//b1
			8'h2f: begin
				newNoteVPos <= 11'd221;
				newNoteHPos <= 11'd65;
			end
			8'h53: begin
				newNoteVPos <= 11'd221;
				newNoteHPos <= 11'd566;
			end
			//a#1
			8'h2e: begin
				newNoteVPos <= 11'd236;
				newNoteHPos <= 11'd65;
			end
			8'h52: begin
				newNoteVPos <= 11'd236;
				newNoteHPos <= 11'd566;
			end
			//a1
			8'h2d: begin
				newNoteVPos <= 11'd251;
				newNoteHPos <= 11'd65;
			end
			8'h51: begin
				newNoteVPos <= 11'd251;
				newNoteHPos <= 11'd566;
			end
			//g#1
			8'h2c: begin
				newNoteVPos <= 11'd266;
				newNoteHPos <= 11'd65;
			end
			8'h50: begin
				newNoteVPos <= 11'd266;
				newNoteHPos <= 11'd566;
			end
			//g1
			8'h2b: begin
				newNoteVPos <= 11'd281;
				newNoteHPos <= 11'd65;
			end
			8'h4f: begin
				newNoteVPos <= 11'd281;
				newNoteHPos <= 11'd566;
			end
			//f#1
			8'h2a: begin
				newNoteVPos <= 11'd296;
				newNoteHPos <= 11'd65;
			end
			8'h4e: begin
				newNoteVPos <= 11'd296;
				newNoteHPos <= 11'd566;
			end
			//f1
			8'h29: begin
				newNoteVPos <= 11'd311;
				newNoteHPos <= 11'd65;
			end
			8'h4d: begin
				newNoteVPos <= 11'd311;
				newNoteHPos <= 11'd566;
			end
			//e1
			8'h28: begin
				newNoteVPos <= 11'd341;
				newNoteHPos <= 11'd65;
			end
			8'h4c: begin
				newNoteVPos <= 11'd341;
				newNoteHPos <= 11'd566;
			end
			//d#1
			8'h27: begin
				newNoteVPos <= 11'd356;
				newNoteHPos <= 11'd65;
			end
			8'h4b: begin
				newNoteVPos <= 11'd356;
				newNoteHPos <= 11'd566;
			end
			//d1
			8'h26: begin
				newNoteVPos <= 11'd371;
				newNoteHPos <= 11'd65;
			end
			8'h4a: begin
				newNoteVPos <= 11'd371;
				newNoteHPos <= 11'd566;
			end
			//c#1
			8'h25: begin
				newNoteVPos <= 11'd386;
				newNoteHPos <= 11'd65;
			end
			8'h49: begin
				newNoteVPos <= 11'd386;
				newNoteHPos <= 11'd566;
			end
			//c1
			8'h24: begin
				newNoteVPos <= 11'd401;
				newNoteHPos <= 11'd65;
			end
			8'h48: begin
				newNoteVPos <= 11'd401;
				newNoteHPos <= 11'd566;
			end
			default: begin
				newNoteVPos <= yOffset;
				newNoteHPos <= xOffset;
			end
		endcase
	end

	always @(negedge pixelClk) begin
		if (note0en == 1) begin
			if (yOffset == YOFFSET_NOTE_NOT_IN_PLAY) begin
				xOffset = noteHPos;
			end
			else if (moveXCounter < 100000) begin //for simulation set low for fast movement.100,000 default
				nextMoveXCounter = nextMoveXCounter + 1;
				xOffset = xOffset;
			end
			else begin
				nextMoveXCounter = 0;
				if ((xOffset < 572) && movingRight) begin
					movingRight = movingRight;
					xOffset = xOffset + 1;
				end
				else if (xOffset == 572) begin
					movingRight = 0;
					xOffset = xOffset - 1;
					
				end
				else if ((xOffset > 60) && ~movingRight) begin
					movingRight = movingRight;
					xOffset = xOffset - 1;
				end
				else if (xOffset == 60) begin
					movingRight = 1;
					xOffset = xOffset + 1;
				end
			end
		end
		else begin
			xOffset = XOFFSET_NOTE_NOT_IN_PLAY;
			lastVPos = YOFFSET_NOTE_NOT_IN_PLAY;
			nextMoveXCounter = 0;
		end
		if (reset == 1) begin
			movingRight = 1;
			xOffset = 0;
		end
	end
	
	//calculate proper location in glyph's row
	always @(hCount) begin
		if ((hCount >= xOffset) && (hCount < (xOffset+8))) begin
			hReadGlyphPixel = (hCount - xOffset);
			inGlyphX = 1;
		end
		else begin
			hReadGlyphPixel = 0;
			inGlyphX = 0;
		end
	end
	
	//calculate proper row in glyph
	always @(vCount) begin
		if ((vCount >= yOffset) && (vCount < (yOffset+8))) begin
			vReadGlyphPixel = (vCount - yOffset);
			inGlyphY = 1;
		end
		else begin
			vReadGlyphPixel = 0;
			inGlyphY = 0;
		end
	end
	
	//calculate memory offset for current glyph pixel
	always @(hReadGlyphPixel or vReadGlyphPixel) begin
		glyphMemAddress <= BLUE_SQUARE_GLYPH + hReadGlyphPixel + (8*vReadGlyphPixel);
	end
	
	always @(posedge pixelClk)begin
		StartTimer <= StartTimer;
		if (reset) begin
			StartTimer <= 0;
		end
		else if((movingRight == 1) && (xOffset == 525))begin
			StartTimer <= 1;
		end
		else if((movingRight == 0) && (xOffset == 108))begin
			StartTimer <= 1;
		end
		else begin
			StartTimer <= 0;
		end
	end

	always@(midiNoteIn) begin
		if(timerOn == 1) begin
			noteToCheck <= midiNoteIn[15:8];
		end
		else begin
			noteToCheck <= 0;
		end
	end
	
	always@(thisManagersNote) begin
		case(thisManagersNote)
			8'h3b: begin
				thisNotesComplement = 8'h5f;
			end
			8'h5f:begin
				thisNotesComplement = 8'h3b;
			end
			8'h3a: begin
				thisNotesComplement = 8'h5e;
			end
			8'h5e: begin
				thisNotesComplement = 8'h3a;
			end
			//a2
			8'h39: begin
				thisNotesComplement = 8'h5d;
			end
			8'h5d: begin
				thisNotesComplement = 8'h39;
			end
			//g#2
			8'h38: begin
				thisNotesComplement = 8'h5c;
			end
			8'h5c: begin
				thisNotesComplement = 8'h38;
			end
			//g2
			8'h37: begin
				thisNotesComplement = 8'h5b;
			end
			8'h5b: begin
				thisNotesComplement = 8'h37;
			end
			//f#2
			8'h36: begin
				thisNotesComplement = 8'h5a;
			end
			8'h5a: begin
				thisNotesComplement = 8'h36;
			end
			//f2
			8'h35: begin
				thisNotesComplement = 8'h59;
			end
			8'h59: begin
				thisNotesComplement = 8'h35;
			end
			//e2
			8'h34: begin
				thisNotesComplement = 8'h58;
			end
			8'h58: begin
				thisNotesComplement = 8'h34;
			end
			//d#2
			8'h33: begin
				thisNotesComplement = 8'h57;
			end
			8'h57: begin
				thisNotesComplement = 8'h33;
			end
			//d2
			8'h32: begin
				thisNotesComplement = 8'h56;
			end
			8'h56: begin
				thisNotesComplement = 8'h32;
			end
			//c#1
			8'h31: begin
				thisNotesComplement = 8'h55;
			end
			8'h55: begin
				thisNotesComplement = 8'h31;
			end
			//c1
			8'h30: begin
				thisNotesComplement = 8'h54;
			end
			8'h54: begin
				thisNotesComplement = 8'h30;
			end
			//b1
			8'h2f: begin
				thisNotesComplement = 8'h53;
			end
			8'h53: begin
				thisNotesComplement = 8'h2f;
			end
			//a#1
			8'h2e: begin
				thisNotesComplement = 8'h52;
			end
			8'h52: begin
				thisNotesComplement = 8'h2e;
			end
			//a1
			8'h2d: begin
				thisNotesComplement = 8'h51;
			end
			8'h51: begin
				thisNotesComplement = 8'h2d;
			end
			//g#1
			8'h2c: begin
				thisNotesComplement = 8'h50;
			end
			8'h50: begin
				thisNotesComplement = 8'h2c;
			end
			//g1
			8'h2b: begin
				thisNotesComplement = 8'h4f;
			end
			8'h4f: begin
				thisNotesComplement = 8'h2b;
			end
			//f#1
			8'h2a: begin
				thisNotesComplement = 8'h4e;
			end
			8'h4e: begin
				thisNotesComplement = 8'h2a;
			end
			//f1
			8'h29: begin
				thisNotesComplement = 8'h4d;
			end
			8'h4d: begin
				thisNotesComplement = 8'h29;
			end
			//e1
			8'h28: begin
				thisNotesComplement = 8'h4c;
			end
			8'h4c: begin
				thisNotesComplement = 8'h28;
			end
			//d#1
			8'h27: begin
				thisNotesComplement = 8'h4b;
			end
			8'h4b: begin
				thisNotesComplement = 8'h27;
			end
			//d1
			8'h26: begin
				thisNotesComplement = 8'h4a;
			end
			8'h4a: begin
				thisNotesComplement = 8'h26;
			end
			//c#1
			8'h25: begin
				thisNotesComplement = 8'h49;
			end
			8'h49: begin
				thisNotesComplement = 8'h25;
			end
			//c1
			8'h24: begin
				thisNotesComplement = 8'h48;
			end
			8'h48: begin
				thisNotesComplement = 8'h24;
			end
			default: begin
				thisNotesComplement = 0;
			end
		endcase
	end
	
	always@(noteToCheck or reset)begin
			correctNote <= correctNote;
			p1Miss <= p1Miss;
			p2Miss <= p2Miss;
			newKey <= 0;
			if (noteToCheck != 0) begin
				if((p2turn == 1) && (noteToCheck > 8'h47)) begin
					if((noteToCheck == thisManagersNote) || (noteToCheck == thisNotesComplement)) begin
						correctNote <= 1;
						nextp1Miss <= 0;
						nextp2Miss <= 0;
						newKey <= 1;
					end
					else begin
						correctNote <= 0;
						nextp1Miss <= 0;
						nextp2Miss <= 1;
						newKey <= 0;
					end
				end
				
				else if ((p1turn == 1) && (noteToCheck < 8'h3c)) begin
					if((noteToCheck == thisManagersNote) || (noteToCheck == thisNotesComplement)) begin
						correctNote <= 1;
						nextp1Miss <= 0;
						nextp2Miss <= 0;
						newKey <= 1;
					end
					else begin
						correctNote <= 0;
						nextp2Miss <= 0;
						nextp1Miss <= 1;
						newKey <= 0;
					end
				end
			end
			if (reset == 1) begin
				nextp1Miss <= 0;
				nextp2Miss <= 0;
				newKey <= 1;
				correctNote <= 1;
			end
	end
	
	always @ (posedge pixelClk) begin
		if (scoreChanged == 1) begin
			p1Miss <= 0;
			p2Miss <= 0;
		end
		else if (nextp1Miss == 1) begin
			p1Miss <= 1;
			scoreChanged <= 1;
		end
		else if (nextp2Miss == 1) begin
			p2Miss <= 1;
			scoreChanged <= 1;
		end
		if (reset) begin
			p1Miss <= 0;
			p2Miss <= 0;
			scoreChanged <= 0;
		end
	end
	
	
	HardwareTimer timer(
    .CLK(pixelClk), 
    .Start(StartTimer), 
    .FinishPulse(EndTimer),
	 .isCounting(timerOn)
    );
	 
endmodule
