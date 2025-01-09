module testbench;

    // Declare signals for the DUT (Design Under Test)
    reg [15:0] a, b;   // 16-bit input vectors a and b
    wire [15:0] f;     // 16-bit output wire f

    // Instantiate the xor_bitwise module (DUT)
    xor_bitwise #(16) uut (
        .a(a),
        .b(b),
        .f(f)
    );

    // Stimulus process
    initial begin
        // Initialize inputs
        a = 16'b0000000000000000;
        b = 16'b0000000000000000;

        $monitor("At time %t: a = %b, b = %b, f = %b", $time, a, b, f);

        // Initialize the waveform dump for GTKWave
        $dumpfile("bitwise_xor.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        // Apply test cases
        #10 a = 16'b1010101010101010; b = 16'b1100110011001100; // XOR of two patterns
        #10 a = 16'b1111111111111111; b = 16'b0000000000000000; // XOR with all 1's
        #10 a = 16'b1111000011110000; b = 16'b1010101010101010; // XOR with mixed bits
        #10 a = 16'b0000111100001111; b = 16'b1111000011110000; // Another mixed case
        #10 a = 16'b0000000000000000; b = 16'b1111111111111111; // XOR with all 0's and all 1's

        // End simulation
        #10 $finish;
    end

endmodule
