module dff_negedge (D, clock, Q, Qbar);
    input D, clock;
    output reg Q, clock;

    always @(negedge clock)
        begin
            Q = D; //blocking assignment used
            Qbar = ~D; //blocking assignment used
        end
endmodule