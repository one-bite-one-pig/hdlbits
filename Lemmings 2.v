module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    reg [2:0] state,next_state;
    parameter L=0,R=1,FL=2,FR=3;

    always@(*)begin
        if(state==L)begin
            if(ground==0) next_state=FL;
            else if(bump_left) next_state=R;
            else next_state=L;
        end
        else if(state==R)begin
            if(ground==0) next_state=FR;
            else if(bump_right) next_state=L;
            else next_state=R;
        end
        else if(state==FL)begin
            if(ground==1) next_state=L;
            else next_state=FL;
        end
        else if(state==FR)begin
            if(ground==1) next_state=R;
            else next_state=FR;
        end
    end

        always@(posedge clk,posedge areset)begin
            if(areset) state<=L;
            else state<=next_state;
        end

        assign walk_left=state==L;
        assign walk_right=state==R;
        assign aaah=state==FL|state==FR;
    

    endmodule