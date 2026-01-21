module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0,B=1;
    reg state,nextstate;
    always@(*)begin
        case ({state,in})
        2'b11:nextstate=1;
        2'b10:nextstate=0;
        2'b01:nextstate=0;
        2'b00:nextstate=1;
        endcase
    end

    always@(posedge clk, posedge areset)begin
        if(areset)state<=1;
        else
        state<=nextstate;

    end
    assign out=state;

endmodule