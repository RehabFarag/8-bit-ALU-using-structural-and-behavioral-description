module notGate #(parameter N = 8)(
					input wire signed [N-1:0] in,
					output wire signed [N-1:0] out);
					
	genvar i;
	generate
	for(i = 0; i < N; i = i + 1)
	begin: Not_gen
		not NG(out[i], in[i]);
	end
	endgenerate

endmodule
