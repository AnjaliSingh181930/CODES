module mux4to1( in , sel, out);
    input [3:0] in;
    input [1:0] sel;
    output out;
    wire [1:0] t;
  
  	mux2to1 M1 (.in(in[1:0]), .sel(sel[0]), .out(t[0]));
    mux2to1 M2 (.in(in[3:2]), .sel(sel[0]), .out(t[1]));
  
  	mux2to1 M3 (.in(t), .sel(sel[1]), .out(out));
	
endmodule