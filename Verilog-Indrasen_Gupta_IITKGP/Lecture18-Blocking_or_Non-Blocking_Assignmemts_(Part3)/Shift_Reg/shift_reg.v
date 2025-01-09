module shiftreg_4bit(clock, clear, A, E);
    input clock, clear, A;
    output reg E;
    reg B, C, D;

    always @(posedge clock or negedge clear)
        begin
            if(!clear) 
                begin 
                    B =0; C=0; D=0; E=0; 
                end
            else 
                begin 
                    E = D;
                    D = C;
                    C = B;
                    B = A;
                    //What if we reverse the order?
                    // B = A;
                    // C = B;
                    // D = C;
                    // E = D;
                    //Last four statements simply mean E = A.
                    //If this would have been a non-blocking assignmnet then the order would have not mattered.

                end
        end
endmodule

