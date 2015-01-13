//	DE0_VGA_Test.v
//	Author: Parker Dillmann
//	Website: http://www.longhornengineer.com
// Github: https://github.com/LonghornEngineer

module DE0_VGA_Test 
(
	 clk_50, INPUT_SWS, INPUT_BTN, VGA_BUS_R, VGA_BUS_G, VGA_BUS_B, VGA_HS, VGA_VS
);

input		wire				clk_50;

input		wire	[9:0]		INPUT_SWS;
input		wire	[2:0]		INPUT_BTN;

output	reg	[3:0]		VGA_BUS_R;		//Output Red
output	reg	[3:0]		VGA_BUS_G;		//Output Green
output	reg	[3:0]		VGA_BUS_B;		//Output Blue

output	reg	[0:0]		VGA_HS;			//Horizontal Sync
output	reg	[0:0]		VGA_VS;			//Vertical Sync

			reg	[10:0]	X_pix;			//Location in X of the driver
			reg	[10:0]	Y_pix;			//Location in Y of the driver
			
			reg	[0:0]		H_visible;		//H_blank?
			reg	[0:0]		V_visible;		//V_blank?
			
			wire	[0:0]		pixel_clk;		//Pixel clock. Every clock a pixel is being drawn. 
			reg	[9:0]		pixel_cnt;		//How many pixels have been output.
			
			reg	[11:0]	pixel_color;	//Input to driver. 
			
			
			
initial
	begin
		pixel_color <= 12'b0000_0000_0000;
		
	end
	
	
always @(posedge pixel_clk)
	begin
		case (INPUT_BTN)
		//White Screen
		3'b111:
			begin
				if(!V_visible)
				begin
					pixel_color <= 12'b1111_1111_1111;
				end
			end
		//Display the value of the input SW0 to SW9
		3'b110:
			begin
				if(!V_visible)
				begin
					pixel_color[11:10] <= 2'b00;
					pixel_color[9:0] <= INPUT_SWS;
				end
			end
		//Horizontal color pattern test.
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
		//Vertical color pattern test.
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