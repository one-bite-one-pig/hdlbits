module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
reg[1:0] state,next_state;
always @(*)begin
    if(state==0)begin
        if(r1) next_state=1;
        else if(r2) next_state=2;
        else if(r3) next_state=3;
        else next_state=0;
    end
    else if(state==1)begin
        if(r1)next_state=1;
        else next_state=0;
    end
    else if(state==2)begin
       if(r2) next_state=2;
        else next_state=0;
    end 
    else if(state==3)begin
       if(r2) next_state=3;
        else next_state=0;
    end 
end

always @(posedge clk)begin
    if(resetn) state<=0;
    else state<=next_state;
end

assign g[1]=(state==1);
assign g[2]=(state==2);
assign g[3]=(state==3);



endmodule