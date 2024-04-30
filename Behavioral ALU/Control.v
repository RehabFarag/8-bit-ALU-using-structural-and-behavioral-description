module Control #(parameter  N = 8)(
					input wire signed [N-1:0] RA,
					input wire signed [N-1:0] RL,
					input wire signed [N-1:0] RS,
					input wire s0,
					input wire s1,
					output reg signed [N-1:0] RC);
	
	localparam ARITHMETIC = 2'b00, LOGIC = 2'b01, SHIFTER = 2'b11; 
					
	always@(*)
	begin
		
		case({s1,s0})
			ARITHMETIC: begin
				RC = RA;
			end
			LOGIC: begin
				RC = RL;
			end
			SHIFTER: begin
				RC = RS;
			end
			2'b10: begin
				RC = RA;
			end
		endcase
		
	end
endmodule
