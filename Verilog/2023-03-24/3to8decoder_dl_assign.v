module decoder3to8_dl(i, y);
input [2:0] i;
output [7:0] y;
decoder2to4_dl d1(i[1], i[0], i[2], y[7:4]);
decoder2to4_dl d2(i[1], i[0], ~i[2], y[3:0]);
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

module decoder3to8_tb;
reg [2:0] in;
wire [7:0] out;
decoder3to8_dl d1(in, out);
initial
begin
    in=3'b000;
    $monitor("Time:%0t input=%2b output=%8b", $time, in, out);
    #5 in=3'b001;
    #5 in=3'b010;
    #5 in=3'b011;
    #5 in=3'b100;
    #5 in=3'b101;
    #5 in=3'b110;
    #5 in=3'b111;
end
endmodule