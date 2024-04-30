module Shifter #(parameter N=8)(
					input wire signed [N-1:0] A,
					input wire s2,
					input wire s3,
					output wire signed [N-1:0] RS);
					
	localparam RIGHT_ROTATE = 2'b00, LEFT_ROTATE = 2'b01, RIGHT_SHIFT = 2'b10, LEFT_SHIFT = 2'b11;
	
	assign RS = ({s2,s3} == RIGHT_ROTATE) ?  	((A >> 1) | (A << (N-1))) : 
	({s2,s3} == LEFT_ROTATE) ? ((A << 1) | (A >> (N-1))) :
	({s2,s3} == RIGHT_SHIFT) ? (A >> 1) : ({s2,s3} == LEFT_SHIFT) ? (A << 1) : 1'bx;
					
endmodule
