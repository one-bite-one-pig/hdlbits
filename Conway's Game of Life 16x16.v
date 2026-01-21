module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    
    always@(posedge clk)begin
        if(load) q<=data;
        else begin
                
                    integer r,c,dr,dc;
                    for(r=0;r<16;r=r+1)begin
                        for(c=0;c<16;c=c+1)begin
                            integer cnt;
                            cnt=0;
                            for(dr=-1;dr<=1;dr=dr+1)begin
                                for(dc=-1;dc<=1;dc=dc+1)begin
                                    if(!(dc==0&&dr==0)&&q[16*((r+dr+16)%16)+((c+dc+16)%16)])
                                        cnt=cnt+1;
                                end
                            end
                            case(cnt)
                            2:q[16*r+c]<=q[16*r+c];
                            3:q[16*r+c]<=1;
                            default:q[16*r+c]<=0;


                            endcase

                        end

                    end


                
        end


    end

endmodule