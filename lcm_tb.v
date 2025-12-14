module lcm_tb();
reg clk = 1'b1;
reg rst,go_i;
reg [3:0]x_i;
reg [3:0]y_i;
wire [3:0]d_o;

always #5 clk=~clk;

lcm_top lcm1(rst,clk,go_i,x_i,y_i,d_o);

initial begin
rst=1'b1;
#10;
rst=1'b0;
#10;
go_i = 1'b1;
x_i=1; y_i=2;#200;
x_i=2;y_i=4;#200;
#10 $finish;
end
