
module PAT(clk, reset, data, flag);
	
	input clk, reset, data;
	output flag;
	parameter s0=4'b0000, s1=4'b0001, s2=4'b0010, s3=4'b0011, s4=4'b0100, s5=4'b0101, s6=4'b0110, s7=4'b0111, s8=4'b1000;
	reg [3:0]stat;
	reg [3:0]nxt;
	reg flag;	
	always@(posedge clk or posedge reset)begin
		if(reset) stat<=0;
		else stat<=nxt;
	end

	always@(*)begin
		case({stat, data})
			{s0, 1'b0}: nxt = s1;
			{s0, 1'b1}: nxt = s0;
			{s1, 1'b0}: nxt = s1;
			{s1, 1'b1}: nxt = s2;	
			{s2, 1'b0}: nxt = s3;
			{s2, 1'b1}: nxt = s0;
			{s3, 1'b0}: nxt = s1;
			{s3, 1'b1}: nxt = s4;
			{s4, 1'b0}: nxt = s5;
			{s4, 1'b1}: nxt = s0;
			{s5, 1'b0}: nxt = s1;
			{s5, 1'b1}: nxt = s6;
			{s6, 1'b0}: nxt = s3;
			{s6, 1'b1}: nxt = s7;
			{s7, 1'b0}: nxt = s5;
			{s7, 1'b1}: nxt = s8;
			default : nxt = s0;
		endcase
	end
	always@(*)begin
		if(stat == s8) begin
			flag = 1'b1;
		end
		else begin
			flag = 1'b0;
		end
	end	
endmodule
