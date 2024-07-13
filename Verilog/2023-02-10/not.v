module Not(A, B);
input A;
output B;
assign B= !A;
endmodule

module Not_tb;
reg P;
wire Q;
Not n1(P, Q);
initial
begin
P = 1'b0;
$monitor("Time=%0t Input A=%b, Output B=%b", $time, P, Q);
#1 P = 1'b1;
#1 P = 1'b0;
end
endmodule