module testbench;
    reg x, y;
    wire f;

    simpleand DUT(x, y, f);

    initial 
        begin
            //monitor is something like printf
            $monitor ($time, "X = %b, Y = %b, F = %b", x, y, f);
            //work with gtk wave
            $dumpfile ("and.vcd");   //vcd means value change dump
            $dumpvars (0, testbench);
            #5 x =1; y =0;
            #5 x =0; y= 1;
            #5 x =1; y =1;
            #5 x =0; y =0;
            #5 $finish;
         end
endmodule