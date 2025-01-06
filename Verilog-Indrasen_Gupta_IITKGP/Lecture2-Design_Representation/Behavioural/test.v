module testbench;

    reg A, B, C; //left side variable (inputs) are declared as reg
    wire S, Cy; // right side variables (outputs) are declared as wire


    full_adder DUT(A, B, C, S, Cy);

    initial 
        begin
            //monitor is something like printf
            $monitor ($time, " A = %b, B = %b, C = %b, S = %b, Cy = %b ", A, B, C, S, Cy);
            //work with gtk wave
            // $dumpfile ("full_adder.vcd");
            // $dumpvars (0, testbench);
            #5 A =1; B= 0; C = 1;
            #5 A =0; B= 0; C = 0;
            #5 A =1; B= 1; C = 1;
            #5 A =1; B= 0; C = 0;
            #5 A =1;
            #5 $finish;
        end
endmodule