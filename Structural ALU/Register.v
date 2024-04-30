module Register #(parameter N = 8)(
					input wire clk,
					input wire rst,
					input wire signed [N-1:0] RC,
					output wire signed [N-1:0] F);

	genvar i;
	generate
	for(i = 0; i < N; i = i + 1)
	begin: D_Flip_Flop_gen
		d_ff Dff(.clk(clk), .rst(rst), .d(RC[i]), .q(F[i]));
	end
	endgenerate
endmodule
