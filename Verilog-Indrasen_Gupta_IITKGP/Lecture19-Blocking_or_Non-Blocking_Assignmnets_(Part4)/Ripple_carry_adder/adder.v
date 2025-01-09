module rca(carry_out, sum, a, b, carry_in);

    parameter N = 8;

    input [N-1:0] a, b; input carry_in;
    output [N-1:0] sum; output carry_out;

    wire [N:0] carry;
    
    assign carry[0] = carry_in;
    assign carry_out = carry[N];

    genvar i;

    generate for (i=0; i< N; i=i+1)
        begin: fa_loop
            wire t1, t2, t3;
            xor G1(t1, a[i], b[i]), G2(sum[i], t1, carry[i]);
            and G3(t2, a[i], b[i]), G4(t3, t1, carry[i]);
            or G5(carry[i+1], t2, t3);
            //The relative hierarchical names of the xor gates will be:
            //        fa_loop[0].G1, fa_loop[1].G1, fa_loop[2].G1,......fa_loop[N-1].G1
            //The relative hierarchical names of the wires will be:
            //        fa_loop[0].t1, fa_loop[1].t1, fa_loop[2].t2, fa_loop[N-1].G1
        end
    endgenerate
endmodule