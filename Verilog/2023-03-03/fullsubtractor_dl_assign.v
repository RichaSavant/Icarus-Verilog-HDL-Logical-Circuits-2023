module fullsubtractor_dl(a, b, cin, dif, borrow);
input a, b, cin;
output dif, borrow;
assign dif=a^b^cin;
assign borrow=(cin&(a^~b)|~a&b);
endmodule

module fullsubtractor_tb;
reg p, q, r;
wire d, b;
fullsubtractor_dl f1(p, q, r, d, b);
initial
begin
    p=1'b0;
    q=1'b0;
    r=1'b0;
    $monitor("Time=%0t a=%b b=%b cin=%b dif=%b borrow=%b", $time, p, q, r, d, b);
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