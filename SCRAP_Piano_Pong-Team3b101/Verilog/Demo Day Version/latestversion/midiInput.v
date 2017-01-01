`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:33 10/19/2015 
// Design Name: 
// Module Name:    midiInput 
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
module midiInput(
	input clk,
	input midiIn,
	output rx,
	output reg [0:15] midiNoteOut = 0,
	output reg noteForMem = 0,
	input resetNoteForMem
	);
	 
	reg dataIncomingStatus = 0;
	reg [29:0] incomingBitBuffer = 0;
	reg [31:0] midiClockCounter = 0;
	reg [5:0] bitCount = 0;
	reg noteComplete = 0;

	assign rx = ~midiIn;
	

	//Set status for data incoming
	always @(posedge clk) begin
		//controller says note is in memory, reset flag
		if (midiIn == 0 && bitCount == 0)
			dataIncomingStatus <= 1;
		
		if (dataIncomingStatus) begin
			midiClockCounter <= midiClockCounter + 1;
			if ((bitCount == 0) && (midiClockCounter == 32'd200)) begin
				incomingBitBuffer[0] <= midiIn;
				bitCount <= bitCount;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 0) && (midiClockCounter == 32'd201)) begin
				incomingBitBuffer <= incomingBitBuffer;
				bitCount <= 5'd1;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 1) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[1] <= midiIn;
				bitCount <= 5'd2;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 2) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[2] <= midiIn;
				bitCount <= 5'd3;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 3) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[3] <= midiIn;
				bitCount <= 5'd4;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 4) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[4] <= midiIn;
				bitCount <= 5'd5;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 5) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[5] <= midiIn;
				bitCount <= 5'd6;
				midiClockCounter <= 0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 6) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[6] <= midiIn;
				bitCount <= 5'd7;
				midiClockCounter <=1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 7) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[7] <= midiIn;
				bitCount <= 5'd8;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 8) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[8] <= midiIn;
				bitCount <= 5'd9;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 9) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[9] <= midiIn;
				bitCount <= 5'd10;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 10) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[10] <= midiIn;
				bitCount <= 5'd11;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 11) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[11] <= midiIn;
				bitCount <= 5'd12;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 12) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[12] <= midiIn;
				bitCount <= 5'd13;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 13) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[13] <= midiIn;
				bitCount <= 5'd14;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 14) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[14] <= midiIn;
				bitCount <= 5'd15;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 15) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[15] <= midiIn;
				bitCount <= 5'd16;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 16) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[16] <= midiIn;
				bitCount <= 5'd17;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 17) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[17] <= midiIn;
				bitCount <= 5'd18;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 18) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[18] <= midiIn;
				bitCount <= 5'd19;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 19) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[19] <= midiIn;
				bitCount <= 5'd20;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 20) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[20] <= midiIn;
				bitCount <= 5'd21;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 21) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[21] <= midiIn;
				bitCount <= 5'd22;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 22) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[22] <= midiIn;
				bitCount <= 5'd23;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 23) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[23] <= midiIn;
				bitCount <= 5'd24;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 24) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[24] <= midiIn;
				bitCount <= 5'd25;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 25) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[25] <= midiIn;
				bitCount <= 5'd26;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 26) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[26] <= midiIn;
				bitCount <= 5'd27;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 27) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[27] <= midiIn;
				bitCount <= 5'd28;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 28) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[28] <= midiIn;
				bitCount <= 5'd29;
				midiClockCounter <=0;
				dataIncomingStatus <= 1;
				noteForMem <= noteForMem;
			end
			else if ((bitCount == 29) && (midiClockCounter == 32'd3200)) begin
				incomingBitBuffer[29] <= midiIn;
				bitCount <= 5'd0;
				midiClockCounter <=0;
				dataIncomingStatus <= 0;
				noteForMem <= 1;
			end
		end
		if (resetNoteForMem) begin
			noteForMem <= 0;
		end
	end

	always @(negedge dataIncomingStatus) begin
		if(incomingBitBuffer [28:21] != 0)begin
			midiNoteOut <= {incomingBitBuffer[18:11],incomingBitBuffer[28:21]};
		end
		else begin
			midiNoteOut <= midiNoteOut;
		end
	end

endmodule
