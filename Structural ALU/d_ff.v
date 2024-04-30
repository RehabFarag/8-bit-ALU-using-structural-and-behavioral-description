module d_ff(
				input wire clk,
				input wire rst,
				input wire d,
				output reg q);
				
	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			q <= 0;
		end
		else
		begin
			q <= d;
		end
	end
endmodule
