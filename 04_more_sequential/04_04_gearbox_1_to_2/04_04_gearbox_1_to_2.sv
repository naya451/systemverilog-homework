//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module gearbox_1_to_2
# (
    parameter width = 0
)
(
    input                    clk,
    input                    rst,

    input                    up_vld,    // upstream
    input  [    width - 1:0] up_data,

    output                   down_vld,  // downstream
    output [2 * width - 1:0] down_data
);
    // Task:
    // Implement a module that transforms a stream of data
    // from 'width' to the 2*'width' data width.
    //
    // The module should be capable to accept new data at each
    // clock cycle and produce concatenated 'down_data'
    // at each second clock cycle.
    //
    // The module should work properly with reset 'rst'
    // and valid 'vld' signals


    bit give, start, up;
    logic [2 * width - 1:0] res;
    assign down_data = res;
    assign down_vld = ~give && start && up;

    always_ff @ (posedge clk)
    if (rst)
    begin
        res <= '0;
        give <= 'b0;
        start <= 'b0;
    end
    else
    begin
        if (up_vld)
        begin
            res <= {res[width - 1:0], up_data};
            give <= give ^ 1'b1;
            start <= 'b1;
            up <= '1;
        end
        else 
        begin
            up <= '0;
        end
    end

endmodule
