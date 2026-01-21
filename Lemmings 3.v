module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg [2:0] state,next_state;

    parameter L=0,R=1,FL=2,FR=3,DL=4,DR=5;

    always@(*)begin
        if(state==L)begin
            if(ground==0) next_state=FL;
            else if(dig==1) next_state=DL;
            else if(bump_left==1) next_state=R;
            else next_state=L;
        end
        else if(state==R)begin
            if(ground==0) next_state=FR;
            else if(dig==1) next_state=DR;
            else if(bump_right==1) next_state=L;
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
        else if(state==DL)begin
            if(ground==0) next_state=FL;
            else next_state=DL;
        end
        else if(state==DR)begin
            if(ground==0) next_state=FR;
            else next_state=DR;
        end
    end

    always@(posedge clk,posedge areset)begin
        if(areset) state<=L;
        else state<=next_state;


    end

    assign walk_left=(state==L);
    assign walk_right=(state==R);
    assign aaah=(state==FL)|(state==FR);
    assign digging=(state==DL)|(state==DR);
endmodule