// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg present_state, next_state;
    parameter A=0,B=1;

    always@(*)begin
        case({present_state,in})
         2'b11:next_state=1;
        2'b10:next_state=0;
        2'b01:next_state=0;
        2'b00:next_state=1;
        endcase
    end
    always@(posedge clk)begin
        if(reset) present_state<=1;
        else
        present_state<=next_state;

    end

    assign out=present_state;


endmodule