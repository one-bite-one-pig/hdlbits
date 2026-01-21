module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    parameter A=0, B=1, C=2, D=3;
    // State transition logic
    reg[2:0] state,next_state;
    always@(*)begin
        if(state==A)begin 
            if(in==0) next_state=A;
            else if(in==1) next_state=B;
        end
        else if(state==B)begin 
            if(in==0) next_state=C;
            else if(in==1) next_state=B;
        end
        else if(state==C)begin 
            if(in==0) next_state=A;
            else if(in==1) next_state=D;
        end
        else if(state==D)begin 
            if(in==0) next_state=C;
            else if(in==1) next_state=B;
        end
    end

    // State flip-flops with asynchronous reset
    always@(posedge clk, posedge areset)begin
        if(areset) state<=0;
        else state<=next_state;

    end

    // Output logic
    assign out=(state==D)?1:0;

endmodule