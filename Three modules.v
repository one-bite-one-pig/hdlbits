module top_module ( input clk, input d, output q );
    wire o1,o2;
    my_dff m1(.d(d),.clk(clk),.q(o1));
    my_dff m2(.d(o1),.clk(clk),.q(o2));
    my_dff m3(.d(o2),.clk(clk),.q(q));


endmodule
