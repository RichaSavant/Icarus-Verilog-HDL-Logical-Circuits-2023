module System(X1, X2, X3, X4, F);
input X1, X2, X3, X4;
output F;
wire [5:0] w;
assign w[0]= X1&X2;
assign w[1]= X3&X4;
assign w[2]= X1|(~X2);
assign w[3]= X4|(~X3);
assign w[4]= (w[0])|(w[1]);
assign w[5]= (w[2])&(w[3]);
assign F= (w[4])|(w[5]);
endmodule

module system_tb;
reg x1, x2, x3, x4;
wire f;
System s1(x1, x2, x3, x4, f);
initial
begin
    x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b0;
    $monitor("Time=%0t, X1=%b, X2=%b, X3=%b, X4=%b, F=%b", $time, x1, x2, x3, x4, f);
    #5 x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b1;
    #5 x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b0;
    #5 x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b1;
end
endmodule