`timescale 10ns/1ns
module testbench;
    reg [15:0] inp ;
    reg [3:0] sele;
    wire outp;
    mux16to1 DUT(.in(inp), .sel(sele), .out(outp));

    initial
        begin

            // Initialize the waveform dump for GTKWave
            $dumpfile("mux.vcd"); //vcd means value change dump
            $dumpvars(0, testbench);

           $monitor($time, " Input: %h, Select Line: %h, Output: %b", inp, sele, outp) ;
           #5 inp = 16'h3f0a; sele = 16'h0;
           #5 sele = 4'h1;
           #5 sele = 4'h2;
           $monitor($time, " Finished Simulation" ) ;
           #5 $finish;
        end
endmodule