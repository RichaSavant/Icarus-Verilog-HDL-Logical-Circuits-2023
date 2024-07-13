module reg_op(clk, write_enable, rst, ra, rb, rw, busa, busb, busw);
input clk, write_enable, rst;
input [3:0] rw;
input [3:0] busw;
input [3:0] ra, rb;
output reg [3:0] busa, busb;
reg [3:0] register_file [15:0];
integer i;
always @(posedge clk)
begin
    if(rst==1)
    begin
        for(i=0; i<16; i=i+1)
        begin
            register_file[i]=4'b0000;
        end
    end
    if(write_enable==1)
    begin
        register_file[rw]=busw;
    end
    else
    begin
        busa=register_file[ra];
        busb=register_file[rb];
    end
end
endmodule

module register_file_tb;
reg [3:0] ra, rb;
reg [3:0] rw;
reg clk, write_enable, rst;
reg [3:0] busw;
wire [3:0] busa, busb;
reg_op r1(clk, write_enable, rst, ra, rb, rw, busa, busb, busw);
always #5 clk=~clk;
initial
begin
    clk=1'b0; rst=1'b1;
    $monitor("Time=%f, clk=%b, rst =%b, write_enable=%b ra=%4b, rb=%4b rw=%4b busa=%4b, busb=%4b busw=%4b", $time, clk, rst, write_enable, ra, rb, rw, busa, busb, busw);
    #10 rst =1'b0; write_enable=1'b0; ra =4'b0101; rb=4'b1001;
    #10 rst =1'b0; rw=4; write_enable=1'b1; busw=4'b1010;
    #10 rst =1'b0; rw=7; write_enable=1'b1; busw=4'b1111;
    #10 rst =1'b0; write_enable=1'b0; ra =4'b0111; rb=4'b0100;
    #10 rst =1'b0; rw=11; write_enable=1'b1; busw=4'b1011;
    #10 rst =1'b0; write_enable=1'b0; ra =4'b1011; rb=4'b0111;
    #20$finish;
end
endmodule