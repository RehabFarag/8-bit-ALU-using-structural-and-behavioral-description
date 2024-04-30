`timescale 1 ns / 1 ns
module ALU_TOP_Structure_tb #(parameter N=8)();
	reg clk;
	reg rst;
	reg signed [N-1:0] A;
	reg signed [N-1:0] B;
	reg [3:0] s;
	wire G;
	wire E;
	wire L;
	wire Zero;
	wire signed [N-1:0] F;
	wire carryOut;
	wire Overflow;
	integer i, j;
	parameter PERIOD = 10;
	
	ALU_TOP DUT(
				.clk(clk),
				.rst(rst),
				.A(A),
				.B(B),
				.s(s),
				.G(G),
				.E(E),
				.L(L),
				.Zero(Zero),
				.F(F),
				.carryOut(carryOut),
				.Overflow(Overflow));
				
	initial
	begin
		A = -2**(N-1);
		B = -2**(N-1);
		s = 4'b1100;
		clk = 0;
		rst = 1;
		#(PERIOD) rst = 0;
		for(i = -2**(N-1); i < 2**(N-1); i = i + 1)
		begin
			for(j = -2**(N-1); j < 2**(N-1); j = j + 1)
			begin
				A = i;
				B = j;
				//check arithmetic 00
				#(PERIOD + 1) s = 4'b0000;
				#(PERIOD + 1) s = 4'b0100;
				#(PERIOD + 1) s = 4'b1100;
				#(PERIOD + 1) s = 4'b1000;
				
				//check logic 01
				#(PERIOD + 1) s = 4'b0001;
				#(PERIOD + 1) s = 4'b0101;
				#(PERIOD + 1) s = 4'b1001;
				#(PERIOD + 1) s = 4'b1101;
				
				//check 10 same as 00
				#(PERIOD + 1) s = 4'b0010;
				#(PERIOD + 1) s = 4'b0110;
				#(PERIOD + 1) s = 4'b1010;
				#(PERIOD + 1) s = 4'b1110;
				
				//check shifter 11
				#(PERIOD + 1) s = 4'b0011;
				#(PERIOD + 1) s = 4'b0111;
				#(PERIOD + 1) s = 4'b1011;
				#(PERIOD + 1) s = 4'b1111;
			end
		end
		$stop();
	end
	
	always
		#(PERIOD/2) clk <= ~clk;
endmodule
