module demux1to4_dl(din, sel0, sel1, a, b, c, d);
input din, sel0, sel1;
output a, b, c, d;
assign a=(din)&(~sel0)&(~sel1);
assign b=(din)&(~sel0)&(sel1);
assign c=(din)&(sel0)&(~sel1);
assign d=(din)&(sel0)&(sel1);
endmodule

module demux1to4_td;
reg x, s0, s1;
wire w0, w1, w2, w3;
demux1to4_dl mux(x, s0, s1, w0, w1, w2, w3);
initial
begin
    x=1'b1;
    s0=1'b0;
    s1=1'b0;
    $monitor("Time=%0t input=%b a=%b b=%b c=%b d=%b", $time, x, w0, w1, w2, w3);
    #5 x=1'b1; s0=1'b0; s1=1'b1;
    #5 x=1'b1; s0=1'b1; s1=1'b0;
    #5 x=1'b1; s0=1'b1; s1=1'b1;
end
endmodule