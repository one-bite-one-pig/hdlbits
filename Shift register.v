module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg  out);
    reg r1,r2,r3;
    always@(posedge clk)begin
        if(!resetn)begin
            r1<=0;r2<=0;r3<=0;out<=0;
        end
        else begin
            r1<=in;
            r2<=r1;
            r3<=r2;
            out<=r3;
        end

    end

endmodule