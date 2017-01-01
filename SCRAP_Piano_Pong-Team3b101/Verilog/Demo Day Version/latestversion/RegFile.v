`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:41 09/10/2015 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
input clk,
input clr, 
//input write,
input [15:0] RegEn,
input [15:0] DataIn, 
output [15:0] DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6,
 DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, 
 DataOut14, DataOut15);
	 
				Register16Bit R0(DataIn, RegEn[0], clr, clk, DataOut0);
				Register16Bit R1(DataIn, RegEn[1], clr, clk, DataOut1);
				Register16Bit R2(DataIn, RegEn[2], clr, clk, DataOut2);
				Register16Bit R3(DataIn, RegEn[3], clr, clk, DataOut3);
				Register16Bit R4(DataIn, RegEn[4], clr, clk, DataOut4);
				Register16Bit R5(DataIn, RegEn[5], clr, clk, DataOut5);
				Register16Bit R6(DataIn, RegEn[6], clr, clk, DataOut6);
				Register16Bit R7(DataIn, RegEn[7], clr, clk, DataOut7);
				Register16Bit R8(DataIn, RegEn[8], clr, clk, DataOut8);
				Register16Bit R9(DataIn, RegEn[9], clr, clk, DataOut9);
				Register16Bit R10(DataIn, RegEn[10], clr, clk, DataOut10);
				Register16Bit R11(DataIn, RegEn[11], clr, clk, DataOut11);
				Register16Bit R12(DataIn, RegEn[12], clr, clk, DataOut12);
				Register16Bit R13(DataIn, RegEn[13], clr, clk, DataOut13);
				Register16Bit R14(DataIn, RegEn[14], clr, clk, DataOut14);
				Register16Bit R15(DataIn, RegEn[15], clr, clk, DataOut15);


endmodule
