module dff(D, clk, Q, preset, clr);
input D, preset, clk, clr;
output Q;
reg Q;
always @(posedge clk)
	if (preset) begin
		Q = 1;
	end
    else if (clr) begin
        Q = 0;
    end
	else begin
		Q = D;
	end
endmodule

module ring_counter(start, clk, Q);
input start, clk;
output [3:0] Q;
wire preset, clr;
assign preset=~start;
assign clr=~start;
dff i1(Q[0], clk, Q[3], preset, 1'b0);
dff i2(Q[3], clk, Q[2], 1'b0, clr);
dff i3(Q[2], clk, Q[1], 1'b0, clr);
dff i4(Q[1], clk, Q[0], 1'b0, clr);
endmodule

module ring_counter_tb;
reg start, clk;
wire [3:0] Q;
ring_counter i(start, clk, Q);
always #5 clk = ~clk;
initial 
begin
	clk=1'b0; start=1'b0;
	$monitor("Time:%f, clk=%b, Q=%4b", $time, clk, Q);
	#10 start=1'b1;
	#100 $finish;
end
endmodule