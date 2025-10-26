//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 using three instances of mux_2_1

  wire [3:0] m0;
  wire [3:0] m1;

  mux_2_1 local_mux_1 (
    .d0(d0),
    .d1(d2),
    .sel(sel[1]),
    .y(m0)
  );

  mux_2_1 local_mux_2 (
    .d0(d1),
    .d1(d3),
    .sel(sel[1]),
    .y(m1)
  );

  mux_2_1 local_mux_3 (
    .d0(m0),
    .d1(m1),
    .sel(sel[0]),
    .y(y)
  );

endmodule
