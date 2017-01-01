`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:28 11/19/2015 
// Design Name: 
// Module Name:    vga_timing 
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
module vga_timing(
    input pixelClock,
    output reg hs,
    output reg vs,
    output bright,
	 output reg [9:0] hPixelCount,
	 output reg [9:0] vPixelCount
    );

 parameter hVisableArea = 640;
 parameter hFrontPorch = 16;
 parameter hBackPorch = 48;
 parameter hSyncPulse = 96;
 
 parameter vVisableArea = 480;
 parameter vFrontPorch = 10;
 parameter vBackPorch = 29;
 parameter vSyncPulse = 2;
 
 reg hBright=0;
 reg vBright=0;
 
 reg [10:0] hCount = 0;
 reg [10:0] vCount = 0;
 
 assign bright = hBright && vBright;
 
 always @(posedge pixelClock) begin
		if (hCount < (hVisableArea + hFrontPorch + hBackPorch + hSyncPulse)) begin
			hCount <= hCount + 1;
		end
		else begin
			hCount <= 0;
			if (vCount < (vVisableArea + vFrontPorch + vBackPorch + vSyncPulse)) begin
				vCount <= vCount + 1;
			end
			else begin
				vCount <= 0;
			end
		end
		
		
		if((hCount >= (hSyncPulse + hBackPorch))&&(hCount < (hSyncPulse + hBackPorch + hVisableArea)))begin
			hPixelCount <= (hCount - hSyncPulse - hBackPorch);
			hBright <= 1;
		end
		else begin
			hPixelCount <= 10'd0;
			hBright <= 0;
		end
		
		
		if((vCount >= (vSyncPulse + vBackPorch))&&(vCount < (vSyncPulse + vBackPorch + vVisableArea)))begin
			vPixelCount <= (vCount - vSyncPulse - vBackPorch);
			vBright <= 1;
		end
		else begin
			vPixelCount <= 10'd0;
			vBright <= 0;
		end
 end
 
 always @(hCount or vCount) begin
		if ((hCount >= 0) && (hCount < hSyncPulse)) begin
			hs <= 0;
		end
		else begin
			hs <= 1;
		end
		
		if ((vCount >= 0) && (vCount < vSyncPulse)) begin
			vs <= 0;
		end
		else begin
			vs <= 1;
		end
 end

endmodule
