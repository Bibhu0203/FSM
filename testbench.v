`timescale 1ns / 1ps

module tb_seq1001;

reg clk;
reg rst;
reg x;
wire y;

// DUT
seq1001 uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial
begin
    rst = 1;
    x   = 0;

    #12;
    rst = 0;

    // Test sequence: 1001100100

    @(posedge clk) x = 1;
    @(posedge clk) x = 0;
    @(posedge clk) x = 0;
    @(posedge clk) x = 1;  // 1001 detected

    @(posedge clk) x = 1;
    @(posedge clk) x = 0;
    @(posedge clk) x = 0;
    @(posedge clk) x = 1;  // 1001 detected

    @(posedge clk) x = 0;
    @(posedge clk) x = 1;
    @(posedge clk) x = 1;
    @(posedge clk) x = 0;

    #20;
    $finish;
end

// Monitor signals
initial
begin
    $display("Time\tState\tX\tY");
    $monitor("%0t\t%b\t%b\t%b",
             $time, uut.state, x, y);
end

endmodule
