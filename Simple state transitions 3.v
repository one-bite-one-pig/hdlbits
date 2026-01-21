module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

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
    assign out=(state==D)?1:0;

endmodule