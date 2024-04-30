module ALU_TOP #(parameter N=8)(
				input wire clk,
				input wire rst,
				input wire signed [N-1:0] A,
				input wire signed [N-1:0] B,
				input wire [3:0] s,
				output wire G,
				output wire E,
				output wire L,
				output wire Zero,
				output wire carryOut,
				output wire Overflow,
				output wire signed [N-1:0] F);
				
	wire [N-1:0] RA, RL, RS, RC;
			
	Arithmetic A1(.A(A), .B(B), .s3(s[3]), .s2(s[2]), 
	.L(L), .G(G), .E(E), .Zero(Zero), .RA(RA), 
	.carryOut(carryOut), .Overflow(Overflow));
	
	Logic L1(.A(A), .B(B), .s3(s[3]), .s2(s[2]), .RL(RL));
	
	Shifter S1(.A(A), .s3(s[3]), .s2(s[2]), .RS(RS));
	
	Control C1(.RA(RA), .RL(RL), .RS(RS), .s0(s[0]), .s1(s[1]), .RC(RC));
	
	Register R1(.clk(clk), .rst(rst), .RC(RC), .F(F));
	
endmodule
