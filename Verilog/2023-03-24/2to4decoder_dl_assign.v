module decoder2to4_dl(i, en, y);
input [1:0] i;
input en;
output [3:0] y;
assign y[0] = ~(~i[1]&~i[0]&~en);
assign y[1] = ~(~i[1]&i[0]&~en);
assign y[2] = ~(i[1]&~i[0]&~en);
assign y[3] = ~(i[1]&i[0]&~en);
endmodule

module decoder_tb;
reg [1:0] in;
reg enable;
wire [3:0] out;
decoder2to4_dl d1(in, enable, out);
initial
begin
    in=2'b00; enable=1'b1;
    $monitor("Time:%0t en=%b input=%2b output=%4b", $time, enable, in, out);
    #5 enable=1'b0; in=2'b00;
    #5 enable=1'b0; in=2'b01;
    #5 enable=1'b0; in=2'b10;
    #5 enable=1'b0; in=2'b11;
end
endmodule