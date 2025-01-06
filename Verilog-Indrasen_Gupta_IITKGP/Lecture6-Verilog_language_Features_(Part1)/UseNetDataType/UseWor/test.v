module testbench;

    reg A, B, C, D; //left side variable (inputs) are declared as reg
    wire f; // right side variables (outputs) are declared as wire

    use_wor DUT(A, B, C, D, f);

    initial 
        begin
            //monitor is something like printf
            $monitor ($time, " A = %b, B = %b, C = %b, D = %b, f = %b ", A, B, C, D, f);
            // Initialize the waveform dump for GTKWave
            $dumpfile("use_wor.vcd"); //vcd means value change dump
            $dumpvars(0, testbench);
            #5 A =1; B= 0; C = 1; D = 0;
            #5 A =0; B= 0; C = 0; D = 1;
            #5 A =1; B= 1; C = 1; D = 0;
            #5 A =1; B= 0; C = 0; D = 1;
            
            #5 $finish;
        end
endmodule 