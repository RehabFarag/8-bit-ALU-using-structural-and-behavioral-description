module Adder_subtractor #(parameter N = 8)(
														input wire signed [N-1:0] X,
														input wire signed [N-1:0] Y,
														input wire cin,
														output wire signed [N-1:0] Result,
														output wire carryOut);
	wire signed [N-1:0] Y_complement;	
	wire [N:0] c;

	
	buf g2(c[0], cin);
	
	buf g3(carryOut, c[N]);
	
	genvar i;
	
	generate
		for(i = 0; i < N; i = i + 1)
		begin: Xor_gen
				xor XORInst(Y_complement[i], Y[i], cin);
		end
	endgenerate
	
	generate
		for(i = 0; i < N; i = i + 1)
		begin: FullAdder_FullSubtractor_gen
				FullAdder FAInstAdd(.a(X[i]), .b(Y_complement[i]), .c(c[i]), .sum(Result[i]), .carry(c[i+1]));
		end
	endgenerate
	
endmodule
