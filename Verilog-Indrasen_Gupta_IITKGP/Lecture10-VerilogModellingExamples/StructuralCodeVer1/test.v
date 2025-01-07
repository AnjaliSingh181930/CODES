module testbench;
    reg [15:0] inp;       // 16-bit input
    reg [3:0] sele;       // 4-bit select line
    wire outp;            // Output of mux16to1

    // Instantiate the mux16to1 module
    mux16to1 M(.in(inp), .sel(sele), .out(outp));

    initial begin

        // Initialize the waveform dump for GTKWave
        $dumpfile("mux16.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        // Monitor values
        $monitor($time, " Input: %h, Select Line: %h, Output: %b", inp, sele, outp);

        // Test cases
        #5  inp = 16'h3f0a; sele = 4'h0;  // Select inp[0] = 0
        #5  sele = 4'h1;                  // Select inp[1] = 1
        #5  sele = 4'h2;                  // Select inp[2] = 0
        #5  sele = 4'hF;                  // Select inp[15] = 0
        #5  $finish;                      // End simulation
    end
endmodule
