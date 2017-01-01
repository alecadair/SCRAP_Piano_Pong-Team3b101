`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:04 10/29/2015 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
	input [15:0] instruction,
	input [4:0] flags,
	input clk,
	input reset,
	input noteForMem,
	output reg resetNoteForMem = 0,
	output reg midiInterrupt =0,
	output reg memOutEnA = 1,
	output reg [4:0] regEn = 0,
	output reg aluResultEn = 0,
	output reg cin = 0,
	output reg immEn = 0,
	output reg memReadEn = 0,
	output reg [7:0] aluOp = 0,
	output reg [4:0] bufEnA = 0,
	output reg [4:0] bufEnB = 0,
	output reg [15:0] imm = 0,
	output reg memOutEnB = 0,
	output reg memEnA = 1,
	output reg memEnB = 0,
	output reg memWeA = 0,
	output reg memWeB = 0,
	output reg [9:0] branchOffsetImm = 0,
	output reg branchEn = 0,
	output reg jumpEn = 0,
	output reg PCen = 0,
	output reg pcAddrEn = 1,
	output reg regAddrEn = 0);
	 
	reg[3:0] state = 4'd0;
	reg[3:0] nextState = 4'd0;
	reg[15:0] thisInstruction = 16'd0;
	
	parameter FETCH_STATE = 4'd0;
	parameter DECODE_STATE = 4'd1;
	parameter EXECUTE_STATE = 4'd2;
	parameter LOAD_DATA_STATE = 4'd3;
	parameter LOAD_EXECUTE_STATE = 4'd4;
	parameter STORE_STATE = 4'd5;
	parameter BRANCH_STATE = 4'd6;
	parameter JUMP_STATE = 4'd7;
	parameter STORE_MIDI_STATE = 4'd8;
	parameter READ_MIDI_STATE = 4'd9;
	 
	//PS BLOCK
	always@(posedge clk) begin
		if (reset)begin
			state <= FETCH_STATE;
		end
		else begin
			state <= nextState;
		end
		if (noteForMem && (nextState == FETCH_STATE)) begin
			state <= STORE_MIDI_STATE;
		end
	end
	
	always@(*)begin
			case(state)
				FETCH_STATE:begin //call the FETCH task
					Fetch(instruction[15:0], thisInstruction[15:0], memOutEnA,regEn [4:0],aluResultEn,cin,
							immEn, memReadEn, aluOp[7:0], bufEnA[4:0], bufEnB[4:0],imm[15:0],
							memOutEnB, memEnA, memEnB, memWeA, memWeB, branchOffsetImm[9:0],
							branchEn, jumpEn, PCen, nextState[3:0], pcAddrEn, regAddrEn, thisInstruction[15:0], midiInterrupt);
							resetNoteForMem <= 0;
				end //end of fetch

				DECODE_STATE:begin //call the decode task
					 Decode(instruction[15:0],
					 memOutEnA,
					 regEn [4:0],
					 aluResultEn,
					 cin,
					 immEn,
					 memReadEn,
					 aluOp[7:0],
					 bufEnA[4:0],
					 bufEnB[4:0],
					 imm[15:0],
					 memOutEnB,
					 memEnA,
					 memEnB,
					 memWeA,
					 memWeB,
					 branchOffsetImm[9:0],
					 branchEn,
					 jumpEn,
					 PCen,
					 nextState [3:0],
					 pcAddrEn,
					 regAddrEn,
					 thisInstruction[15:0],
					 midiInterrupt);
					 resetNoteForMem <= 0;
				end //end of decode task

				EXECUTE_STATE:begin //call the execute task
					 Execute(instruction[15:0],
					 thisInstruction[15:0],
					 memOutEnA,
					 regEn [4:0],
					 aluResultEn,
					 cin,
					 immEn,
					 memReadEn,
					 aluOp[7:0],
					 bufEnA[4:0],
					 bufEnB[4:0],
					 imm[15:0],
					 memOutEnB,
					 memEnA,
					 memEnB,
					 memWeA,
					 memWeB,
					 branchOffsetImm[9:0],
					 branchEn,
					 jumpEn,
					 PCen,
					 nextState[3:0],
					 pcAddrEn,
					 regAddrEn,
					 thisInstruction[15:0],
					 midiInterrupt);
					 resetNoteForMem <= 0;
				end //end of execute

				LOAD_DATA_STATE:begin // call the load data task
					 Load_Data(instruction[15:0],
					 thisInstruction[15:0],
					 memOutEnA,
					 regEn [4:0],
					 aluResultEn,
					 cin,
					 immEn,
					 memReadEn,
					 aluOp[7:0],
					 bufEnA[4:0],
					 bufEnB[4:0],
					 imm[15:0],
					 memOutEnB,
					 memEnA,
					 memEnB,
					 memWeA,
					 memWeB,
					 branchOffsetImm[9:0],
					 branchEn,
					 jumpEn,
					 PCen,
					 nextState[3:0],
					 pcAddrEn,
					 regAddrEn,
					 thisInstruction[15:0],
					 midiInterrupt);
					 resetNoteForMem <= 0;
				end // end of load data
		
				LOAD_EXECUTE_STATE:begin // call load execute task
					 Load_Execute(instruction[15:0],
					 thisInstruction[15:0],
					 memOutEnA,
					 regEn [4:0],
					 aluResultEn,
					 cin,
					 immEn,
					 memReadEn,
					 aluOp[7:0],
					 bufEnA[4:0],
					 bufEnB[4:0],
					 imm[15:0],
					 memOutEnB,
					 memEnA,
					 memEnB,
					 memWeA,
					 memWeB,
					 branchOffsetImm[9:0],
					 branchEn,
					 jumpEn,
					 PCen,
					 nextState[3:0],
					 pcAddrEn,
					 regAddrEn,
					 thisInstruction[15:0],
					 midiInterrupt);
					 resetNoteForMem <= 0;
				end // end of load execute

				STORE_STATE:begin // call store task
					 Store_State(instruction[15:0],
					 thisInstruction[15:0],
					 memOutEnA,
					 regEn [4:0],
					 aluResultEn,
					 cin,
					 immEn,
					 memReadEn,
					 aluOp[7:0],
					 bufEnA[4:0],
					 bufEnB[4:0],
					 imm[15:0],
					 memOutEnB,
					 memEnA,
					 memEnB,
					 memWeA,
					 memWeB,
					 branchOffsetImm[9:0],
					 branchEn,
					 jumpEn,
					 PCen,
					 nextState[3:0],
					 pcAddrEn,
					 regAddrEn,
					 thisInstruction[15:0],
					 midiInterrupt);
					 resetNoteForMem <= 0;
				end // end store

				BRANCH_STATE:begin // call branch task
					Branch_Execute(instruction[15:0],
					thisInstruction[15:0],
					flags[4:0],
					memOutEnA,
					regEn [4:0],
					aluResultEn,
					cin,
					immEn,
					memReadEn,
					aluOp[7:0],
					bufEnA[4:0],
					bufEnB[4:0],
					imm[15:0],
					memOutEnB,
					memEnA,
					memEnB,
					memWeA,
					memWeB,
					branchOffsetImm[9:0],
					branchEn,
					jumpEn,
					PCen,
					nextState[3:0],
					pcAddrEn,
					regAddrEn,
					thisInstruction[15:0],
					midiInterrupt);
					resetNoteForMem <= 0;
				end // end branch task

				JUMP_STATE :begin // call jump task
					Jump_Execute(instruction[15:0],
					thisInstruction[15:0],
					flags[4:0],
					memOutEnA,
					regEn [4:0],
					aluResultEn,
					cin,
					immEn,
					memReadEn,
					aluOp[7:0],
					bufEnA[4:0],
					bufEnB[4:0],
					imm[15:0],
					memOutEnB,
					memEnA,
					memEnB,
					memWeA,
					memWeB,
					branchOffsetImm[9:0],
					branchEn,
					jumpEn,
					PCen,
					nextState[3:0],
					pcAddrEn,
					regAddrEn,
					thisInstruction[15:0],
					midiInterrupt);
					resetNoteForMem <= 0;
				end // end jump task
				
				STORE_MIDI_STATE :begin
					Store_Midi_State(instruction[15:0],
					thisInstruction[15:0],
					flags[4:0],
					memOutEnA,
					regEn [4:0],
					aluResultEn,
					cin,
					immEn,
					memReadEn,
					aluOp[7:0],
					bufEnA[4:0],
					bufEnB[4:0],
					imm[15:0],
					memOutEnB,
					memEnA,
					memEnB,
					memWeA,
					memWeB,
					branchOffsetImm[9:0],
					branchEn,
					jumpEn,
					PCen,
					nextState[3:0],
					pcAddrEn,
					regAddrEn,
					thisInstruction[15:0],
					midiInterrupt);
					resetNoteForMem <= 1;
				end // End Store Midi State
					
				default: begin //call the FETCH task
					Fetch(instruction[15:0], thisInstruction[15:0], memOutEnA,regEn [4:0],aluResultEn,cin,
						immEn, memReadEn, aluOp[7:0], bufEnA[4:0], bufEnB[4:0],imm[15:0],
						memOutEnB, memEnA, memEnB, memWeA, memWeB, branchOffsetImm[9:0],
						branchEn, jumpEn, PCen, nextState[3:0], pcAddrEn, regAddrEn, thisInstruction[15:0], midiInterrupt);
						resetNoteForMem <= 0;
				end //end of fetch
				
						
			endcase
	end
 
	task Fetch;
		input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg pcAddrEn;
		output reg regAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		begin
		MemOutEnA = 1'b0;
		RegEn = 5'd16;
		AluResultEn = 1'b0;
		Cin = 1'b0;
		ImmEn = 1'b0;
		MemReadEn = 1'b0;
		AluOp = 8'h00;
		BufEnA = 5'd0;
		BufEnB = 5'd0;
		Imm = 16'd0;
		MemOutEnB = 1'b0;
		MemEnA = 1'b1;
		MemEnB = 1'b0;
		MemWeA = 1'b0;
		MemWeB = 1'b0;
		BranchOffsetImm = 10'b0;
		BranchEn = 1'b0;
		JumpEn = 1'b0;
		PCEn = 1'b0;
		NextState = DECODE_STATE;
		pcAddrEn = 1'b1;
		regAddrEn = 1'b0;
		MidiInterrupt = 0;
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		end 
	endtask
	 
	task Decode;
		input [15:0] Instruction;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg AluResultEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg pcAddrEn;
		output reg regAddrEn;
		output reg [15:0] ThisInstruction;
		output reg MidiInterrupt;
		
		begin
		MemOutEnA = 1'b0;
		RegEn = 5'd16;
		AluResultEn = 1'b0;
		Cin = 1'b0;
		ImmEn = 1'b0;
		MemReadEn = 1'b0;
		AluOp = 8'h00;
		BufEnA = 5'd0;
		BufEnB = 5'd0;
		Imm = 16'd0;
		MemOutEnB = 1'b0;
		MemEnA = 1'b1;
		MemEnB = 1'b0;
		MemWeA = 1'b0;
		MemWeB = 1'b0;
		BranchOffsetImm = 10'b0;
		BranchEn = 1'b0;
		JumpEn = 1'b0;
		PCEn = 1'b0;
		pcAddrEn = 1'b1;
		regAddrEn = 1'b0;
		MidiInterrupt = 0;
		ThisInstruction [15:0] = Instruction [15:0];
		
		casex({Instruction[15:12],Instruction[7:4]})
			8'b0000_xxxx: NextState = EXECUTE_STATE; // State 2 = R-type
			8'b1000_0100: NextState = EXECUTE_STATE; // LSH R-Type
			8'b1000_0110: NextState = EXECUTE_STATE; // ASH R-Type
			8'b1000_000x: NextState = EXECUTE_STATE; // LSH I-Type
			8'b1000_001x: NextState = EXECUTE_STATE; // ASH U I-Type
			8'b0101_xxxx: NextState = EXECUTE_STATE; // State 3 = I-type ALU
			8'b1001_xxxx: NextState = EXECUTE_STATE; // State 3 = I-type ALU
			8'b0001_xxxx: NextState = EXECUTE_STATE; // andI I-type
			8'b0010_xxxx: NextState = EXECUTE_STATE; // orI I-type
			8'b0011_xxxx: NextState = EXECUTE_STATE; // xorI I-Type
			8'b1101_xxxx: NextState = EXECUTE_STATE; // movI
			8'b0100_0000: NextState = LOAD_DATA_STATE; // Load Rdst
			8'b0100_0100: NextState = STORE_STATE; // Store
			8'b1100_xxxx: NextState = BRANCH_STATE; // Branch Conditional
			8'b0100_1100: NextState = JUMP_STATE; // Jump Conditional
			default: NextState = EXECUTE_STATE;
		endcase
		end
	endtask
	
	task Execute;
		input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg pcAddrEn;
		output reg regAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		reg iType;
		reg rType;
		
		begin
			NextState = FETCH_STATE;
			
			//Dont change for these R-Type:
			PCEn = 1'b1;
			BranchOffsetImm = 10'd0;
			BranchEn = 1'b0;
			JumpEn = 1'b0;
			MemReadEn = 1'b0;
			pcAddrEn = 1'b1;
			regAddrEn = 1'b0;
			MidiInterrupt = 0;
			ThisInstructionOut [15:0] = ThisInstructionIn [15:0];
			
			if((Instruction[15:9] == 7'b1000001) ||
				(Instruction[15:12] == 4'b0101) ||
				(Instruction[15:12] == 4'b1001) ||
				(Instruction[15:12] == 4'b0001) ||
				(Instruction[15:12] == 4'b0010) ||
				(Instruction[15:12] == 4'b0011) ||
				(Instruction[15:12] == 4'b1101) ||
				(Instruction[15:12] == 4'b1011)) begin //I TYPE INSTRUCTIONS		
				iType = 1;
				rType = 0;
			end
			else begin
				rType = 1;
				iType = 0;
			end 
			
			if (iType) begin
				//sign extended the immediate
				if((Instruction[15:12] == 4'b0101) ||
					(Instruction[15:12] == 4'b1001) ||
					(Instruction[15:12] == 4'b1011)) begin
						Imm = {{8{Instruction[7]}}, Instruction[7:0]};
				end
				else begin
					Imm = {8'd0, Instruction[7:0]};
				end				
				case(Instruction[15:12])
					4'b0101:AluOp = 8'h05;
					4'b0110:AluOp = 8'h06;
					4'b1001:AluOp = 8'h09;
					4'b1011:AluOp = 8'h0b;
					4'b0001:AluOp = 8'h01;
					4'b0010:AluOp = 8'h02;
					4'b0011:AluOp = 8'h03;
					4'b1101:AluOp = 8'h0d;
					default:AluOp = 8'h00;
				endcase
				if(Instruction[15:12] == 4'b1011) begin //if CMP, dont write over Rdest
					RegEn = 5'd16;
				end
				else begin	//not CMP, enable Rdest
					RegEn = Instruction[11:8];
				end
				ImmEn = 1'b1;
				AluResultEn = 1'b1;
				BufEnA = Instruction[11:8];
				BufEnB = 5'd16;
						
				Cin = 1'b0;
				MemOutEnA = 1'b0;
				MemOutEnB = 1'b0;
				MemEnB = 1'b0;
				MemWeA = 1'b0;
				MemWeB = 1'b0;
				MemEnA = 1'b1;
			end
			
			else begin //R-TYPE INSTRUCTIONS:
				ImmEn = 1'b0;
				Imm = 16'd0;
				AluResultEn = 1'b1;
				Cin = 1'b0;
				AluOp = {Instruction[15:12],Instruction[7:4]};
				//tst
				BufEnA = Instruction[11:8];
				BufEnB = Instruction[3:0];
				MemOutEnA = 1'b0;
				MemOutEnB = 1'b0;
				MemEnB = 1'b0;
				MemWeA = 1'b0;
				MemWeB = 1'b0;
				MemEnA = 1'b1;
				if({Instruction[15:12],Instruction[7:4]} == 8'b0000_1011) begin //if CMP, dont write over Rdest
					RegEn = 5'd16;
				end
				else begin	//not CMP, enable Rdest
					RegEn = Instruction[11:8];
				end
			end
		end
	endtask
	
	task Load_Data;
		input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg pcAddrEn;
		output reg regAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		begin
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		PCEn = 1'b0;
		
		MemWeA = 1'b0;
		MemWeB = 1'b0;
		MemEnB = 1'b0;
		MemOutEnB = 1'b0;
		BranchOffsetImm = 10'd0;
		BranchEn = 1'b0;
		JumpEn = 1'b0;
		MemReadEn = 1'b1;
		ImmEn = 1'b0;
		Imm = 16'd0;
		Cin = 1'b0;
		AluResultEn = 1'b0;
		MidiInterrupt = 0;
		
		RegEn = 5'd16;
		MemEnA = 1'b1;
		MemOutEnA =1'b0;
		AluOp = 8'h00;//NOP
		BufEnB = 5'd16; //NA
		BufEnA = ThisInstructionIn[3:0];
		pcAddrEn = 1'b0;
		regAddrEn = 1'b1;
	
		NextState = LOAD_EXECUTE_STATE;
		end
	endtask
		
	task Load_Execute;
		input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg pcAddrEn;
		output reg regAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		begin
		PCEn = 1'b1;
		
		MemWeA = 1'b0;
		MemWeB = 1'b0;
		MemEnB = 1'b0;
		MemOutEnB = 1'b0;
		BranchOffsetImm = 10'd0;
		BranchEn = 1'b0;
		JumpEn = 1'b0;
		MemReadEn = 1'b1;
		ImmEn = 1'b0;
		Imm = 16'd0;
		Cin = 1'b0;
		AluResultEn = 1'b0;
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		MidiInterrupt = 0;
		
		RegEn = ThisInstructionIn[11:8];
		MemEnA = 1'b1;
		MemOutEnA =1'b1;
		AluOp = 8'h00;//NOP
		BufEnB = 5'd16; //NA
		BufEnA = ThisInstructionIn[3:0];
		pcAddrEn = 1'b1;
		regAddrEn = 1'b0;
		
		NextState = FETCH_STATE;
		end
	endtask
	
	task Store_State;
	   input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg PcAddrEn;
		output reg RegAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		begin		
		BufEnB = Instruction[11:8];
		BufEnA = Instruction[3:0];
		MemEnA = 1'b1;
		MemWeA = 1'b1;
		
		MemWeB = 1'b0;
		MemEnB = 1'b0;
		MemOutEnB = 1'b0;
		BranchOffsetImm = 10'd0;
		BranchEn = 1'b0;
		JumpEn = 1'b0;
		MemReadEn = 1'b0;
		ImmEn = 1'b0;
		Imm = 16'd0;
		Cin = 1'b0;
		AluResultEn = 1'b0;
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		MidiInterrupt = 0;
		
		RegEn = 5'd16;
		MemOutEnA =1'b0;
		AluOp = 8'h00;//nop
		PcAddrEn = 1'b0;
		RegAddrEn = 1'b1;
		
		PCEn = 1'b1;
		NextState = FETCH_STATE;
		end
	endtask
	
	task Branch_Execute;
		input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		input [4:0] Flags;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg PcAddrEn;
		output reg RegAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		begin
		MemOutEnA = 1'b0;
		RegEn = 5'd16;
		AluResultEn = 1'b0;
		Cin = 1'b0;
		ImmEn = 1'b0;
		Imm = 16'd0;
		MemReadEn = 1'b0;
		AluOp = 8'h00;
		BufEnA = 5'd16;
		BufEnB = 5'd16;
		MemOutEnB = 1'b0;
		MemEnB = 1'b0;
		MemWeA = 1'b0;
		MemWeB = 1'b0;
		MemEnA = 1'b1;
		JumpEn = 1'b0;
		BranchOffsetImm = {{2{Instruction[7]}}, Instruction[7:0]};
		PcAddrEn = 1'b1;
		RegAddrEn = 1'b0;
		MidiInterrupt = 0;
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		//Instruction [11:8] is condition code
		case(Instruction [11:8])
			4'b0000: begin //EQ
				if (Flags[3] == 1) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b0001: begin //NE
				if (Flags[3] == 0) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b1101: begin  //GE
				if ((Flags[4]==1) || (Flags[3] == 1)) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b0010: begin //CS
				if (Flags[0] == 1) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b0011: begin //CC
				if (Flags[0] == 0) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b0100: begin //HI
				if (Flags[1] == 1) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b0101: begin //LS
				if (Flags[1] == 0) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b1010: begin //LO
				if ((Flags[1] == 0) && (Flags[3] == 0)) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b1011: begin //HS
				if ((Flags[1] == 1) || (Flags[3] == 1)) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end			
			end
			4'b0110: begin //GT
				if (Flags[4] == 1) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b0111: begin //LE
				if (Flags[4] == 0) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			4'b1000: begin //FS
			//?
			BranchEn = 0;
			PCEn = 1'b1;
			end
			4'b1001: begin //FC
			//?
			BranchEn = 0;
			PCEn = 1'b1;
			end
			4'b1100: begin //LT
				if ((Flags[4] == 0) && (Flags[3] == 0)) begin
					BranchEn = 1;
					PCEn = 1'b0;
				end
				else begin
					BranchEn = 0;
					PCEn = 1'b1;
				end
			end
			default: begin
					BranchEn = 1'b0;
					PCEn = 1'b1;
				end
		endcase
		RegAddrEn = 1'b0;
		NextState = FETCH_STATE;
		end
	endtask
	
	task Jump_Execute;
		input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		input [4:0] Flags;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg PcAddrEn;
		output reg RegAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		//jump conditions: instruction[11:8]
		
		begin
		MemOutEnA = 1'b0;
		RegEn = 5'd16;
		AluResultEn = 1'b0;
		Cin = 1'b0;
		ImmEn = 1'b0;
		Imm = 16'd0;
		MemReadEn = 1'b0;
		AluOp = 8'h00;
		BufEnA = 5'd16;
		BufEnB = Instruction[3:0];
		MemOutEnB = 1'b0;
		MemEnB = 1'b0;
		MemWeA = 1'b0;
		MemWeB = 1'b0;
		MemEnA = 1'b1;
		BranchOffsetImm = 10'd0;
		BranchEn = 1'b0;
		PCEn = 1'b0;
		NextState = FETCH_STATE;
		PcAddrEn = 1'b1;
		RegAddrEn = 1'b0;
		MidiInterrupt = 0;
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		
		//Instruction [11:8] is condition code
		case(Instruction [11:8])
			4'b0000: begin //EQ
				if (Flags[3] == 1) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b0001: begin //NE
				if (Flags[3] == 0) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b1101: begin  //GE
				if ((Flags[4]==1) || (Flags[3] == 1)) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b0010: begin //CS
				if (Flags[0] == 1) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b0011: begin //CC
				if (Flags[0] == 0) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b0100: begin //HI
				if (Flags[1] == 1) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b0101: begin //LS
				if (Flags[1] == 0) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b1010: begin //LO
				if ((Flags[1] == 0) && (Flags[3] == 0)) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b1011: begin //HS
				if ((Flags[1] == 1) || (Flags[3] == 1)) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end			
			end
			4'b0110: begin //GT
				if (Flags[4] == 1) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b0111: begin //LE
				if (Flags[4] == 0) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			4'b1000: begin //FS
			//?
			JumpEn = 1'b0;
			PCEn = 1'b1;
			end
			4'b1001: begin //FC
			//?
			JumpEn = 1'b0;
			PCEn = 1'b1;
			end
			4'b1100: begin //LT
				if ((Flags[4] == 0) && (Flags[3] == 0)) begin
					JumpEn = 1'b1;
					PCEn = 1'b0;
				end
				else begin
					JumpEn = 1'b0;
					PCEn = 1'b1;
				end
			end
			default: begin
				JumpEn = 1'b0;
				PCEn = 1'b1;
			end
		endcase
		
		end
	endtask
	
	task Store_Midi_State;
	   input [15:0] Instruction;
		input [15:0] ThisInstructionIn;
		input [4:0] Flags;
		output reg MemOutEnA;
		output reg [4:0] RegEn;
		output reg AluResultEn;
		output reg Cin;
		output reg ImmEn;
		output reg MemReadEn;
		output reg [7:0] AluOp;
		output reg [4:0] BufEnA;
		output reg [4:0] BufEnB;
		output reg [15:0] Imm;
		output reg MemOutEnB;
		output reg MemEnA;
		output reg MemEnB;
		output reg MemWeA;
		output reg MemWeB;
		output reg [9:0] BranchOffsetImm;
		output reg BranchEn;
		output reg JumpEn;
		output reg PCEn;
		output reg [3:0] NextState;
		output reg PcAddrEn;
		output reg RegAddrEn;
		output reg [15:0] ThisInstructionOut;
		output reg MidiInterrupt;
		
		begin		
		BufEnB = BufEnB;
		BufEnA = BufEnA;
		MemEnA = 1'b1;
		MemWeA = 1'b1;
		
		MemWeB = MemWeB;
		MemEnB = MemEnB;
		MemOutEnB = MemOutEnB;
		BranchOffsetImm = BranchOffsetImm;
		BranchEn = BranchEn;
		JumpEn = JumpEn;
		MemReadEn = MemReadEn;
		ImmEn = ImmEn;
		Imm = Imm;
		Cin = Cin;
		AluResultEn = AluResultEn;
		ThisInstructionOut[15:0] = ThisInstructionIn[15:0];
		
		RegEn = RegEn;
		MemOutEnA =MemOutEnA ;
		AluOp = AluOp;//nop
		PcAddrEn = PcAddrEn;
		RegAddrEn = RegAddrEn;
		
		PCEn = 1'b0; //dont inc PC for inturrupt
		NextState = FETCH_STATE;
		
		MidiInterrupt = 1;
		end
	endtask
	
endmodule
