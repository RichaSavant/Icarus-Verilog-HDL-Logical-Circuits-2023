module mux2to1 (a, b, y);
input a, b;
output y;
wire w1, w2, abar, bbar;
not n1(abar, a);
not n2(bbar, b);
and a1(w1, abar, bbar);
and a2(w2, abar, b);
or o1(y, w1, w2);
endmodule

module F_tb;
reg x, y;
wire opt;
mux2to1 m1(x, y, opt);
initial
begin
    x=1'b0;
    y=1'b0;
    $monitor("Time=%0t a=%b b=%b output=%b", $time, x, y, opt);
    #5 x=1'b0; y=1'b1;
    #5 x=1'b1; y=1'b0;
    #5 x=1'b1; y=1'b1;
end
endmodule