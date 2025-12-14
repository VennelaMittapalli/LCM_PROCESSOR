module fsm(input rst,clk,proceed,[1:0]comparison, output reg enable,xsel,ysel,xld,yld);
parameter [2:0]init = 3'b000, s0 = 3'b001, s1 = 3'b010, s2 = 3'b011, s3 = 3'b100, s4 = 3'b101, s5 = 3'b110;
reg [2:0] nState, cState;

always @(posedge clk or posedge rst) begin
if(rst) cState <= init;
else cState <= nState;
end

always @(proceed or comparison or cState) begin
case(cState)
init: if(!proceed) nState <= init; else nState <= s0;
s0: begin enable <= 1'b0; xsel <= 1'b0; ysel <= 1'b0; xld <= 1'b0; yld <= 1'b0; nState <= s1; end
s1: begin enable <= 1'b0; xsel <= 1'b0; ysel <= 1'b0; xld <= 1'b1; yld <= 1'b1; nState <= s2; end
s2: begin xld <= 1'b0; yld <= 1'b0; if(comparison == 2'b10) nState <= s3; else if(comparison==2'b01) nState <= s4; else if(comparison==2'b11) nState <= s5; end
s3: begin enable <= 1'b0; xsel <= 1'b0; ysel <= 1'b1; xld <= 1'b0; yld <= 1'b1; nState <= s2;end
s4: begin enable <= 1'b0; xsel <= 1'b1; ysel <= 1'b0; xld <= 1'b1; yld <= 1'b0; nState <= s2;end
s5: begin enable <= 1'b1; xsel <= 1'b1; ysel <= 1'b1; xld <= 1'b1; yld <= 1'b1; nState <= s0;end
default: nState <= s0;
endcase
end    

endmodule
