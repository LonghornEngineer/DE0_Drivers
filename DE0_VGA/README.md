###DE0_VGA
***
**Driver for VGA on the DE0**

The DE0 has a VGA connector that is connected to a 12bit (4bit per color) resistor ladder DAC. Driver displays at 1280x1024 @ 60Hz.

Pressing no buttons will display a pure white screen.<br/>
Pressing BUTTON0 will push the combination of SW0 - SW9 into the display register. Flipping the toggle switches (SW0-SW9) will change the color in the this mode.<br/>
Pressing BUTTON1 shows a horizontal color pattern test.<br/>
Pressing BUTTON2 shows a vertical color pattern test.<br/>

DE0_VGA.v takes care of the driving the signals. The top level looks at the position of X_pix and Y_pix and figures out what to put on the pixel_color bus.

Quartus II V13.0 Project file: DE0_VGA.qpf

File Hierarchy 
- DE0_VGA_Test.v
  - DE0_VGA.v
    - PLL_PIXEL_CLK.v

