//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module add
(
  input  [3:0] a, b,
  output [3:0] sum
);

  assign sum = a + b;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module signed_add_with_overflow
(
  input  [3:0] a, b,
  output [3:0] sum,
  output       overflow
);

  // Task:
  //
  // Implement a module that adds two signed numbers
  // and detects an overflow.
  //
  // By "signed" we mean "two's complement numbers".
  // See https://en.wikipedia.org/wiki/Two%27s_complement for details.
  //
  // The 'overflow' output bit should be set to 1
  // when the resulting sum (either positive or negative)
  // of two input arguments is greater or less than
  // 4-bit maximum or minimum signed number.
  //
  // Otherwise the 'overflow' should be set to 0.
  logic carry[3:0];
  assign {carry[0], sum[0]} = {(a[0] & b[0]), a[0] ^ b[0]};
  assign {carry[1], sum[1]} = {(a[1] & b[1]) | (carry[0] & (a[1] ^ b[1])), a[1] ^ b[1] ^ carry[0]};
  assign {carry[2], sum[2]} = {(a[2] & b[2]) | (carry[1] & (a[2] ^ b[2])), a[2] ^ b[2] ^ carry[1]};
  assign {carry[3], sum[3]} = {(a[3] & b[3]) | (carry[2] & (a[3] ^ b[3])), a[3] ^ b[3] ^ carry[2]};
  assign overflow = (carry[3] ^ carry[2]);

endmodule
