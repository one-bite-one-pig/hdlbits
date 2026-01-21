module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        if(state==0&&j==0) next_state=0;
        else if(state==0&&j==1)next_state=1;
        else if(state==1&&k==1)next_state=0;
        else if(state==1&&k==0)next_state=1;


    
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state<=0;
        else  state<=next_state;
    end

    
    assign out = state;

endmodule