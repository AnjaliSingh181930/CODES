`timescale 10ns/1ns

module testbench;
    reg [15:0] X, Y;  // 16-bit inputs for addition
    wire [15:0] Z;    // 16-bit output for sum
    wire carry;       // Carry-out of the addition
    wire sign;        // Sign bit (MSB of result)
    wire parity;      // Parity of the result
    wire zero;        // Zero flag (if result is zero)
    wire overflow;    // Overflow flag

    // Instantiate the add module
    add DUT(
        .X(X),
        .Y(Y),
        .Z(Z),
        .sign(sign),
        .carry(carry),
        .parity(parity),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin
        // Monitor the signals during simulation
        $monitor($time, " X = %h, Y = %h, Z = %h, carry = %b, sign = %b, parity = %b, zero = %b, overflow = %b", 
                 X, Y, Z, carry, sign, parity, zero, overflow);

        // Initialize the waveform dump for GTKWave
        $dumpfile("add.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);
        
        // Test case 1: Simple addition without overflow
        #5 X = 16'h1; Y = 16'h2;
        
        // Test case 2: Addition with carry
        #5 X = 16'hffff; Y = 16'h0001;

        // Test case 3: Overflow case (positive overflow)
        #5 X = 16'h7fff; Y = 16'h0001;

        // Test case 4: Overflow case (negative overflow)
        #5 X = 16'h8000; Y = 16'hffff;

        // Test case 5: Zero result
        #5 X = 16'h0000; Y = 16'h0000;

        // Test case 6: Random values
        #5 X = 16'h3f3f; Y = 16'hc0c0;

        // Test case 7: Parity check
        #5 X = 16'h5555; Y = 16'haaaa;

        // Finish the simulation after all tests
        #5 $finish;
    end
endmodule
