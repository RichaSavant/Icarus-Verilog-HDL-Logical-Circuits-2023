module mem_op(clk, write_enable, reset, datain, address, dataout, q);
input clk, write_enable, reset;
input [5:0] address;
input [3:0] datain;
output reg [3:0] dataout;
output [3:0] q;
reg [3:0] memory [31:0];
integer i;
always @ (posedge clk)
begin
    if(reset==1)
    begin
        for(i=0; i<31;i++)
        begin
            memory[i]=4'b0000;
        end
    end
    if(write_enable==1)
    begin
        memory[address]=datain;
    end
end
always @ (posedge clk)
begin
    dataout=memory[address];
end
assign q=memory[address];
endmodule

module mem_op_tb;
reg [5:0] addr;
reg [3:0] din;
reg clk, write_enable, rst;
wire [3:0] dout;
wire [3:0] q;
mem_op m1(clk, write_enable, rst, din, addr, dout, q);
always #5 clk=~clk;
initial
begin
    clk=1'b0; rst=1'b1;
    $monitor("Time=%f, clk=%b, rst =%b, write_enable=%b din=%4b, addr=%6b dout=%4b, q=%4b", $time, clk, rst, write_enable, din, addr, dout, q);
    #10 rst=1'b0; write_enable=1'b0; addr=0;
    #10 rst=1'b0; write_enable=1'b1; din=4'b0101; addr=0;
    #10 rst=1'b0; write_enable=1'b1; din=4'b0111; addr=4;
    #10 rst=1'b0; write_enable=1'b0; addr=4;
    #10 rst=1'b0; write_enable=1'b1; din=4'b1010; addr=7;
    #10 rst=1'b0; write_enable=1'b0; addr=7;
    #20 $finish;
end
endmodule