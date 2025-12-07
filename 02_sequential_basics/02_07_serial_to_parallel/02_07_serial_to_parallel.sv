//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_to_parallel
# (
    parameter width = 8
)
(
    input                      clk,
    input                      rst,

    input                      serial_valid,
    input                      serial_data,

    output logic               parallel_valid,
    output logic [width - 1:0] parallel_data
);
    // Task:
    // Implement a module that converts single-bit serial data to the multi-bit parallel value.
    //
    // The module should accept one-bit values with valid interface in a serial manner.
    // After accumulating 'width' bits and receiving last 'serial_valid' input,
    // the module should assert the 'parallel_valid' at the same clock cycle
    // and output 'parallel_data' value.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.

    logic [width - 1:0]arr;
    assign parallel_data = parallel_valid ? arr : '0;
    always_ff @ (posedge clk)
    if (rst)
    begin
      prev = 2'b00;
      res  = 2'b00;
    end
    else if (width)
    begin
        res = (~prev) ;
        prev = (requests == 2'b11) ? res : 2'b01;
    end
    else 
    begin
        parallel_valid <= 1;
    end


endmodule
