module Register #(parameter N = 8)(
					input wire clk,
					input wire rst,
					input wire signed [N-1:0] RC,
					output reg signed [N-1:0] F);

	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			F <= 0;
		end
		else
		begin
			F <= RC;
		end
	end
endmodule
