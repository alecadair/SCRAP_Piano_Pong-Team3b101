module seven_seg
(
	clk,		// assuming 10MHz clock
	reset,		// asynchronous reset
	data,		// 16-bit data to display
	digit,		// bits 0-6 = A-G, bit 7 = dot
	segm_sel	// bit 3 = AN0, bit 0 = AN3
);

input			clk;
input			reset;
input	[15:0]	data;
output	[7:0]	digit;
output	[3:0]	segm_sel;

reg		[15:0]	clk_div;		// for 10MHz -> ~0,6kHz clock divider
reg		[3:0]	data_chunk;		// 4-bit portion of 16-bit data
reg		[7:0]	digit;
reg		[3:0]	segm_sel;
reg				r1;				// for pusle generator
reg				r2;				// for pusle generator
reg				clk_div_pulse;	// 1 clock long pusle from clk_div

always @ (posedge clk or posedge reset)
	begin
		if (reset)
			clk_div <= 0;
		else
			clk_div <= clk_div + 1'b1;
	end
//

always @ (posedge clk or posedge reset)
	begin
		if (reset)
			segm_sel <= 4'b1110;
		else
			begin
				if (clk_div_pulse)
					begin
						if (segm_sel == 4'b0111)
							segm_sel <= 4'b1110;
						else if (segm_sel == 4'b1110)
							segm_sel <= 4'b1101;
						else if (segm_sel == 4'b1101)
							segm_sel <= 4'b1011;
						else if (segm_sel == 4'b1011)
							segm_sel <= 4'b0111;
					end
			end
	end
//


// generate pusle from clk_div
always @ (posedge clk or posedge reset)
	begin
		if (reset)
			begin
				r1 <= 0;
				r2 <= 0;
				clk_div_pulse <= 0;
			end
		else
			begin
				r1 <= clk_div[15];
				r2 <= r1;
				clk_div_pulse <= r1 & ~r2;
			end
	end
//

always @ (segm_sel,data)
	begin
		case (segm_sel)
			4'b1110:	data_chunk = data[3:0];
			4'b1101:	data_chunk = data[7:4];
			4'b1011:	data_chunk = data[11:8];
			4'b0111:	data_chunk = data[15:12];
			default:	data_chunk = data[3:0];
		endcase
	end
//

always @ (data_chunk)
	begin
		case (data_chunk)
			//            abc defg dt
			0:	digit = 8'b000_0001_1;
			1:	digit = 8'b100_1111_1;
			2:	digit = 8'b001_0010_1;
			3:	digit = 8'b000_0110_1;
			4:	digit = 8'b100_1100_1;
			5:	digit = 8'b010_0100_1;
			6:	digit = 8'b010_0000_1;
			7:	digit = 8'b000_1111_1;
			8:	digit = 8'b000_0000_1;
			9:	digit = 8'b000_0100_1;
			
			10:	digit = 8'b000_1000_1;	//a
			11:	digit = 8'b110_0000_1;	//b
			12:	digit = 8'b011_0001_1;	//c
			13:	digit = 8'b100_0010_1;	//d
			
			14:	digit = 8'b011_0000_1;	//e
			15:	digit = 8'b011_1000_1;	//f
		endcase
	end
//

endmodule
