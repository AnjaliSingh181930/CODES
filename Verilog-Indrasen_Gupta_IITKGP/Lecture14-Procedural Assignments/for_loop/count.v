module count();

    integer count, i;
    reg [100:1] data;

    initial 
        for(count = 0; count <= 10; count = count + 1)
                $display ("My count : %d ", count);
    initial 
        for(i=1; i<= 100; i = i +1)
            data[i] = 1'b0;
endmodule