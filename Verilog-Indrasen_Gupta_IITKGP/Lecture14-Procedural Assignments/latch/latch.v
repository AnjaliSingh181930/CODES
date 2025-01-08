//Transparent latch with enable
module latch(Q, Qbar, Din, enable);
    input Din, enable;
    output reg Q;
    output Qbar;

    assign Qbar = ~Q;

    always @(Din or enable)
        begin 
            if (enable) Q = Din;
        end
endmodule