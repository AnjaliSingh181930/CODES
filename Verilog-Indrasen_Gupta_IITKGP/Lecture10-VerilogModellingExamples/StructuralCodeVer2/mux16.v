module mux16to1( in , sel, out);
    input [15:0] in;
    input [3:0] sel;
    output out;
    wire [3:0] t;
  
	// First layer: Four 4-to-1 multiplexers
    mux4to1 M1 (.in(in[3:0]),   .sel(sel[1:0]), .out(t[0]));
    mux4to1 M2 (.in(in[7:4]),   .sel(sel[1:0]), .out(t[1]));
    mux4to1 M3 (.in(in[11:8]),  .sel(sel[1:0]), .out(t[2]));
    mux4to1 M4 (.in(in[15:12]), .sel(sel[1:0]), .out(t[3]));

    // Second layer: One 4-to-1 multiplexer to combine the results
    mux4to1 M5 (.in(t), .sel(sel[3:2]), .out(out));

endmodule
