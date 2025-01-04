module counter(clk, rst, count);
    input clk, rst;
    output reg [3:0] count;

    always @(posedge clk or posedge rst)
        begin
            if(rst)
                count <= b'0; //non-blocking assignment used
            else
                count <= count + 1; //non-blocking asignment used
        end
endmodule