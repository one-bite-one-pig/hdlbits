module top_module( 
    input [2:0] in,
    output [1:0] out );
    wire[1:0] count;
    always@(*)begin
        count=2'b00;
        for(int i=0;i<3;i=i+1)
        begin
            if(in[i])
            count=count+1;
        end
    end
    assign out=count;

endmodule
