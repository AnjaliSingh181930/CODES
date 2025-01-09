module testbench;

    // Declare signals to connect to the DUT (Design Under Test)
    reg clk, init;
    wire [7:0] count;

    // Instantiate the ring_counter module (DUT)
    ring_counter uut (
        .clk(clk),
        .init(init),
        .count(count)
    );

    // Clock generation
    always #2 clk = ~clk;  // Toggle clk every 5 time units

    // Stimulus process (test vectors)
    initial begin
        // Initialize signals
        clk = 0;
        init = 0;

        // Apply stimulus
        #10 init = 1;        // Apply reset (initialization) at time 10
        #10 init = 0;        // Deactivate reset at time 20
        #100;                // Let the counter run for 100 time units
        #50 $finish;         // End simulation after 150 time units
    end

    // Monitor the output of count
    initial begin
        // Initialize the waveform dump for GTKWave
        $dumpfile("counter.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        $monitor("At time %t: count = %b", $time, count);
    end

endmodule
