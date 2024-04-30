module Logic #(parameter N = 8)(
				input wire signed [N-1:0] A,
				input wire signed [N-1:0] B,
				input wire s2, 
				input wire s3,
				output wire signed [N-1:0] RL
				);
				
	localparam AND = 2'b00, XOR = 2'b01, OR = 2'b10, ONE_S = 2'b11;
	
	wire signed [N-1:0] RL_and, RL_xor, RL_or, RL_not;
	
	assign RL = ({s2,s3} == AND) ?  	RL_and : ({s2,s3} == XOR) ? RL_xor :
	({s2,s3} == OR) ? RL_or : ({s2,s3} == ONE_S) ? RL_not : 1'bx;
	
	andGate g1(.out(RL_and), .in1(A), .in2(B));
	
	xorGate g2(.out(RL_xor), .in1(A), .in2(B));
	
	orGate g3(.out(RL_or), .in1(A), .in2(B));
	
	notGate g4(.out(RL_not), .in(B));
	
endmodule
	