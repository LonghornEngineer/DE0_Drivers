module DE0_7_Segment_Test
(
	clk_50, HEX0, HEX1, HEX2, HEX3
);
	
input		wire				clk_50;	
	
output	reg	[7:0]		HEX0;
output	reg	[7:0]		HEX1;
output	reg	[7:0]		HEX2;
output	reg	[7:0]		HEX3;

			reg	[31:0]	counter;	
			reg	[15:0]	number;
	
initial
	begin
		number <= 4'h0000;
		counter <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	end
	
always @(posedge clk_50)
	begin
		counter <= counter + 1'b1;
		
		if(counter[23])
		begin
			counter <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
			number <= number + 1'b1;
		end
	end
	
		
	
	DE0_7_Segment segment_driver
	(
		.clk_50(clk_50), 
		.value(number), 
		.HEX0(HEX0), 
		.HEX1(HEX1), 
		.HEX2(HEX2), 
		.HEX3(HEX3)
	
	);
	
endmodule