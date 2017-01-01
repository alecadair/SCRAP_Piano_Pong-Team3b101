`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:47 04/17/2015 
// Design Name: 
// Module Name:    Tri_Buf 
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
module Tri_Buf(
    input [15:0] In,
    input enable,
	 output [15:0] Out
     );

	assign Out = enable? In : 16'bzzzzzzzzzzzzzzzz;
	
endmodule
