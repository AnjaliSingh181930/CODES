module bcd_to_7seg (
    input [3:0] bcd,    // 4-bit BCD input
    output reg [6:0] seg // 7-segment display output
);
    always @(*) begin
        case (bcd)
            0      : seg = 7'b1111110; // 0
            1      : seg = 7'b0110000; // 1
            4'b0010: seg = 7'b1101101; // 2
            4'b0011: seg = 7'b1111001; // 3
            4'b0100: seg = 7'b0110011; // 4
            4'b0101: seg = 7'b1011011; // 5
            4'b0110: seg = 7'b1011111; // 6
            4'b0111: seg = 7'b1110000; // 7
            4'b1000: seg = 7'b1111111; // 8
            4'b1001: seg = 7'b1111011; // 9
            default: seg = 7'b0000000; // Invalid BCD input (blank display)
        endcase
    end
endmodule
            a
         ________
       /        /
   f  /        /  b
     /________/
    /    g   /
 e /        /   c
  /________/
      d

// this code is if we want to glow led light for any one straight line : Segment bit assignmnet (a, b, c, d, e, f, g)

