
module counter
#(parameter width = 8)
(
    output reg[width-1:0] count,
    input  clk,   // System clock
    input  reset  // Control for the output frequency

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
