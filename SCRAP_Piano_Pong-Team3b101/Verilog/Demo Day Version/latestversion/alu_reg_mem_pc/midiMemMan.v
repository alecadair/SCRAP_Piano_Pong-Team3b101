`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:36 11/29/2015 
// Design Name: 
// Module Name:    midiMemMan 
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
module midiMemMan(
	 input clk,
    input MidiInterrupt,
    input [15:0] dataMidi,
	 input correctNote0,
	 output reg resetNoteForMem = 0,
	 output reg note0en = 0
    );
	
	reg nextResetNoteForMem = 0;
	
	reg note0Full = 0;
	
	
	always @(posedge clk) begin
		resetNoteForMem <= nextResetNoteForMem;
	end
	
	always @(MidiInterrupt or correctNote0) begin
		nextResetNoteForMem <= 0;
		note0en <= note0en;
		if (MidiInterrupt) begin
			nextResetNoteForMem <= 1;
			if (dataMidi[15:8] == 8'h3c) begin
				note0en <= 0;
			end
			else if (note0Full == 0) begin
				note0en <= 1;
			end
		end
		if (correctNote0 == 0) begin
			nextResetNoteForMem <= 1;
			note0Full <= 0;
			note0en <= 0;
		end
	end
	
	

endmodule
