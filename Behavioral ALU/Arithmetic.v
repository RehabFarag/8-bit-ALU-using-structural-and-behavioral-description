module Arithmetic #(parameter N=8)(
						input wire signed [N-1:0] A,
						input wire signed [N-1:0] B,
						input wire s2, 
						input wire s3,
						output reg L,
						output reg G,
						output reg E,
						output reg Zero,
						output reg signed [N-1:0] RA,
						output reg carryOut,
						output wire Overflow);
						
	localparam ADD = 2'b00, SUB = 2'b01, TWO_S = 2'b11;
	
	assign Overflow = (({s2,s3} == SUB) || ({s2,s3} == TWO_S)) ? 
	(A[N-1] && ~B[N-1] && ~RA[N-1]) || (~A[N-1] && B[N-1] && RA[N-1]) : 
	(A[N-1] && B[N-1] && ~RA[N-1]) || (~A[N-1] && ~B[N-1] && RA[N-1]);
	
	always@(*)
	begin
		case({s2,s3})
			ADD:  begin
				{carryOut, RA} = {1'b0,A} + {1'b0,B};
			end
			
			SUB: begin
				{carryOut, RA} = {1'b0,A} + {1'b0,~B} + 1'b1;
			end
			
			TWO_S:  begin
				{carryOut, RA} = {1'b0,~B} + 1'b1;
			end
			2'b10:
			begin
				{carryOut, RA} = {1'b0,A} + {1'b0,B};
			end
		endcase
		
		if(RA == 0)
			Zero = 1;
		else
			Zero = 0;
		
	end
	
	always@(A or B)
	begin
		if(A > B)
		begin
			G = 1;
			L = 0;
			E = 0;
		end
		else if(A == B)
		begin
			E = 1;
			G = 0;
			L = 0;
		end
		else
		begin
			L = 1;
			E = 0;
			G = 0;
		end
	end

endmodule
