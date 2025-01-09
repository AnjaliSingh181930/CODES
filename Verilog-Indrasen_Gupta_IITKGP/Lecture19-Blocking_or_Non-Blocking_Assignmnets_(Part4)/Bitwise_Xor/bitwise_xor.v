module xor_bitwise (f, a, b);
    parameter N = 16;
    input [N-1: 0] a, b;
    output [N-1:0] f;
    genvar p;

    generate for (p=0; p<N; p =p+1)
        begin: xorlp  //the name xorlp is given to the generate loop
            xor XG(f[p] , a[p], b[p]);
        end
        //The relative hierarchical names of the xor gates will be:
        //        xorlp[0].XG, xorlp[1].XG, xorlp[2].XG,......xorlp[N-1].XG
    endgenerate

    //assign f = a ^ b;
endmodule