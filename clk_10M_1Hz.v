module clk_10M_1Hz(input clk_10MHz, reset, output reg clk_1Hz);
reg [23:0]count = 24'd0;
//reg clk_1Hz = 1'b0;
always @(posedge clk_10MHz or posedge reset)
begin
if (reset)
begin count <= 24'd0;
clk_1Hz <= 1'b0;
end
else if (count == 24'd5000000)
begin
count <= 24'd0;
clk_1Hz <= ~clk_1Hz;
end
else
count <= count+1;
end
endmodule
