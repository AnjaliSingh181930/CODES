module blocking_example;
reg x, y, z;
reg [31:0] a, b;
integer sum;

initial 
    begin 
        x = 1'b0;                       //At time = 0
        y = 1'b0;                       //At time = 0
        z = 1'b1;                       //At time = 0
        sum = 1;                        //At time = 0
        a = 31'b0;                      //At time = 0
        b = 31'habababab;               //At time = 0
        #5 a[5] = 1'b1;                 //At time = 5
        #10 b[31:29] = {x, y, z};       //At time = 15
        sum = sum + 5;                  //At time = 15
    end
endmodule