![LHE_BANNER](LHE_BANNER.png)
***
###DE0_Drivers
***
**Drivers for Altera DE0 Development Board.** 

This repository holds Verilog drivers for the various peripherals on the [Altera DE0 Development Board by terasIC](http://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&No=364). 

So far the following peripherals have code for them. Each directory has a different project file for Quartus II V13.0. 
Each one contains a test routine as the top level Verilog file. 

| Directory | Description |
|---|---|
| DE0_7_Segment | Drives the 4 7-Segment LED Displays | 
| DE0_SDRAM | Loads values into SDRAM and reads it back |
| DE0_VGA | VGA Display at 1280x1024 @ 60Hz. |
| DE0_PS2 | PS/2 Keyboard Driver. COMING SOON. |
| DE0_SDCARD | SD Card Driver. COMING SOON. | 

See [here for more information](http://longhornengineer.com/category/projects/software/verilog/de0-vga-driver/).

***
**License Information**

This project is under the [Creative Commons Attribution-ShareAlike 4.0 International License](LICENSE.md). These files are provided with no warranty and should be used at your own risk. 

***