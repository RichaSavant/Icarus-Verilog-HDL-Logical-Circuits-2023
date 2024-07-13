module cir_dl(a, b, cin, S, cout);
input a, b, cin;
output S, cout;
wire w1, w2, w3;
assign w1=a ^ b;
assign S=w1 ^ cin;
assign w2=cin & w1;
assign w3=a & b;
assign cout=w2 | w3;
endmodule

module cir_tb;
reg p, q, r;
wire S, C;
cir_dl o1(p, q, r, S, C);
initial
begin
    p=1'b0;
    q=1'b0;
    r=1'b0;
    $monitor("Time:%0t a=%b b=%b cin=%b sum=%b cout=%b", $time, p, q, r, S, C);
    #5 p=1'b0; q=1'b0; r=1'b0;
    #5 p=1'b0; q=1'b0; r=1'b1;
    #5 p=1'b0; q=1'b1; r=1'b0;
    #5 p=1'b0; q=1'b1; r=1'b1;
    #5 p=1'b1; q=1'b0; r=1'b0;
    #5 p=1'b1; q=1'b0; r=1'b1;
    #5 p=1'b1; q=1'b1; r=1'b0;
    #5 p=1'b1; q=1'b1; r=1'b1;
end
endmodule