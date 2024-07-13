module expression(i, y, deout);
input [2:0] i;
output [7:0] y;
output deout;
decoder3to8_dl de(i, y);
assign deout=y[0]|y[4]|y[6]|y[7];
endmodule

module decoder3to8_dl(in, y);
input [2:0] in;
output [7:0] y;
decoder2to4_dl d1(in[1], in[0], in[2], y[7:4]);
decoder2to4_dl d2(in[1], in[0], ~in[2], y[3:0]);
endmodule

module decoder2to4_dl(i1, i0, en, y);
input i1, i0;
input en;
output [3:0] y;
assign y[0] = ~i1&~i0&en;
assign y[1] = ~i1&i0&en;
assign y[2] = i1&~i0&en;
assign y[3] = i1&i0&en;
endmodule

module expression_tb;
reg [2:0] in;
wire [7:0] out;
wire de_out;
expression d1(in, out, de_out);
initial
begin
    in=3'b000;
    $monitor("Time:%0t input=%2b output=%b", $time, in, de_out);
    #5 in=3'b001;
    #5 in=3'b010;
    #5 in=3'b011;
    #5 in=3'b100;
    #5 in=3'b101;
    #5 in=3'b110;
    #5 in=3'b111;
end
endmodule