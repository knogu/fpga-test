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
	// wire w_btn0;
	
	// m_chattering u0(CLK1,BTN[0],w_btn0);
	// assign btn=~w_btn0;
    wire c1,c2;
    m_prescale50000 u0(CLK1, c1);
    m_prescale1000 u1(CLK1, c1, c2);
	assign LED={6'h0,cnt};
	
	always @(posedge c2) begin
		cnt = (cnt+1) < 16 ? cnt+1 : 0;
	end
	
    wire [31:0] mem_out;
    iprom u6(.address(cnt), .clock(CLK1), .q(mem_out));
    assign HEX0 = mem_out[7:0];
	
endmodule
