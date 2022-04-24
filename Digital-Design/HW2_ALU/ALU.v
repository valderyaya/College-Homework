
module CLA_4bit(A, B, Cin, S, Cout);
	parameter n = 4;
	input [n - 1: 0] A, B;
	input Cin;
	
	output [n - 1: 0] S;
	output Cout;

	wire [3:0] P, G, C;
	assign P = A ^ B;
	assign G = A & B;
	assign C[0] = Cin;
	assign C[3:1] = {G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C[0]), G[1]|(P[1]&G[0])|(P[1]&P[0]&C[0]), G[0]|(P[0]&C[0])};
	assign Cout = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C[0]);
	assign S = P ^ C;

endmodule

module Adder_16bit(A, B, Cin, S, Cout);

	parameter n = 16;
	parameter m = 4;

	input [n - 1: 0] A, B;
	input Cin;
	
	output [n - 1: 0] S;
	output Cout;

	wire [2:0] C;
	CLA_4bit a(A[3:0], B[3:0], Cin, S[3:0], C[0]);
	CLA_4bit b(A[7:4], B[7:4], C[0], S[7:4], C[1]);
	CLA_4bit c(A[11:8], B[11:8], C[1], S[11:8], C[2]);
	CLA_4bit d(A[15:12], B[15:12], C[2], S[15:12], Cout);	
endmodule

module ALU(A, B, Cin, Mode, Y, Cout, Overflow);

	parameter n = 16;
	parameter m = 4;
	
	input [n - 1: 0] A, B;
	input Cin;
	input [m - 1: 0] Mode;	

	output reg [n - 1: 0] Y;
	output reg Cout;
	output reg Overflow;
	
	wire [n-1:0] Y1, Y2, nB;
	assign nB = -B;
	wire C1, C2;
	
	Adder_16bit adder1(.A(A),.B(B),.Cin(Cin),.S(Y1),.Cout(C1));
	Adder_16bit adder2(.A(A),.B(nB),.Cin(1'b0),.S(Y2),.Cout(C2));
	always@(*)begin
		case(Mode)
			//Logical shift A left by 1-bit.
			4'd0: begin
				Y = A << 1'b1;
			end
			//Arithmetic shift A left by 1-bit.
			4'd1: begin
				Y = A <<< 1'b1;
			end
			//Logical shift A right by 1-bit.
			4'd2: begin
				Y = A >> 1'b1;
			end
			//Arithmetic shift A right by 1-bit.
			4'd3: begin
				Y = {A[15],A[15:1]};
			end
			//Add two numbers with cla.
			4'd4: begin
				Y = Y1;
				Cout = C1;
				Overflow = A[n-1]&B[n-1]&~Y1[n-1] | ~A[n-1]&~B[n-1]&Y1[n-1];
			end
			//Subtract B from A.
			4'd5: begin
				Y = Y2;
				Cout = C2;
				Overflow = A[n-1]&nB[n-1]&~Y2[n-1] | ~A[n-1]&~nB[n-1]&Y2[n-1];	
			end
			//and
			4'd6: begin
				Y = A & B;
			end
			//or
			4'd7: begin
				Y = A | B;
			end
			//not A
			4'd8: begin
				Y = ~A;
			end
			//xor
			4'd9: begin
				Y = A ^ B;
			end
			//xnor
			4'd10: begin
				Y = ~(A ^ B);
			end
			//nor
			4'd11: begin
				Y = ~(A | B);
			end
			//binary to one-hot
			4'd12: begin
				Y = 1<<A[3:0];
			end
			//Comparator
			4'd13: begin
				if(A[15]==0 && B[15]==1) begin
					Y = 0;
				end
				else if(A[15]==1 && B[15]==0) begin
					Y = 1;
				end
				else begin
					Y = (A<B);
				end
			end
			//B
			4'd14: begin
				Y = B;
			end
			//find first one from left
			4'd15: begin
			        casex(A)
				        16'b1xxxxxxxxxxxxxxx: begin
				            Y = {12'd0,4'd15};
				        end
    				    16'b01xxxxxxxxxxxxxx: begin
				        	Y = {12'd0,4'd14};
				        end
				        16'b001xxxxxxxxxxxxx: begin
				            Y = {12'd0,4'd13};
				        end
				        16'b0001xxxxxxxxxxxx: begin
				           Y = {12'd0,4'd12};
				        end
    				    16'b00001xxxxxxxxxxx: begin
				            Y = {12'd0,4'd11};
				        end
				        16'b000001xxxxxxxxxx: begin
				            Y = {12'd0,4'd10};
				        end
    				    16'b0000001xxxxxxxxx: begin
				            Y = {12'd0,4'd9};
				        end
				        16'b00000001xxxxxxxx: begin
				            Y = {12'd0,4'd8};
				        end
				        16'b000000001xxxxxxx: begin
				            Y = {12'd0,4'd7};
				        end
				        16'b0000000001xxxxxx: begin
				            Y = {12'd0,4'd6};
    				    end
	    			    16'b00000000001xxxxx: begin
		    		        Y = {12'd0,4'd5};
				        end
				        16'b000000000001xxxx: begin
				            Y = {12'd0,4'd4};
				        end
				        16'b0000000000001xxx: begin
				            Y = {12'd0,4'd3};
				        end
				        16'b00000000000001xx: begin
				            Y = {12'd0,4'd2};
				        end
				        16'b000000000000001x: begin
				            Y = {12'd0,4'd1};
				        end
				        16'b0000000000000001: begin
				            Y = {12'd0,4'd0};
				        end
			       endcase
			end
			default: begin
			end
		endcase
	end
endmodule


















