module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    always @(*) begin
        case(y)
        3'b000: Y0=x?1:0;
        3'b001: Y0=x?0:1;
        3'b010: Y0=x?1:0;
        3'b011: Y0=x?0:1;
        3'b100: Y0=x?0:1;
        default :Y0=0;
        endcase
    end

    

    always@(*) begin
        case(y)
        3'b000: z=0;
        3'b001: z=0;
        3'b010:z=0;
        3'b011: z=1;
        3'b100: z=1;
        endcase


    end
endmodule