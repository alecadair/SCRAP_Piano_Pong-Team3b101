`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:01:57 09/24/2015 
// Design Name: 
// Module Name:    alu_reg_mem 
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
module alu_reg_mem(
	//global inputs
	input clk,
	input pixelClk,
	input reset,
	
	//Midi Notes in
	input [15:0] midiNotes,
	input noteForMem,
	input midiInterrupt,
	output resetNoteForMem,

	//alu control inputs
	input immEn,
	input [15:0] imm,
	input [4:0] bufEnA,
	input [4:0] bufEnB,
	input [7:0] aluOp,
	input [4:0] regEn,
	input cin,
	input memReadEn,
	input aluResultEn,

	//mem control inputs
	input memEnA,
	input memWeA,

	//mem control inputs
	input memEnB,
	input memWeB,

	//Mem data out control
	input memOutEnA,
	input memOutEnB,

	//mem Addressing
	input pcAddrEn,
	input regAddrEn,
	 
	 
	 //output
	output [15:0] memOutA,
	output [15:0] memOutB,
	output [4:0] aluFlags,
	output [15:0] busBDataOut,
	output [13:0] PCOut,
	output [15:0] R8out,
	output [7:0]RGB,
	output hs, vs, 

	//PC
	input PCen, 		//PC+1
	input branchEn,	//PC+Offset
	input [9:0] branchOffsetImm,
	input jumpEn		//PC = jumpAddr
	
	);
	 
	 wire [15:0] busADataforAddressing;
	 wire [15:0] memRead;	 
	 wire [15:0] busADataOut;
	 wire [5:0] regEnNumber;
	 wire [13:0] memAddressing;
	 wire [13:0] memAddressManager;
	 wire [15:0] memDataManager;
 
	 wire [9:0] memBAddress;
	 wire [15:0] memBdata;
	 wire memenb;
	 wire memwenb;
	 wire p1Miss;
	 wire p2Miss;
	 wire [15:0] R8outWire;
	 wire correctNote0;
	 
	 assign R8out = R8outWire;
	 assign busADataforAddressing = busADataOut;
	 
	 
	 //alu and regfile:
	 alu_and_reg alu_reg_0(aluOp, regEn, imm, immEn, memRead, memReadEn, reset, clk, cin, bufEnA, bufEnB, aluResultEn, aluFlags, busADataOut, busBDataOut, R8outWire);
	 
	 //memory:
    memory mem_0(clk, memDataManager, memEnA, memWeA, memAddressManager, memOutA, memenb, memwenb, memBAddress, memBdata);
	
	 //memory out buffers to imm bus
	 Tri_Buf Tri_Buf_mem_A_to_ALU(memOutA, memOutEnA, memRead);
	 Tri_Buf Tri_Buf_mem_B_to_ALU(memOutB, memOutEnB, memRead); 
	 
	 //PC:
	 pc pc_unit(clk, PCen, branchEn, branchOffsetImm, jumpEn, busBDataOut[13:0], reset, PCOut);
	 
	 //Address from Register Bus A or PC:
	 Tri_Buf pc_addressing(PCOut, pcAddrEn, memAddressing);
	 Tri_Buf register_addressing(busADataforAddressing[13:0], regAddrEn, memAddressing);
	 
	  //VGA_Module
	 VGA_Module vga_module (.VGA_Data(memBdata[15:0]), .midiNote(midiNotes), .clock(pixelClk), .MemEnB(memenb), 
		 .MemWEnB(memwenb),  .VGADataAddr(memBAddress[9:0]), .HS(hs), .VS(vs), .RGBVal(RGB[7:0]), .p1Miss(p1Miss), .p2Miss(p2Miss), .reg8(R8outWire),
		 .correctNote0(correctNote0)
		);
		
	midiMemMan MidiMemoryManager (
			 .MidiInterrupt(MidiInterrupt), 
			 .memoryAddressALU(memAddressing), 
			 .dataALU(busBDataOut), 
			 .dataMidi(midiNotes), 
			 .memoryAddress(memAddressManager), 
			 .dataOut(memDataManager),
			 .correctNote0(correctNote0),
			 .correctNote1(correctNote1),
			 .correctNote2(correctNote2),
			 .correctNote3(correctNote3),
			 .correctNote4(correctNote4),
			 .correctNote5(correctNote5),
			 .correctNote6(correctNote6),
			 .correctNote7(correctNote7),
			 .correctNote8(correctNote8),
			 .correctNote9(correctNote9),
			 .correctNote10(correctNote10),
			 .correctNote11(correctNote11),
			 .p1Miss(p1Miss),
			 .p2Miss(p2Miss)
			 );

endmodule
