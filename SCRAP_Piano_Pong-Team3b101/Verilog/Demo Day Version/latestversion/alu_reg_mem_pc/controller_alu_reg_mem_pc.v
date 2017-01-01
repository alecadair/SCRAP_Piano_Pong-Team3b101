////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : sch2hdl
//  /   /         Filename : schematic_pc_controller_aluregmem.vf
// /___/   /\     Timestamp : 11/02/2015 15:04:29
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: sch2hdl -intstyle ise -family spartan6 -verilog C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/schematic_pc_controller_aluregmem.vf -w C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/schematic_pc_controller_aluregmem.sch
//Design Name: schematic_pc_controller_aluregmem
//Device: spartan6
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module controller_alu_reg_mem_pc(/*noteReadyFlag, midiNote,*/ clk, reset, midiIn, midiStatus, digit, segment, sevenSegInput,hs,vs,rgb);
/*
	input noteReadyFlag;
	input [15:0] midiNote;*/
	
   input clk;
   input reset;
	input midiIn;
	output midiStatus;
   output [7:0] digit;
   output [3:0] segment;
	output [15:0] sevenSegInput;
	output hs;
	output vs;
	output [7:0] rgb;
   
   wire [7:0] aluOp;
   wire aluResultEn;
   wire branchEn;
   wire [9:0] branchOffsetImm5;
   wire [4:0] bufEnA;
   wire [4:0] bufEnB;
   wire cin;
   wire [15:0] imm;
   wire immEn;
   wire jumpEn;
   wire memEnA;
   wire memEnB;
   wire memOutEnA;
   wire memOutEnB;
   wire memReadEn;
   wire memWeA;
   wire memWeB;
   wire pcAddrEn;
   wire PCen;
   wire regAddrEn;
   wire [4:0] regEn;
   wire [15:0] memOutA_to_instruction;
	wire [4:0] flags;
	wire [15:0] R8out;
	wire normalClock;
	wire pixelClockWire;
	wire [15:0] midiNote;
	wire noteReadyFlag;
	wire resetNoteReadyFlag;
	wire midiInterrupt;
	
	//assign sevenSegInput = R8out;
	
	pixelClock pixelClockModule (	.clkIn(clk), 
											.pixelClock(pixelClockWire), 
											.normalClock(normalClock));
											
	midiInput midiInput (
											 .clk(normalClock), 
											 .midiIn(midiIn), 
											 .rx(midiStatus), 
											 .midiNoteOut(midiNote),
											 .noteForMem(noteReadyFlag),
											 .resetNoteForMem(resetNoteReadyFlag)
											 );
		
   alu_reg_mem  alu_reg_mem_unit (.aluOp(aluOp[7:0]), 
                                 .aluResultEn(aluResultEn), 
                                 .branchEn(branchEn), 
                                 .branchOffsetImm(branchOffsetImm5[9:0]), 
                                 .bufEnA(bufEnA[4:0]), 
                                 .bufEnB(bufEnB[4:0]), 
                                 .cin(cin), 
                                 .clk(normalClock),
											.pixelClk(pixelClockWire),
                                 .imm(imm[15:0]), 
                                 .immEn(immEn), 
                                 .jumpEn(jumpEn), 
                                 .memEnA(memEnA), 
                                 .memEnB(memEnB), 
                                 .memOutEnA(memOutEnA), 
                                 .memOutEnB(memOutEnB), 
                                 .memReadEn(memReadEn), 
                                 .memWeA(memWeA), 
                                 .memWeB(memWeB),
											.midiNotes(midiNote),
                                 .pcAddrEn(pcAddrEn), 
                                 .PCen(PCen), 
                                 .regAddrEn(regAddrEn), 
                                 .regEn(regEn[4:0]), 
                                 .reset(reset), 
                                 .aluFlags(flags), 
                                 .busBDataOut(), 
                                 .memOutA(memOutA_to_instruction), 
                                 .memOutB(), 
                                 .PCOut(),
											.R8out(sevenSegInput),
											.RGB(rgb),
											.hs(hs),
											.vs(vs),
											.midiInterrupt(midiInterrupt));

   ControlUnit  controller (.clk(normalClock), 
                           .instruction(memOutA_to_instruction),
									.flags(flags),
                           .reset(reset),
                           .aluOp(aluOp[7:0]), 
                           .aluResultEn(aluResultEn),
                           .branchEn(branchEn), 
                           .branchOffsetImm(branchOffsetImm5[9:0]), 
                           .bufEnA(bufEnA[4:0]), 
                           .bufEnB(bufEnB[4:0]), 
                           .cin(cin), 
                           .imm(imm[15:0]), 
                           .immEn(immEn), 
                           .jumpEn(jumpEn), 
                           .memEnA(memEnA), 
                           .memEnB(/*memEnB*/), 
                           .memOutEnA(memOutEnA), 
                           .memOutEnB(memOutEnB), 
                           .memReadEn(memReadEn), 
                           .memWeA(memWeA), 
                           .memWeB(/*memWeB*/), 
                           .pcAddrEn(pcAddrEn), 
                           .PCen(PCen), 
                           .regAddrEn(regAddrEn), 
                           .regEn(regEn[4:0]),
									.noteForMem(noteReadyFlag),
									.resetNoteForMem(resetNoteReadyFlag),
									.midiInterrupt(midiInterrupt)
									);
	LEDdriver ledDriver (
		 .RESULTLedIn(sevenSegInput), 
		 .CLK(normalClock), 
		 .Segment(segment), 
		 .Digit(digit), 
		 .Reset(reset)
		 );

endmodule
