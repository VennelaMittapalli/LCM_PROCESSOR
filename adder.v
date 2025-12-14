module adder(input rst, input [1:0]cmd, input [7:0]x,y, output reg [7:0]xout,yout);
always @(*) begin
if(rst || cmd == 2'b00) begin
xout = 8'b00000000;
yout = 8'b00000000;
end
else if(cmd == 2'b10) begin
xout = x;
yout = (y+y);
end
else if(cmd == 2'b01) begin
xout =(x+x);
yout = y;
end
else begin
xout = x;
yout = y;
end
end
endmodule
