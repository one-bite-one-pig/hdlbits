module top_module (
    input clk,
    input d,
    output q
);
    wire r1,r2;
    always@(posedge clk)begin
        r1<=d;
    end
    always@(negedge clk)begin
        r2<=d;
    end
    assign q=clk?r1:r2;
endmodule
