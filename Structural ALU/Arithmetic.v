module Arithmetic #(parameter N=8)(
						input wire signed [N-1:0] A,
						input wire signed [N-1:0] B,
						input wire s2, 
						input wire s3,
						output wire L,
						output wire G,
						output wire E,
						output wire Zero,
						output wire signed [N-1:0] RA,
						output wire carryOut,
						output wire Overflow);
						
	localparam ADD = 2'b00, SUB = 2'b01, TWO_S = 2'b11;
	
	wire signed [N-1:0] in1;
	
	wire cin;
	
	assign in1 = ({s2,s3} == TWO_S) ? 1'b0 : A;   
	
	assign cin = (({s2,s3} == ADD) || ({s2,s3} == 2'b10)) ? 1'b0 : 1'b1;
	
	assign Overflow = (({s2,s3} == SUB) || ({s2,s3} == TWO_S)) ? 
	(A[N-1] && ~B[N-1] && ~RA[N-1]) || (~A[N-1] && B[N-1] && RA[N-1]) : 
	(A[N-1] && B[N-1] && ~RA[N-1]) || (~A[N-1] && ~B[N-1] && RA[N-1]);
	
	assign G = (A > B) ? 1'b1 : 1'b0;
	
	assign E = (A == B) ? 1'b1 : 1'b0;
		
	assign L = (A < B) ? 1'b1 : 1'b0;
	
	assign Zero = (RA == 0) ? 1'b1 : 1'b0;
	
	
	Adder_subtractor AS1(.X(in1), .Y(B), .cin(cin), .Result(RA), .carryOut(carryOut));

endmodule
