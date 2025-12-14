module multiplexer(rst,sLine,load,result,out);
input rst,sLine;
input [7:0]load,result;
output reg [7:0]out;

always @(*) begin
if(rst) out = 8'd0;
else if(!sLine) out = load;
else out = result;
end

endmodule
