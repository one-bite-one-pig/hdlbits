module top_module( 
    input [99:0] in,
    output [99:0] out
);
    always @(*) begin
        for(int i=0;i<100;i=i+1)
        out[i]=in[99-i];
    end

endmodule

module top_module( 
    input [99:0] in,
    output [99:0] out
);
    genvar i ;
    generate
        for(i =0;i<100;i=i+1)begin: reverse
               assign out[i]=in[99-i];
        end
    endgenerate

endmodule

