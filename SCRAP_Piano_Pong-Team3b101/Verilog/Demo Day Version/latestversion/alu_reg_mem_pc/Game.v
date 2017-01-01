`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:51 12/09/2015 
// Design Name: 
// Module Name:    Game 
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
module Game(
	/*Test Inputs*/
//		input [15:0] midiNoteWire,
//		input noteForMem,

	input clk,
	input reset,
	input midiFromKeyboard,
	output HS,
	output VS,
	output [7:0] RGB,
	output [7:0] digit,
	output [3:0] segment,
	output midiRx,
	output note0timerOn,
	output note0enWire
    );
	 
	wire [15:0] midiNoteWire;
	wire pixelClock;
	wire p1Miss;
	wire p2Miss;
	wire noteForMem;
	wire resetNoteForMem;
	wire correctNote0;
	wire MemEnB;
	wire MemWEnB;
	wire [15:0] VGA_Data ;
	wire [9:0] VGADataAddr;
	wire p1turn;
	wire p2turn;
	wire [4:0] score;
	reg [15:0] p1orp2turn;
	
	always @ (note0timerOn) begin
		if (p1turn) begin
			p1orp2turn = 16'd1;
		end
		else if (p2turn) begin
			p1orp2turn = 16'd2;
		end
		else begin
			p1orp2turn = 16'd0;
		end
	end
	
	midiInput MidiInput (
    .clk(normalClock), 
    .midiIn(midiFromKeyboard), 
    .rx(midiRx),
    .midiNoteOut(midiNoteWire), 
    .noteForMem(noteForMem), 
    .resetNoteForMem(resetNoteForMem)
    );

	pixelClock PixelClock (
    .clkIn(clk), 
    .pixelClock(pixelClock), 
    .normalClock(normalClock)
    );
	 
	VGA_Module VGAModule (
    .VGA_Data(VGA_Data), 
    .midiNote(midiNoteWire), 
    .clock(pixelClock), 
    .MemEnB(MemEnB), 
    .MemWEnB(MemWEnB), 
    .VGADataAddr(VGADataAddr), 
    .p1Miss(p1Miss), 
    .p2Miss(p2Miss), 
    .HS(HS), 
    .VS(VS), 
    .RGBVal(RGB), 
    .correctNote0(correctNote0),
	 .note0en(note0enWire),
	 .note0timerOn(note0timerOn),
	 .p1turn(p1turn),
	 .p2turn(p2turn),
	 .reset(reset),
	 .score(score)
    );
	
	
	LEDdriver LEDDriver (
    .RESULTLedIn({11'd0 ,score}), 
    .CLK(normalClock), 
    .Segment(segment), 
    .Digit(digit), 
    .Reset(reset)
    );
	 
	 memory Memory (
    .clk(pixelClock), 
    .din(din), 
    .enA(enA), 
    .weA(weA), 
    .addrA(addrA), 
    .doutA(doutA), 
    .enB(MemEnB), 
    .weB(MemWEnB), 
    .addrB(VGADataAddr), 
    .doutB(VGA_Data)
    );
	 
	 midiMemMan MidiMemoryManager (
	 .clk(pixelClock),
    .MidiInterrupt(noteForMem),
	 .note0en(note0enWire), 
    .dataMidi(midiNoteWire), 
    .correctNote0(correctNote0), 
	 .resetNoteForMem(resetNoteForMem)
    );
	 
	 
endmodule
