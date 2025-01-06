module counter(clock, rst, count);
    input clock, rst;
    output [31:0] count;
    reg [31:0] count;

    always @(posedge clock)
        begin
            if(rst) count = 32'b0;
            else count = count + 1;
        end
endmodule