module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    reg[3:0] state,next_state;
    always@(*)begin
        if(state==0) next_state=9;
        else if(state==9) next_state=1;
        else if(state==1)begin
            if(x==1) next_state=2;
            else next_state=1;
        end
        else if(state==2)begin
            if(x==0) next_state=3;
            else next_state=2;
        end
        else if(state==3)begin
            if(x==1) next_state=4;
            else next_state=1;
        end
        else if(state==4)begin
            if(y==1) next_state=5;
            else next_state=6;
        end
        else if(state==5)begin
            next_state=5;
        end
        else if(state==6)begin
            if(y==1) next_state=7;
            else next_state=8;
        end
        else if(state==7)begin
             next_state=7;
        end
        else if(state==8)begin
             next_state=8;
        end
    end

    always@(posedge clk)begin
        if(resetn==0) state<=0;
        else state<=next_state;

    end

    assign f=(state==9);
    assign g=(state==5)|(state==7)|(state==4)|(state==6);

endmodule