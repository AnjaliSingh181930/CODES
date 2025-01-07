module testbench;

    // Inputs to the generate_mux
    reg [15:0] data;   // 16-bit input
    reg [3:0] select;  // 4-bit select signal
    
    // Outputs from the generate_mux
    wire out;          // Single-bit output
    wire [3:0] f;      // 4-bit output

    // Instantiate the generate_mux module
    generate_mux dut (
        .data(data),
        .select(select),
        .out(out),
        .f(f)
    );

    // Initial block for testing the module
    initial begin
        // Display the test results in the console
        $monitor($time, " select=%b, data=%h, out=%b, f=%h", select, data, out, f);

        // Initialize the waveform dump for GTKWave
        $dumpfile("mux.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        // Apply test vectors to check different conditions
        #5  data = 16'hA3F1; select = 4'b0000;  // Test select line 0000
        #5  select = 4'b0001;  // Test select line 0001
        #5  select = 4'b0010;  // Test select line 0010
        #5  select = 4'b0100;  // Test select line 0100
        #5  select = 4'b1000;  // Test select line 1000
        #5  select = 4'b1111;  // Test select line 1111

        // Test the conditional part (f)
        #5  data = 16'hA3F1; select = 4'b1001; // Select in[3:0] -> f should be 4'b1111
        #5  select = 4'b0001; // Select in[12:15] -> f should be 4'bA3

        // Finish the simulation after the tests
        #5  $finish;
    end

endmodule
