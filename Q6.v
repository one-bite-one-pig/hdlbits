module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    reg[6:1] state,next_state;
    assign next_state[1]=(state[1]&&(w))|(state[4]&&w);
    assign next_state[2]=state[1]&&(~w);
    assign next_state[3]=(state[2]&&(~w))|(state[6]&&(~w));
    assign next_state[4]=(state[2]&&(w))|(state[3]&&(w))|(state[5]&&(w))|(state[6]&&(w));
    assign next_state[5]=(state[3]&&(~w))|(state[5]&&(~w));
    assign next_state[6]=(state[4]&&(~w));


    always@(posedge clk)begin
        if(reset) state<=6'b000001;
        else
        state<=next_state;
    end

    always @(*) begin
        z=state[5]||state[6];

    end

endmodule