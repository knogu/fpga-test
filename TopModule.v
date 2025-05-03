module TopModule(
	//////////// CLOCK //////////
	input 		          		CLK1,
	input 		          		CLK2,
	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,
	//////////// Push Button //////////
	input 		     [1:0]		BTN,
	//////////// LED //////////
	output		     [9:0]		LED,
	//////////// SW //////////
	input 		     [9:0]		SW

	);
	reg [3:0] cnt;
	wire w_btn0;
	wire bnt;
	
	m_chattering u0(CLK1,BTN[0],w_btn0);
	assign btn=~w_btn0;
	assign LED={6'h0,cnt};
	
	always @(posedge btn) begin
		cnt=cnt+1;
	end
	
	iprom u1(.address(cnt+5), .clock(CLK1), .q(HEX0));
    iprom u2(.address(cnt+4), .clock(CLK1), .q(HEX1));
    iprom u3(.address(cnt+3), .clock(CLK1), .q(HEX2));
    iprom u4(.address(cnt+2), .clock(CLK1), .q(HEX3));
    iprom u5(.address(cnt+1), .clock(CLK1), .q(HEX4));
    iprom u6(.address(cnt  ), .clock(CLK1), .q(HEX5));
	
endmodule
