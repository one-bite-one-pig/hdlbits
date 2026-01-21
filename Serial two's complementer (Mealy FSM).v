module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
reg[1:0] state,next_state;
always@(*)begin
    if(state==0)begin
        if(x==0) next_state=0;
        else next_state=1;
    end
    else if(state==1)begin
        next_state=1;
    end
end

always@(posedge clk, posedge areset)begin
    if(areset) state<=0;
    else state<=next_state;
end

always @(*)begin
    case (state)
    1'b0: z=x;
    1'b1: z=~x;

    endcase


end

endmodule