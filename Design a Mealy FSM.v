module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    reg [1:0] state,next_state;
    always@(*)begin
        if(state==0)begin
            if(x==0) next_state=0;
            else next_state=1;
        end
        else if(state==1)begin
            if(x==0) next_state=2;
            else next_state=1;
        end
        if(state==2)begin
            if(x==1) next_state=1;
            else next_state=0;
        end
        
    end
    always@(posedge clk,negedge aresetn)begin
        if(aresetn==0) state<=0;
        else state<=next_state;
    end
    assign z=(x==1)&(state==2);

endmodule