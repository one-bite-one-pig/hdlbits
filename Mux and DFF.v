module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    wire m_out;
    assign m_out=L?r_in:q_in;
    always @(posedge clk)begin
        Q<=m_out;
    end

endmodule