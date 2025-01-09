module testbench;

    // Declare signals to connect to the DUT (Design Under Test)
    reg [7:0] a, b;   // 8-bit inputs a and b
    reg carry_in;     // Carry input
    wire [7:0] sum;   // 8-bit sum output
    wire carry_out;   // Carry output

    // Instantiate the rca (Ripple Carry Adder) module
    rca #(8) uut (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    // Stimulus process
    initial begin
        // Initialize signals
        a = 8'b00000000;
        b = 8'b00000000;
        carry_in = 0;

        // Apply test cases
        #10 a = 8'b10101010; b = 8'b01010101; carry_in = 0;  // Test case 1: Simple addition
        #10 a = 8'b11111111; b = 8'b00000001; carry_in = 0;  // Test case 2: Adding with carry
        #10 a = 8'b11110000; b = 8'b00001111; carry_in = 0;  // Test case 3: Another simple case
        #10 a = 8'b00000000; b = 8'b00000000; carry_in = 1;  // Test case 4: Addition with carry_in = 1
        #10 a = 8'b11111111; b = 8'b11111111; carry_in = 1;  // Test case 5: Large numbers with carry_in

        // End simulation
        #10 $finish;
    end

    // Monitor the outputs
    initial begin

        // Initialize the waveform dump for GTKWave
        $dumpfile("adder.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        $monitor("At time %t: a = %b, b = %b, carry_in = %b, sum = %b, carry_out = %b", $time, a, b, carry_in, sum, carry_out);
    end

endmodule
