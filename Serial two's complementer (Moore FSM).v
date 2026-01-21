module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
reg[2:0] state,next_state;
always @(*)begin
    if(state==0)begin
        if(x==0)
        next_state=0;
        else
        next_state=1;
    end
    else if(state==1)begin
        if(x==0)
        next_state=2;
        else next_state=3;
    end
    else if(state==2)begin
        if(x==1) next_state=3;
        else next_state=2;
    end
    else if(state==3)begin
        if(x==0) next_state=2;
        else next_state=3;
    end
end

always(posedge clk,posedge areset)begin
    if(areset) state<=0;
    else state<=next_state;
end

assign z=(state==1)||(state==2);

endmodule