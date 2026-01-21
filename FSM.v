module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
reg state,next_state;

always@(*)begin
    if(state==0) begin
        if(s==0) next_state=0;
        else next_state=1;
    end
    else begin
        next_state=1;
    end
end

always@(posedge clk)begin
    if(reset) begin state<=0;
    end
    else state<=next_state;
end

reg[1:0] cnt,timer;

always @(posedge clk)begin
    if(reset) begin timer<=0;cnt<=0;end
    else if(state==1) begin
        if(timer==2)begin timer<=0;
        end
        else timer<=timer+1;

        if(timer==0) cnt<=w;
        else cnt<=cnt+w;
    end
    
end

    assign z=(cnt==2)&&(timer==0);



endmodule