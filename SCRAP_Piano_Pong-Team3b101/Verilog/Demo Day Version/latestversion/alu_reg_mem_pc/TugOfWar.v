`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:44 12/10/2015 
// Design Name: 
// Module Name:    TugOfWar 
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
module TugOfWar(
	input [9:0] hPixelCounter,
	input [9:0] vPixelCounter,
//	input clk,
	input [4:0] score,
	input pixelClk,
	input [15:0] glyphData,
	output [7:0] rgb,
	output inWarGlyph,
	output reg [10:0] glyphMemAddress = 0
    );
	
	parameter vPosToStart = 16'd420;
	//parameter vKnotToStart = 16'd424; 
	parameter knotTickAmount = 16'd32;
	parameter verticalManPos = 16'd440;
	parameter ropeColor = 8'h00;
	parameter knotYPos = 16'd518;
	
	parameter leftManGlyphAddress = 11'd576; //need to figure out
	parameter rightManGlyphAddress = 11'd0;// need to figure out
	parameter knotGlyphAddress = 11'd666;//need to figure out.
	
	
	//reg [31:0] yOffset = 300;
	//reg [10:0] lastVPos = 0;
	reg [31:0] hReadLeftMan = 0;
	reg [31:0] vReadLeftMan = 0;
	reg [31:0] hReadRightMan = 0;
	reg [31:0] vReadRightMan = 0;
	reg [31:0] hReadKnot = 0;
	reg [31:0] vReadKnot = 0;


	reg inLeftManX = 0;
	reg inRightManX = 0;
	reg inLeftManY = 0;
	reg inRightManY = 0;
	wire inLeftMan;
	wire inRightMan;
	wire inKnot;
	reg inKnotX = 0;
	reg inKnotY = 0;
	
	reg [10:0] leftManHPos = 11'd5;
	reg [10:0] rightManHPos = 11'd200;
	reg [10:0] knotHPos = 11'd100;
	reg [10:0] newLeftManHPos = 11'd5;
	reg [10:0] newRightManHPos = 11'd200;
	reg [10:0] newKnotHPos = 11'd100;
	
	reg [10:0] leftManVPos = 11'd440;
	reg [10:0] rightManVPos = 11'd440;
	reg [10:0] knotVPos = 11'd449;
	
	
	assign inLeftMan = inLeftManX && inLeftManY;
	assign inRightMan = inRightManX && inRightManY;
	assign inKnot = inKnotX && inKnotY;
	assign inWarGlyph = inLeftMan || inRightMan|| inKnot;
	assign rgb = (inKnot ? 8'hff:glyphData[7:0]);
	
	
	always @(posedge pixelClk) begin
		//moveXCounter <= nextMoveXCounter;
		leftManHPos <= newLeftManHPos;
		rightManHPos <= newRightManHPos;
		knotHPos <= newKnotHPos;
		leftManVPos <= leftManVPos;
		rightManVPos <= rightManVPos;
		knotVPos <= knotVPos;
	end
	
	always @(hPixelCounter) begin
		if ((hPixelCounter > leftManHPos) && (hPixelCounter <=(leftManHPos+24))) begin
			hReadLeftMan <= (hPixelCounter - leftManHPos);
			inLeftManX <= 1;
			inRightManX <= 0;
			inKnotX <= 0;
		end
		else if((hPixelCounter > rightManHPos) &&(hPixelCounter <= (rightManHPos + 24)))begin
			hReadRightMan <= (hPixelCounter - rightManHPos);
			inRightManX <= 1;
			inLeftManX <= 0;
			inKnotX <= 0;
		end
		else if((hPixelCounter > knotHPos) && (hPixelCounter <= (knotHPos + 10)))begin
			hReadKnot <= (hPixelCounter - knotHPos);
			inRightManX <= 0;
			inLeftManX <= 0;
			inKnotX <= 1;
		end
		else begin
			hReadLeftMan <= 0;
			hReadRightMan <= 0;
			hReadKnot <= 0;
			inLeftManX <= 0;
			inRightManX <= 0;
			inKnotX <= 0;
		end
	end
	
	always @(vPixelCounter) begin
		if ((vPixelCounter >= leftManVPos) && (vPixelCounter <(leftManVPos+24))) begin
			vReadLeftMan <= (vPixelCounter - leftManVPos);
			inLeftManY <= 1;
			inRightManY <= 1;
			//inKnotY <= 0;
		end
		else begin
			inLeftManY <= 0;
			inRightManY <= 0;
			vReadLeftMan <= 0;
		end
		if((vPixelCounter >= rightManVPos) && (vPixelCounter < (rightManVPos+24))) begin
			vReadRightMan <= (vPixelCounter - rightManVPos);
			inRightManY <= 1;
			inLeftManY <= 1;
			//inKnotY <= 0;
		end
		else begin
			inRightManY <= 0;
			inLeftManY <= 0;
			vReadRightMan <= 0;
		end
		if((vPixelCounter >= knotVPos) && (vPixelCounter < (knotVPos + 10)))begin
			vReadKnot <= (vPixelCounter - knotVPos);
			inKnotY <= 1;
		end
		else begin
			vReadKnot <= 0;
			inKnotY <= 0;
		end
	end
	
	always @(hReadLeftMan or vReadLeftMan or hReadRightMan or vReadRightMan or hReadKnot or vReadKnot) begin
		if(inLeftMan)begin
			glyphMemAddress <= leftManGlyphAddress + hReadLeftMan + (24*vReadLeftMan);
		end
		if(inRightMan)begin
			glyphMemAddress <= rightManGlyphAddress + hReadRightMan + (24*vReadRightMan);
		end
		if(inKnot)begin
			glyphMemAddress <= knotGlyphAddress + hReadKnot + (8*vReadKnot);
		end
	end
	
	//everytime score changes calculate position of the knot left Man and Right Man
	//case statement with 20 cases and a default.
	always @(score)begin
		case(score)
			5'd10:begin
				newLeftManHPos <= 11'd256;
				newKnotHPos <= 11'd312;
				newRightManHPos <= 11'd360;
			end
			5'd11:begin
				newLeftManHPos <= 11'd276;
				newKnotHPos <= 11'd332;
				newRightManHPos <= 11'd380;
			end
			5'd12:begin
				newLeftManHPos <= 11'd296;
				newKnotHPos <= 11'd352;
				newRightManHPos <= 11'd400;
			end
			5'd13:begin
				newLeftManHPos <= 11'd316;
				newKnotHPos <= 11'd372;
				newRightManHPos <= 11'd420;
			end
			5'd14:begin
				newLeftManHPos <= 11'd336;
				newKnotHPos <= 11'd392;
				newRightManHPos <= 11'd440;
			end
			5'd15:begin
				newLeftManHPos <= 11'd356;
				newKnotHPos <= 11'd412;
				newRightManHPos <= 11'd460;
			end
			5'd16:begin
				newLeftManHPos <= 11'd376;
				newKnotHPos <= 11'd432;
				newRightManHPos <= 11'd480;
			end
			5'd17:begin
				newLeftManHPos <= 11'd396;
				newKnotHPos <= 11'd452;
				newRightManHPos <= 11'd500;
			end
			5'd18:begin
				newLeftManHPos <= 11'd416;
				newKnotHPos <= 11'd472;
				newRightManHPos <= 11'd520;
			end
			5'd19:begin
				newLeftManHPos <= 11'd436;
				newKnotHPos <= 11'd492;
				newRightManHPos <= 11'd540;
			end
			5'd20:begin
				newLeftManHPos <= 11'd456;
				newKnotHPos <= 11'd512;
				newRightManHPos <= 11'd560;
			end
			5'd9:begin
				newLeftManHPos <= 11'd236;
				newKnotHPos <= 11'd292;
				newRightManHPos <= 11'd340;
			end
			5'd8:begin
				newLeftManHPos <= 11'd216;
				newKnotHPos <= 11'd272;
				newRightManHPos <= 11'd320;
			end
			5'd7:begin
				newLeftManHPos <= 11'd196;
				newKnotHPos <= 11'd252;
				newRightManHPos <= 11'd300;
			end
			5'd6:begin
				newLeftManHPos <= 11'd176;
				newKnotHPos <= 11'd232;
				newRightManHPos <= 11'd280;
			end
			5'd5:begin
				newLeftManHPos <= 11'd156;
				newKnotHPos <= 11'd212;
				newRightManHPos <= 11'd260;
			end
			5'd4:begin
				newLeftManHPos <= 11'd136;
				newKnotHPos <= 11'd192;
				newRightManHPos <= 11'd240;
			end
			5'd3:begin
				newLeftManHPos <= 11'd116;
				newKnotHPos <= 11'd172;
				newRightManHPos <= 11'd220;
			end
			5'd2:begin
				newLeftManHPos <= 11'd96;
				newKnotHPos <= 11'd152;
				newRightManHPos <= 11'd200;
			end
			5'd1:begin
				newLeftManHPos <= 11'd76;
				newKnotHPos <= 11'd132;
				newRightManHPos <= 11'd180;
			end
			5'd0:begin
				newLeftManHPos <= 11'd56;
				newKnotHPos <= 11'd112;
				newRightManHPos <= 11'd160;
			end
			default:begin
				newLeftManHPos <= 11'd0;
				newKnotHPos <= 11'd100;
				newRightManHPos <= 11'd200;
			end
		endcase
	end
endmodule
