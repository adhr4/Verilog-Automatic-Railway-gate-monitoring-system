`timescale 1 ps / 1 ps

module design_1s_wrapper
   (LED1,
    LED2,
    SW1,
    clk_100MHz,
    reset);
  output LED1;
  output LED2;
  input SW1;
  input clk_100MHz;
  input reset;

  wire LED1;
  wire LED2;
  wire SW1;
  wire clk_100MHz;
  wire reset;

  design_1s design_1s_i
       (.LED1(LED1),
        .LED2(LED2),
        .SW1(SW1),
        .clk_100MHz(clk_100MHz),
        .reset(reset));
endmodule
