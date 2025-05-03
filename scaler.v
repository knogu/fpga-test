//1/50000 PreScaler
module m_prescale50000(input clk,output c_out);
	reg [15:0] cnt;
	wire wcout;
	
	assign wcout=(cnt==16'd49999) ? 1'b1 : 1'b0;
	assign c_out=wcout;
	
	always @(posedge clk) begin
		if(wcout==1'b1)
			cnt=0;
		else
			cnt=cnt+1;
	end
endmodule	
	

//1/100 PreScaler
module m_prescale1000(input clk,input c_in,output c_out);
	reg [10:0] cnt;
	wire wcout;
	
	assign wcout=(cnt==7'd999) ? 1'b1 : 1'b0;
	assign c_out=(wcout & c_in);
	
	always @(posedge clk) begin
		if(c_in==1'b1) begin
			if(wcout==1'b1)
				cnt=0;
			else
				cnt=cnt+1;
		end
	end
endmodule
