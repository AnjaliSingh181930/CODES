module count();

    integer count;

    initial begin
        count = 0;
        while(count <= 10)
            begin
                $display ("My count : %d ", count);
                count = count + 1;
            end
    end
endmodule