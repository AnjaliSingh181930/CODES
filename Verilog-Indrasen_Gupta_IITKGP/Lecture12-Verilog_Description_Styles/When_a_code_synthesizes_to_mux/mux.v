module generate_mux(data, select, out, f);
    input [15:0] data;   // 16-bit input data
    input [3:0] select;  // 4-bit select signal
    output out;          // Single-bit output for selected data
    output [3:0] f;      // 4-bit output from the conditional operation

    // MUX logic for a 16-bit input using 4-bit select
    assign out = data[select]; // selects the bit corresponding to the select line

    // Conditional operation (f = in[3:0] if sel[0] else in[12:15])
    assign f = select[0] ? data[3:0] : data[7:4]; // Conditional logic for f

endmodule

