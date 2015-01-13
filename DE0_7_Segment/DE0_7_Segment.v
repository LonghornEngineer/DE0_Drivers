//	DE0_7_Segment.v
//	Author: Parker Dillmann
//	Website: http://www.longhornengineer.com
// Github: https://github.com/LonghornEngineer

module DE0_7_Segment
(
	 clk_50, value, HEX0, HEX1, HEX2, HEX3
);

input		wire				clk_50;
input		wire	[15:0]	value;

output	reg	[7:0]		HEX0;
output	reg	[7:0]		HEX1;
output	reg	[7:0]		HEX2;
output	reg	[7:0]		HEX3;

			reg	[15:0]	out_value;
			
			reg	[15:0][7:0]	Seg_Mapping;
			
			

initial
	begin
		//High value is off for the LEDs
		HEX0 <= 2'hFF;
		HEX1 <= 2'hFF;
		HEX2 <= 2'hFF;
		HEX3 <= 2'hFF;
		
		out_value <= 4'h0000;
		
		//Mapping to display Hex
		Seg_Mapping[00] <= 8'b1100_0000;
		Seg_Mapping[01] <= 8'b1111_1001;
		Seg_Mapping[02] <= 8'b1010_0100;
		Seg_Mapping[03] <= 8'b1011_0000;
		Seg_Mapping[04] <= 8'b1001_1001;
		Seg_Mapping[05] <= 8'b1001_0010;
		Seg_Mapping[06] <= 8'b1000_0010;
		Seg_Mapping[07] <= 8'b1111_1000;
		Seg_Mapping[08] <= 8'b1000_0000;
		Seg_Mapping[09] <= 8'b1001_1000;
		Seg_Mapping[10] <= 8'b1000_1000;
		Seg_Mapping[11] <= 8'b1000_0011;
		Seg_Mapping[12] <= 8'b1100_0110;
		Seg_Mapping[13] <= 8'b1010_0001;
		Seg_Mapping[14] <= 8'b1000_0110;
		Seg_Mapping[15] <= 8'b1000_1110;
		
	end
	
always @(posedge clk_50)
	begin
		//Check if we have to change value. Prevents flickering.
		if(out_value != value)
			begin
				out_value <= value;
				
				HEX0 <= Seg_Mapping[out_value[3:0]];
				HEX1 <= Seg_Mapping[out_value[7:4]];
				HEX2 <= Seg_Mapping[out_value[11:8]];
				HEX3 <= Seg_Mapping[out_value[15:12]];
				
			end
		else
			begin
				out_value <= out_value;
				
				HEX0 <= HEX0;
				HEX1 <= HEX1;
				HEX2 <= HEX2;
				HEX3 <= HEX3;
				
			end
	end

endmodule
		