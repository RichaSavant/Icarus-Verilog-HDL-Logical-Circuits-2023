module dff(D, clk, Q);
input D, clk;
output Q;
reg Q;
always @(posedge clk)
begin
	Q = D;
end
endmodule

module pipo(in, out, clk);
input [3:0]in;
input clk;
output [3:0]out;
wire [3:0] out;
dff i1(in[0], clk, out[0]);
dff i2(in[1], clk, out[1]);
dff i3(in[2], clk, out[2]);
dff i4(in[3], clk, out[3]);
endmodule

module pipo_tb;
reg [3:0]in;
reg clk;
wire [3:0]out;
pipo i(in, out, clk);
always #5 clk = ~clk;
initial
begin
	in = 4'b1010; clk = 1'b0;
	$monitor("Time:%0t, in:%4b, clk:%b, out:%4b",$time, in, clk, out);
	#10 in = 4'b0101;
    #10 in = 4'b0010;
    #10 in = 4'b0001;
    #10 in = 4'b0000;
	#20 $finish;
end
endmodule