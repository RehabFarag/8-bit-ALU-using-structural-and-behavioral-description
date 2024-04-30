module xorGate #(parameter N = 8)(
					input wire signed [N-1:0] in1,
					input wire signed [N-1:0] in2,
					output wire signed [N-1:0] out);
					
	genvar i;
	generate
	for (i = 0; i < N; i = i + 1)
	begin: Xor_gen
		xor XG(out[i], in1[i], in2[i]);
	end
	endgenerate
	
endmodule
