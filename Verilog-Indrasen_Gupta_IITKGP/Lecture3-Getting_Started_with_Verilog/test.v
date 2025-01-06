module testbench;

    reg A, B, C, D, E, F; //left side variable ,i.e., input are declared as reg
    wire Y;

    ckt DUT(A, B, C, D, E, F , Y);

    initial 
        begin
            //monitor is something like printf
            $monitor ($time, "A = %b, B = %b, C = %b, D = %b, E = %b, F = %b, Y = %b", A, B, C, D, E, F, Y);
            //work with gtk wave
            $dumpfile ("ckt.vcd");   //vcd means value change dump
            $dumpvars (0, testbench);
            #5 A =1; B= 0; C = 0; D = 1; E =0; F =0;
            #5 A =0; B= 0; C = 1; D = 1; E =0; F =0;
            #5 A =1; C =0;
            #5 F =1;
            #5 $finish;
        end
endmodule

// Result
// [2024-11-30 16:21:00 UTC] iverilog '-Wall' '-g2012' design.sv testbench.sv  && unbuffer vvp a.out  
//                    0 A = x, B = x, C = x, D = x, E = x, F = x, Y = x
//                    5 A = 1, B = 0, C = 0, D = 1, E = 0, F = 0, Y = x
//                    8 A = 1, B = 0, C = 0, D = 1, E = 0, F = 0, Y = 1
//                   10 A = 0, B = 0, C = 1, D = 1, E = 0, F = 0, Y = 1
//                   13 A = 0, B = 0, C = 1, D = 1, E = 0, F = 0, Y = 0
//                   15 A = 1, B = 0, C = 0, D = 1, E = 0, F = 0, Y = 0
//                   18 A = 1, B = 0, C = 0, D = 1, E = 0, F = 0, Y = 1
//                   20 A = 1, B = 0, C = 0, D = 1, E = 0, F = 1, Y = 1
// testbench.sv:15: $finish called at 25 (1s)
