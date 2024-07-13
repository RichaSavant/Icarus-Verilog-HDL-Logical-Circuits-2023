module halfadder_dl(a, b, sum , carry);
input a, b;
output sum, carry;
assign sum = a^b;
assign carry = a&b;
endmodule

module halfadder_tb;
reg x, y;
wire s, cout;
halfadder_dl h1(x, y, s, cout);
initial
begin
    x=1'b0;
    y=1'b0;
    $monitor("Time=%0t a=%b b=%b sum=%b carry=%b", $time, x, y, s, cout);
    #5 x=1'b0; y=1'b0;
    #5 x=1'b0; y=1'b1;
    #5 x=1'b1; y=1'b0;
    #5 x=1'b1; y=1'b1;
end
endmodule