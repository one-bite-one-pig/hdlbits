module mod60(input clk,
            input reset,
            input enable,
            output reg[7:0] sum
);
    always@(posedge clk)begin
        if(reset) sum<=0;
        else if (enable)begin
            if(sum==8'h59) sum<=0;
            else if(sum[3:0]==4'h9) sum<={sum[7:4]+4'h1,4'h0};
            else sum<=sum+1;
        end
    end
endmodule

module mod12(input clk,
            input reset,
            input enable,
            output reg[7:0] sum
);
    always@(posedge clk)begin
        if(reset) sum<=8'h12;
        else if (enable)begin
            if(sum==8'h12) sum<=1;
            else if(sum[3:0]==4'h9) sum<={sum[7:4]+4'h1,4'h0};
            else sum<=sum+1;
        end
    end


endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output reg[7:0] hh,
    output reg[7:0] mm,
    output reg[7:0] ss); 
    mod60 second (clk,reset,ena,ss);
    reg enable_m,enable_h;
    always @(*)begin
        enable_m=0;
        enable_h=0;
        if(ss==8'h59)  enable_m=1;
        if (ss==8'h59&mm==8'h59) enable_h=1;
    end

    mod60 minute (clk,reset,enable_m,mm);
    mod12 hour (clk,reset,enable_h,hh);

    always@(posedge clk)begin
        if(reset) pm<=0;
        else if(hh==8'h11&&mm==8'h59&&ss==8'h59) pm<=~pm;

    end

endmodule