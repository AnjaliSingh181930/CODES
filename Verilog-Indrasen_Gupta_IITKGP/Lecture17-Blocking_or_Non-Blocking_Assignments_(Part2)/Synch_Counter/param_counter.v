//parameterized design : an n-bit synchronous counter
module counter(clr, clk, count);
    parameter N = 7; //parameter values are substituted before simulation or synthesis
    input clr, clk;
    output reg [0:N] count;

    always @(posedge clk)
        begin
            if (clr) count <= 0;
            else (mode) count <= count + 1;
        end
endmodule