module Mux_2x1 #(parameter N = 8)(
					input wire signed [N-1:0] in1,
					input wire signed [N-1:0] in2,
					input wire sel,
					output reg signed [N-1:0] out);
					
	always@(*)
	begin
		case(sel)
			1'b0: begin
				out = in1;
			end
			1'b1: begin
				out = in2;
			end
		endcase
	end			
endmodule
			