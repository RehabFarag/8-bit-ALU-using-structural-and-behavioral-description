module Control #(parameter  N = 8)(
					input wire signed [N-1:0] RA,
					input wire signed [N-1:0] RL,
					input wire signed [N-1:0] RS,
					input wire s0,
					input wire s1,
					output wire signed [N-1:0] RC);
					
	wire signed [N-1:0] Rmux1;
	
	Mux_2x1 m1(.out(Rmux1), .in1(RL), .in2(RS), .sel(s1));
	
	Mux_2x1 m2(.out(RC), .in1(RA), .in2(Rmux1), .sel(s0));

endmodule
