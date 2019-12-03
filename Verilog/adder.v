// What it needs to do: Be able to add a
// square wave and other kind of wave and normalize them
`define AND and
`define AND3 and
`define OR or
`define NOT not
`define XOR xor

module FullAdder1bit
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin,
    input sub
);
  wire AxorB, AandB, AxorBandC, xorB; // Performing the various gate operations on the inputs
  `XOR (xorB, b, sub);
  `XOR xorgate0(AxorB,a,xorB);
  `XOR xorgate1(sum,AxorB,carryin);
  `AND andgate0(AandB,a,xorB);
  `AND andgate1(AxorBandC,AxorB,carryin);
  `OR orgate0(carryout,AxorBandC,AandB);
endmodule

module FullAdder8bit
(
  output[7:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  input carryin,
  input[7:0] a,     // First operand in 2's complement format
  input[7:0] b,      // Second operand in 2's complement format
  input sub
);

  wire carryin1,carryin2,carryin3;

  FullAdder1bit adder0(sum[0], carryin1, a[0], b[0], carryin,sub);
  FullAdder1bit adder1(sum[1], carryin2, a[1], b[1], carryin1,sub);
  FullAdder1bit adder2(sum[2], carryin3, a[2], b[2], carryin2,sub);
  FullAdder1bit adder3(sum[3], carryin4, a[3], b[3], carryin3,sub);
  FullAdder1bit adder4(sum[4], carryin5, a[4], b[4], carryin4,sub);
  FullAdder1bit adder5(sum[5], carryin6, a[5], b[5], carryin5,sub);
  FullAdder1bit adder6(sum[6], carryin7, a[6], b[6], carryin6,sub);
  FullAdder1bit adder7(sum[7], carryin8, a[7], b[7], carryin7,sub);

endmodule
