module xor_dl(a, b, c);
input a, b;
output c;
assign c=a ^ b;
endmodule

module xor_tb;
reg p, q;
wire r;
xor_dl o1(p, q, r);
initial
begin
    p=1'b0;
    q=1'b0;
    $monitor("Time:%0t a=%b b=%b c=%b", $time, p, q, r);
    #5 p=1'b0; q=1'b0;
    #5 p=1'b0; q=1'b1;
    #5 p=1'b1; q=1'b0;
    #5 p=1'b1; q=1'b1;
end
endmodule