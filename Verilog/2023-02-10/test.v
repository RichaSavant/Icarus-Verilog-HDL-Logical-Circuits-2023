module test(A, B);
input A;
output B;
assign B=A;//dataflow level
endmodule

module Test_tb;
reg A;//input of test bench
wire B;//output of test bench
test T1(A, B);//instantiate(call)
initial
begin
A = 1'b1;//1 bit number of 1
$monitor("Time=%0t A=%b, B=%b", $time, A, B);
#5 A=1'b0;//1 bit number of 0
#5 A=1'b1;//1 bit number of 1
end
endmodule