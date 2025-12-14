module register(input rst, input clk, input load, input [7:0]in, output reg [7:0]out);
always @(load or in or posedge clk or posedge rst) begin
if(rst) out <= 8'b00000000;
else if(load) out <= in;
end

endmodule
