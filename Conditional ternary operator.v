module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] r1,r2;
    assign r1=a>b? b:a;
    assign r2=c>d?d:c;
    assign min= r1>r2? r2:r1;
    // assign intermediate_result1 = compare? true: false;

endmodule