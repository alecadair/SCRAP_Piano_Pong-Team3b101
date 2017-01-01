`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:16 10/02/2013 
// Design Name: 
// Module Name:    memory 
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
// This is a template for a single-port memory. 
// You should modify this to design a dual-port memory
//////////////////////////////////////////////////////////////////////////////////
	
	module memory(clk, din, enA, weA, addrA, doutA, enB, weB,  addrB, doutB);
		parameter RAM_WIDTH = 16; //<ram_width>;
		parameter RAM_ADDR_BITSB = 10; //glyph library
		parameter RAM_ADDR_BITSA = 14; //program space
 
	// Notice that the address bits = 10 implies 1024 words, which can be included in
	// one block. If this is increased to 11, the tool will map it to 2 BRAMs. 
	// View Tech Schematic.
	// RAM_ADDR_BITS = 15 will address 32 blocks of RAM. If this is extended to 16, then
	// the tool will also start synthesizing distributed RAM, and that will just be infeasible.
	 input clk;
	 input [RAM_WIDTH-1:0] din;
	 
	 // Port A
	 input enA, weA;
	 input [RAM_ADDR_BITSA-1:0] addrA;
	 output reg [RAM_WIDTH-1:0] doutA;
	 
	 input enB, weB;
	 input [RAM_ADDR_BITSB-1:0] addrB;
	 output reg [RAM_WIDTH-1:0] doutB;
	  

    reg [RAM_WIDTH-1:0] the_memory_core_A [(2**RAM_ADDR_BITSA)-1:0];
	 reg [RAM_WIDTH-1:0] the_memory_core_B [(2**RAM_ADDR_BITSB)-1:0];
//   reg [RAM_WIDTH-1:0] <output_data>;
//
//   <reg_or_wire> [RAM_ADDR_BITS-1:0] <address>;
//   <reg_or_wire> [RAM_WIDTH-1:0] <input_data>;

   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
//   initial
//      $readmemh("<data_file_name>", <rom_name>, <begin_address>, <end_address>);
	initial begin
		$readmemb("simpletestbinary.txt", the_memory_core_A, 0, 1023);
		$readmemb("GlyphFileSerial.txt", the_memory_core_B, 0, 1023);
	end
		
   always @(posedge clk) begin
      if (enA == 1'b1) begin
         if (weA == 1'b1) begin
            the_memory_core_A[addrA] <= din;
				doutA <= the_memory_core_A[addrA];
         end
			else
			doutA <= the_memory_core_A[addrA];
		end
		
	end
	
	always @(posedge clk) begin
	if (enB == 1'b1) begin
		if (weB == 1'b1) begin
			the_memory_core_B[addrB] <= din;
			doutB <= the_memory_core_B[addrB];
		end
		else
		doutB <= the_memory_core_B[addrB];
	end
		
	end
	
				

endmodule
