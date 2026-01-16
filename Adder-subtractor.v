module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire[31:0] b_xor;
    wire c1;
    assign b_xor=b^{32{sub}};
    add16 m1(.cin(sub),.a(a[15:0]),.b(b_xor[15:0]),.cout(c1),.sum(sum[15:0]));
    add16 m2(.cin(c1),.a(a[31:16]),.b(b_xor[31:16]),.sum(sum[31:16]));


endmodule