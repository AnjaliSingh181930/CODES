`timescale 10ns/1ns

module testbench;
    reg [3:0] X, Y;  // 4-bit inputs for addition
    reg Cin;         // Carry-in input
    wire [3:0] Z;    // 4-bit output for sum
    wire sign;       // Sign bit (MSB of result)
    wire carry;      // Carry-out of the addition
    wire parity;     // Parity of the result
    wire zero;       // Zero flag (if result is zero)
    wire overflow;   // Overflow flag

    // Instantiate the add module
    add DUT(
        .X(X),
        .Y(Y),
        .Cin(Cin),
        .Z(Z),
        .sign(sign),
        .carry(carry),
        .parity(parity),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin
        // Monitor the signals during simulation
        $monitor($time, " X = %b, Y = %b, Cin = %b, Z = %b, carry = %b, sign = %b, parity = %b, zero = %b, overflow = %b", 
                 X, Y, Cin, Z, carry, sign, parity, zero, overflow);

        // Initialize the waveform dump for GTKWave
        $dumpfile("add.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);
        
        // Test case 1: Simple addition with no carry
        #5 X = 4'b0010; Y = 4'b0011; Cin = 1'b0; // 2 + 3 = 5
        
        // Test case 2: Addition with carry-in
        #5 X = 4'b1111; Y = 4'b0001; Cin = 1'b0; // 15 + 1 = 16 (Carry out)
        
        // Test case 3: Overflow case (positive overflow)
        #5 X = 4'b0111; Y = 4'b0101; Cin = 1'b0; // 7 + 5 = 12 (No overflow)
        
        // Test case 4: Overflow case (negative overflow)
        #5 X = 4'b1000; Y = 4'b1111; Cin = 1'b0; // -8 + -1 = -9 (Overflow)
        
        // Test case 5: Zero result
        #5 X = 4'b0000; Y = 4'b0000; Cin = 1'b0; // 0 + 0 = 0
        
        // Test case 6: Check for parity
        #5 X = 4'b1010; Y = 4'b0101; Cin = 1'b0; // 10 + 5 = 15
        
        // Test case 7: Test for carry-in being 1
        #5 X = 4'b1100; Y = 4'b0011; Cin = 1'b1; // 12 + 3 + 1 (Cin) = 16 (Carry out)
        
        // Test case 8: Random case
        #5 X = 4'b1101; Y = 4'b0110; Cin = 1'b1; // 13 + 6 + 1 (Cin) = 20
        
        // Test case 9: Parity check with all 1's
        #5 X = 4'b1111; Y = 4'b1111; Cin = 1'b0; // 15 + 15 = 30 (Parity check)
        
        // Finish the simulation after all tests
        #5 $finish;
    end
endmodule
