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

module signed_add_with_saturation
(
  input  [3:0] a, b,
  output [3:0] sum
);

  // Task:
  //
  // Implement a module that adds two signed numbers with saturation.
  //
  // "Adding with saturation" means:
  //
  // When the result does not fit into 4 bits,
  // and the arguments are positive,
  // the sum should be set to the maximum positive number.
  //
  // When the result does not fit into 4 bits,
  // and the arguments are negative,
  // the sum should be set to the minimum negative number.
  logic overflow;
  logic [3:0] tmp, carry;
  assign {carry[0], tmp[0]} = {(a[0] & b[0]), a[0] ^ b[0]};
  assign {carry[1], tmp[1]} = {(a[1] & b[1]) | (carry[0] & (a[1] ^ b[1])), a[1] ^ b[1] ^ carry[0]};
  assign {carry[2], tmp[2]} = {(a[2] & b[2]) | (carry[1] & (a[2] ^ b[2])), a[2] ^ b[2] ^ carry[1]};
  assign {carry[3], tmp[3]} = {(a[3] & b[3]) | (carry[2] & (a[3] ^ b[3])), a[3] ^ b[3] ^ carry[2]};
  assign overflow = (carry[3] ^ carry[2]);
  assign sum = overflow ? (a[3] ? 'b1000 : 'b0111) : tmp;

endmodule
