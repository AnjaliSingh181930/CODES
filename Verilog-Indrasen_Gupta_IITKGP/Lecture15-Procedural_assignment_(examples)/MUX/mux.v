module mux21(in, out, sel)
    input [1:0] in;
    input sel; 
    output reg out;

    always @(in[1] or in[0] or sel) // can be written as @(in[1], in[0], sel) or @( * )
    begin
        if(sel)
            out = in[1];
        else
            out = in[0];
    end

endmodule
