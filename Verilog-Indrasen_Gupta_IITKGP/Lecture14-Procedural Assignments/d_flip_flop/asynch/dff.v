//D flip-flop with asynchronous set and reset
module dff(D, clock, set, reset, Q, Qbar);
    input D, clock, set, reset;
    output reg Q;
    output Qbar;

    assign Qbar = ~Q;

    always @(posedge clock or negedge set or negedge reset)
        begin
            if(reset == 0) Q <= 0;
            else if (set == 0) Q <=1;
            else Q <= D; //non- blocking assignment used
            
        end
endmodule