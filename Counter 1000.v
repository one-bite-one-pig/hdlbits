module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    assign c_enable[0]=1;
    wire [3:0]Q1,Q2,Q3;
    always@(*)begin
        c_enable[1]=0;
        c_enable[2]=0;
        if (Q1==9) c_enable[1]=1;
        if (Q2==9&& Q1==9) c_enable[2]=1;
    end
    bcdcount counter0 (clk, reset, c_enable[0],Q1);
    bcdcount counter1 (clk, reset, c_enable[1], Q2);
    bcdcount counter2 (clk, reset, c_enable[2],Q3);
    assign OneHertz=(Q3==9&Q1==9&Q2==9)?1:0;

endmodule