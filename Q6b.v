module top_module (
    input [3:1] y,
    input w,
    output Y2);
    always @(*)begin
    case(Y2)
    3'b000: Y2=w==1?0:0;
    3'b001:Y2=w==1?1:1;
    3'b010:Y2=w==1?1:0;
    3'b011:Y2=w==1?0:0;
    3'b100:Y2=w==1?1:0;
    3'b101:Y2=w==1?1:1;
    endcase
    end

endmodule
