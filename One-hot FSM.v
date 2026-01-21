module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

    always@(*)begin
        next_state[0]=(state[0]&&in==0)|(state[1]&&in==0)|(state[2]&&in==0)|(state[3]&&in==0)|(state[4]&&in==0)|(state[7]&&in==0)|(state[8]&&in==0)|(state[9]&&in==0);
        next_state[1]=(state[0]&&in==1)|(state[8]&&in==1)|(state[9]&&in==1);
        next_state[2]=(state[1]&&in==1);
        next_state[3]=(state[2]&&in==1);
        next_state[4]=(state[3]&&in==1);
        next_state[5]=(state[4]&&in==1);
        next_state[6]=(state[5]&&in==1);
        next_state[7]=(state[6]&&in==1)|(state[7]&&in==1);
        next_state[8]=(state[5]&&in==0);
        next_state[9]=(state[6]&&in==0);
        out1=0;out2=9;
        if(state[8]|state[9]) out1=1;
        if(state[7]|state[9]) out2=1;

        



    end




    endmodule