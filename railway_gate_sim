module railway_gate_sim(input clk, reset, SW1,
//input [4:0]SW2, 
output reg LED1,LED2);
reg [1:0] state;
reg distance=10;
//wire [3:0]count;
parameter Idle=2'b00, alert=2'b01,close_gate=2'b10;
reg [1:0]current_state,next_state;
//mod_delay_counter uut2(.clk(clk),.reset(reset),.count(count));
reg [3:0]count1,count2;

always@(*) begin
case(current_state)
Idle:begin
if (SW1==1) begin
next_state=alert;
end else begin
next_state=Idle;
end
end
alert:begin
if(count1>=4'd10)
next_state=close_gate;
else
next_state=alert;

end
close_gate:begin
if(count2>=4'd2) begin
if (SW1==1) 
next_state=alert;
else
next_state=Idle;
end else
next_state=close_gate;
end
default:next_state=Idle;
endcase
end
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= Idle;
    else
        current_state <= next_state;
end


always@(posedge clk or posedge reset) begin
if(reset)begin
count1<=0;
count2<=0;
end else if(current_state==alert) 
count1<=count1+1;
else if(current_state==close_gate)
count2<=count2+1;
else 
count1<=0;
count2<=0;
end
always@(*) begin
case(current_state) 
Idle: begin
LED1=0;
LED2=0;
end
alert: begin
LED1=1;
LED2=0;
end
close_gate: begin
LED1=0;
LED2=1;
end
default: begin
LED1=0;
LED2=0;
end
endcase
end
endmodule
