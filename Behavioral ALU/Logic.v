module Logic #(parameter N = 8)(
				input wire signed [N-1:0] A,
				input wire signed [N-1:0] B,
				input wire s2, 
				input wire s3,
				output reg signed [N-1:0] RL
				);
				
	localparam AND = 2'b00, XOR = 2'b01, OR = 2'b10, ONE_S = 2'b11;
	
	always@(*)
	begin
		case({s2,s3})
			AND: begin
				RL = A & B;
			end
			XOR: begin
				RL = A ^ B;
			end
			OR: begin
				RL = A | B;
			end
			ONE_S: begin 
				RL = ~B;
			end
		endcase
	end
endmodule
	