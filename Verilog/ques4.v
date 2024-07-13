//implement T using jk flip flop
module tjk(J,K,clk,T);
input J,K,clk;
output T;
reg T;

always @(posedge clk);
begin
    T=J;
    T=K;
end
endmodule

module tjk_tb;
reg J,K,clk;
wire T;

tjk i(J,K,clk,T);
always #5 clk=~clk;

initial
begin
    J=1'b0;
    K=1'b0;
    clk=1'b0;
    $monitor("Time:%f,J=%b,K=%b,T=%b",$time,J,K,T);
    #5 J=1'b0;K=1'b1;
    #10 J=1'b0;K=1'b1;
    #10 J=1'b0;K=1'b1;
    #10 J=1'b0;K=1'b1;
    #10 $finish; 
end
endmodule
