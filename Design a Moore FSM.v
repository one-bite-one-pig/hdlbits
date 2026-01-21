module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
parameter A=3,B=2,C=1,D=0;
reg [1:0] state,nextstate,prev;

always@(*)begin
    if(s[1]&s[2]&s[3])nextstate=A;
    else if(s[1]&s[2]) nextstate=B;
    else if(s[1]) nextstate=C;
    else nextstate=D;
end

always @(posedge clk)begin
    if(reset)begin
        prev<=D;
        state<=D;
    end
    else begin
        prev<=state;
        state<=nextstate;
    end

end
always @(*)
begin
    if(state==A) begin
        fr1=0;
        fr2=0;
        fr3=0;
    end
    else if(state==B)begin
        fr1=1;
        fr2=0;
        fr3=0;
    end
    else if(state==C)begin
        fr1=1;
        fr2=1;
        fr3=0;
    end
    else if(state==D)begin
        fr1=1;
        fr2=1;
        fr3=1;
    end
end


always @(*) begin
    if(state == 0)
             dfr = 1'b1;         
    else if(prev > state)
             dfr = 1'b1;
    else if(prev< state)
            dfr = 1'b0;
         else
             dfr = dfr;   //will generate latch        
     end



endmodule