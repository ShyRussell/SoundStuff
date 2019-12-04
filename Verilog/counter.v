
module counter
(
    output reg[7:0] count,
    input  clk,   // System clock
    input  reset  // Control for the output frequency

);


initial count =0;

always @(posedge clk) begin 
  count <= count + 1;
end

always @(*) begin
if (reset==1) begin
   count <= 8'b0 ;
end
end

endmodule
