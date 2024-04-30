module Shifter #(parameter N=8)(
					input wire signed [N-1:0] A,
					input wire s2,
					input wire s3,
					output reg signed [N-1:0] RS);
					
	localparam RIGHT_ROTATE = 2'b00, LEFT_ROTATE = 2'b01, RIGHT_SHIFT = 2'b10, LEFT_SHIFT = 2'b11;
					
	always@(*)
	begin
		case({s2,s3})
			RIGHT_ROTATE: begin
				RS = ((A >> 1) | (A << (N-1)));
			end
			LEFT_ROTATE: begin
				RS = ((A << 1) | (A >> (N-1)));
			end
			RIGHT_SHIFT: begin
				RS = A >> 1;
			end
			LEFT_SHIFT: begin
				RS = A << 1;
			end
		endcase
	end
endmodule
