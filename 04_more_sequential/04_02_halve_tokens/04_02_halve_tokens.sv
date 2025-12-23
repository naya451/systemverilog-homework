//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module halve_tokens
(
    input  clk,
    input  rst,
    input  a,
    output b
);
    // Task:
    // Implement a serial module that reduces amount of incoming '1' tokens by half.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 110_011_101_000_1111
    // b -> 010_001_001_000_0101

    logic c;
    logic res;
    assign b = res;

    always_ff @ (posedge clk)
    if (rst)
    begin
        res <= '0;
        c <= '0;
    end
    else
        if (a == '0)
        begin
            res <= '0;
        end
        else 
        if (c == 0)
        begin
            c <= '1;
            res <= '0;
        end
        else
        begin
            c <= '0;
            res <= '1;
        end


endmodule
