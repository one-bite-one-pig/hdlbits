module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
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
            if((odd==0&in==1)||(odd==1&&in==0)) next_state=10;
            else next_state=11;
        end
        else if(state==10)begin
            if(in==1)next_state=12;
            else next_state=13;
        end
        else if(state==11)begin
            if(in==1)next_state=14;
            else next_state=15;
        end
        else if(state==12)begin
            if(in==0) next_state=1;
            else next_state=0;
        end
        else if(state==13) begin
            if(in ==1 )next_state=0;
            else next_state=13;
        end
        else if(state==14) begin
            if(in==0)next_state=1;
            else next_state=0;
        end
        else if(state==15) begin
            if(in==1)next_state=0;
            else next_state=15;
        end

    end

    always@(posedge clk)begin
        if(reset) state<=0;
        else state<=next_state;
    end

    assign done=(state==12);
    // New: Datapath to latch input bits.
    always @(posedge clk) begin
        if(next_state>=2&&next_state<=10)begin
            out_byte[next_state-2]<=in;
        end
    end
    reg odd;
    wire reset1;
    assign reset1= (state==0)||(state==12)||(state==14);
    parity p1(.clk(clk),.in(in),.reset(reset1),.odd(odd));


    // New: Add parity checking.

endmodule
