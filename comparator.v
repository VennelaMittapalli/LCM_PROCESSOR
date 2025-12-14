module comparator(rst,x,y,out);
input rst;
input [7:0]x,y;
output reg [1:0]out;
always @(*) begin
if(rst) out = 2'b00;
else if(x>y) out = 2'b10;
else if(x<y) out = 2'b01;
else out = 2'b11;
end

endmodule
