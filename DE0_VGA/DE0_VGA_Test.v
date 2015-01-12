module DE0_VGA_Test 
(
	 clk_50, INPUT_SWS, INPUT_BTN, VGA_BUS_R, VGA_BUS_G, VGA_BUS_B, VGA_HS, VGA_VS
);

input		wire				clk_50;

input		wire	[9:0]		INPUT_SWS;
input		wire	[2:0]		INPUT_BTN;

output	reg	[3:0]		VGA_BUS_R;
output	reg	[3:0]		VGA_BUS_G;
output	reg	[3:0]		VGA_BUS_B;

output	reg	[0:0]		VGA_HS;
output	reg	[0:0]		VGA_VS;

			reg	[10:0]	X_pix;
			reg	[10:0]	Y_pix;
			
			reg	[0:0]		H_visible;
			reg	[0:0]		V_visible;
			
			wire	[0:0]		pixel_clk;
			reg	[9:0]		pixel_cnt;
			
			reg	[11:0]	pixel_color;
			
			
			
initial
	begin
		pixel_color <= 12'b0000_0000_0000;
		
	end
	
	
always @(posedge pixel_clk)
	begin
		case (INPUT_BTN)
		3'b111:
			begin
				if(!V_visible)
				begin
					pixel_color <= 12'b1111_1111_1111;
				end
			end
		3'b110:
			begin
				if(!V_visible)
				begin
					pixel_color[11:10] <= 2'b00;
					pixel_color[9:0] <= INPUT_SWS;
				end
			end
		3'b101:
			begin
				if(!H_visible)
				begin
					case (Y_pix)
					1:
						begin
							pixel_color <= 12'b1111_1111_1111;
						end
					205:
						begin
							pixel_color <= 12'b0000_0000_0000;
						end
					410:
						begin
							pixel_color <= 12'b0000_0000_1111;
						end
					615:
						begin
							pixel_color <= 12'b0000_1111_0000;
						end
					820:
						begin
							pixel_color <= 12'b1111_0000_0000;
						end
					default:
						begin
							pixel_color <= pixel_color;
						end			
					endcase
				end
			end
		3'b011:
			begin
				case (X_pix)
				1:
					begin
						pixel_color <= 12'b1111_1111_1111;
					end
				256:
					begin
						pixel_color <= 12'b0000_0000_0000;
					end
				512:
					begin
						pixel_color <= 12'b0000_0000_1111;
					end
				768:
					begin
						pixel_color <= 12'b0000_1111_0000;
					end
				1024:
					begin
						pixel_color <= 12'b1111_0000_0000;
					end
				default:
					begin
						pixel_color <= pixel_color;
					end			
				endcase
			end
		default:
			begin
				pixel_color <= pixel_color;
			end
		endcase
	end
						
			
		DE0_VGA VGA_Driver
		(
			.clk_50(clk_50),
			.pixel_color(pixel_color),
			.VGA_BUS_R(VGA_BUS_R), 
			.VGA_BUS_G(VGA_BUS_G), 
			.VGA_BUS_B(VGA_BUS_B), 
			.VGA_HS(VGA_HS), 
			.VGA_VS(VGA_VS), 
			.X_pix(X_pix), 
			.Y_pix(Y_pix), 
			.H_visible(H_visible),
			.V_visible(V_visible), 
			.pixel_clk(pixel_clk),
			.pixel_cnt(pixel_cnt)
		);
		
endmodule