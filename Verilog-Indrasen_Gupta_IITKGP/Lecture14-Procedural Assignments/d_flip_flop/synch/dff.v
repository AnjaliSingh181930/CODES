//D flip-flop with synchronous set and reset
module dff(D, clock, set, reset, Q, Qbar);
    input D, clock, set, reset;
    output reg Q;
    output Qbar;

    assign Qbar = ~Q;

    always @(posedge clock)
        begin
            if(reset == 0) Q <= 0;
            else if (set == 0) Q <=1;
            else Q <= D; //non- blocking assignment used
            
        end
endmodule