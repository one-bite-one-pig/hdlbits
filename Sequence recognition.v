module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    reg [3:0] state ,next_state;
    always @(*) begin
        if(state==0)begin
            if(in==0) next_state=1;
            else next_state=0;
        end
        else if(state>=1&&state<=5)begin
            if(in==1) next_state=state+1;
            else next_state=1;
        end
        else if(state==6)begin
            if(in==0) next_state=7;
            else next_state=8;
        end
        else if(state==7)begin
            if(in==0) next_state=1;
            else next_state=2;
        end
        else if(state==8)begin
            if(in==1) next_state=10;
            else next_state=9;
        end
        else if(state==9)begin
            if(in==0) next_state=1;
            else next_state=2;
        end
        else if(state==10)begin
            if(in==0) next_state=1;
            else next_state=10;
        end

    end

    always@(posedge clk)begin
        if(reset) state<=1;
        else state<=next_state;

    end

    assign disc=(state==7);
    assign flag =(state==9);
    assign err=(state==10);


endmodule
