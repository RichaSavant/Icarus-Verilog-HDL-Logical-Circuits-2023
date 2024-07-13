//negative edge triggered t flip flop
module tff(T,clk,Q,reset);

input T,clk,reset;
output Q;
reg Q;

always @(negedge clk);
begin 
    if(reset)
    Q=0;
    else 
    begin
        if(T)
        Q=~Q;
        else
        Q=Q;
    end
end 
endmodule