// Sabrina Pereira, Shy Russell, Jonah Spicher

/*-----------------------------------------------------------------------------
D-flip flop and D-flip-flop with enable
-----------------------------------------------------------------------------*/

module d_flip_flop
#(parameter width = 8)
(
output reg[width-1:0] q,
output wire[width-1:0] q_inv,
input [width-1:0]      d,
input                 clk
);
initial q=0;
    assign q_inv = ~q;
    always @(posedge clk) begin
        q <= d;
    end
endmodule


module d_flip_flop_enable
#(parameter width = 8)
(
output reg[width-1:0] q,
output wire[width-1:0] q_inv,
input[width-1:0]      d,
input                 wrenable,
input                 clk
);
    assign q_inv = ~q;
    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end
endmodule
