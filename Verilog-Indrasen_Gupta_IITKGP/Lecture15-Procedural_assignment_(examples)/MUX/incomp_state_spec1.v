module incoomp_state_spec(curr_state, flag);
    input [0:1] curr_state;
    output reg [0:1 flag];

    always @(curr_state)
    begin 
        flag = 0;
        case (curr_state)
            //2 is not defined
            0,1 :   flag    =   2; 
            3   :   flag    =   0;
        endcase
    end
endmodule


// curr_flag    flag
// 0            2
// 1            2
// 2            0 , becoz falg is initialized as 0 at start of case, hence a pure combinational circui generated.
// 3            0