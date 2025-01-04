`timescale 10ns/1ns
module test_bench;
    reg [15:0] inp ;
    reg [3:0] sele;
    wire outp;
    mux16to1 M(.inp(in), .sele(sel), .outp(out));

    initial
        begin
           $monitor($time, " Input: %h, Select Line: %h, Output: %b", inp, sele, outp) ;
           #5 inp = 16'h3f0a; sele = 16'h0;
           #5 sele = 4'h1;
           #5 sele = 4'h2;
           #5 $finish;
        end
endmodule