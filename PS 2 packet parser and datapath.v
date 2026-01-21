module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
reg[2:0] state,next_state;
    // FSM from fsm_ps2
    // State transition logic (combinational)
    always@(*) begin
    if(state==0)begin
        if(in[3]==1) next_state=1;
        else next_state=0;
    end
    else if(state==1)begin
        next_state=2;
    end
    else if(state==2)begin
        next_state=3;
    end
    else if(state==3)begin
        if(in[3]==1) next_state=1;
        else next_state=0;
    end

    end

    // State flip-flops (sequential)
    always@(posedge clk) begin
        if(reset) state<=0;
        else state<=next_state;
        if(next_state==1) out_bytes[23:16]<=in[7:0];
        else if(next_state==2) out_bytes[15:8]<=in[7:0];
        else if(next_state==3) out_bytes[7:0]<=in[7:0];
    end
 
    // Output logic
    assign done=(state==3);

    // New: Datapath to store incoming bytes.
    
        
    
    

endmodule