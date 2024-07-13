module jkff(J, K, clk, Q, reset);
input J, K, clk, reset;
output Q;
reg Q;
always @(posedge clk )
begin
    if(reset==1)
    begin
        Q=1'b0;
    end
    else
    begin
        case({J, K})
            2'b00 : Q=Q;
            2'b01 : Q=0;
            2'b10 : Q=1;
            2'b11 : Q=~Q;
        endcase
    end
end
endmodule

module jk_to_t_tb;
reg T, clk, reset;
wire Q;
jkff j1(T, T, clk, Q, reset);
always #5 clk=~clk;
initial
begin
    T=1'b0; clk=1'b1; reset=1'b1;
    $monitor("Time:%0t T=%b clk=%b Q=%b", $time, T, clk, Q);
    #5 T=1'b0; reset=1'b0;
    #10 T=1'b1;
    #10 T=1'b0;
    #10 T=1'b1;
    #10 T=1'b0;
    #10 T=1'b1;
    #5 $finish;
end
endmodule