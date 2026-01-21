module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg[3:0] state,next_state;
    always@(*)begin
        if(state==0)begin
            if(in==0) next_state=1;
            else next_state=0;
        end
        else if(state>=1&&state<=8)begin
            next_state=state+1;
        end
        else if(state==9)begin
            if(in==1) next_state=10;
            else next_state=11;
        end
        else if(state==10)begin
            if(in==0)next_state=1;
            else next_state=0;
        end
        else if(state==11)begin
            if(in==1)next_state=0;
            else next_state=11;
        end

    end

    always@(posedge clk)begin

        if(reset) state<=0;
        else state<=next_state;
    end

    assign done=(state==10);

endmodule