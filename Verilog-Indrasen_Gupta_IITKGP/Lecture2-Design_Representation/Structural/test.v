module testbench;

    // Declare 4-bit inputs and output
    reg [3:0] A, B; // 4-bit inputs
    reg C;           // Carry-in
    wire [3:0] S;    // 4-bit sum output
    wire Cy;         // Carry-out output

    // Instantiate the 4-bit adder
    four_bit_adder DUT(A, B, C, S, Cy);

    initial begin
        // Initialize the waveform dump for GTKWave
        $dumpfile("4-bit_adder.vcd"); //vcd means value change dump
        $dumpvars(0, testbench);

        // Monitor the values of inputs and outputs
        $monitor($time, " A = %b, B = %b, C = %b, S = %b, Cy = %b", A, B, C, S, Cy);

        // Apply test cases
        #5 A = 4'b0000; B = 4'b0000; C = 0; #5; // Test case 1
        #5 A = 4'b0001; B = 4'b0011; C = 0; #5; // Test case 2
        #5 A = 4'b1111; B = 4'b1111; C = 0; #5; // Test case 3
        #5 A = 4'b1010; B = 4'b0101; C = 0; #5; // Test case 4
        #5 A = 4'b1111; B = 4'b0001; C = 1; #5; // Test case 5
        #5 A = 4'b1111; B = 4'b1111; C = 1; #5; // Test case 6
        #5 A = 4'b1011; B = 4'b1100; C = 1; #5; // Test case 7

        // Finish the simulation
        $finish;
    end
endmodule
