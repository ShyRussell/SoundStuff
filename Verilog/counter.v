// Sabrina Pereira, Shy Russell, Jonah Spicher
/*-----------------------------------------------------------------------------
Counter module that counts by one every clock cycle.
When reset is high, counter starts over.
-----------------------------------------------------------------------------*/

module counter
#(parameter width = 8)
(
    output reg[width-1:0] count,
    input  clk,
    input  reset
);


initial count =0;

always @(posedge clk) begin
  count <= count + 1;
end

always @(*) begin
if (reset==1) begin
   count <= 0 ;
end
end

endmodule
