module incoomp_state_spec(curr_state, flag);
    input [0:1] curr_state;
    output reg [0:1 flag];

    always @(curr_state)
    begin 
        case (curr_state)
            //2 is not defined, 
            0,1 :   flag    =   2; 
            3   :   flag    =   0;
        endcase
    end
endmodule


// curr_flag    flag
// 0            2
// 1            2
// 2            not defined, so synthesiser will assume that at curr_state = 2 we will retain previous value, map to storage element i.e., latch
// 3            0

