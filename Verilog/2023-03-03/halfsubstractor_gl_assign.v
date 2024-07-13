module halfsubtractor_gl(a, b, dif, borrow);
input a, b;
output dif, borrow;
wire w1;
not n1(w1, a);
xor x1(dif, a, b);
and a1(borrow, w1, b);
endmodule

module halfsubtractor_tb;
reg x, y;
wire d, b;
halfsubtractor_gl h1(x, y, d, b);
initial
begin
    x=1'b0;
    y=1'b0;
    $monitor("Time=%0t a=%b b=%b dif=%b borrow=%b", $time, x, y, d, b);
    #5 x=1'b0; y=1'b0;
    #5 x=1'b0; y=1'b1;
    #5 x=1'b1; y=1'b0;
    #5 x=1'b1; y=1'b1;
end
endmodule