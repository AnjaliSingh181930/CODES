module counter (rst, clock, count);
    parameter N  = 7;
    input rst, clock;
    output [0:N] count;
    reg [0:N] count;

    always @(negedge clock)
        begin
            if(rst) count <=0;
            else count <= count + 1;
        end
        
endmodule