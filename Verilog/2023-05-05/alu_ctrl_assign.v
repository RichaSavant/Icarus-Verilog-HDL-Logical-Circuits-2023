module full_adder(a, b, cin, sum, cout);
input a, b, cin ;
output sum, cout;
wire w1, w2, w3;
xor g1(w1, a, b);
xor g2(sum, w1, cin);
and g3(w2, a, b);
and g4(w3, w1, cin);
or g5(cout, w2, w3);
endmodule

module add_sub_4bit(a, b, sum, cout, ctrl);
input [3:0] a, b;
input ctrl;
output [3:0] sum;
output cout;
wire [3:0] wb;
wire [2:0] carryw;
xor g1(wb[0], ctrl, b[0]);
xor g2(wb[1], ctrl, b[1]);
xor g3(wb[2], ctrl, b[2]);
xor g4(wb[3], ctrl, b[3]);
full_adder a0(a[0], wb[0], ctrl, sum[0], carryw[0]);
full_adder a1(a[1], wb[1], carryw[0], sum[1], carryw[1]);
full_adder a2(a[2], wb[2], carryw[1], sum[2], carryw[2]);
full_adder a3(a[3], wb[3], carryw[2], sum[3], cout);
endmodule

module logical_unit_4bit(input1, input2, out, ctrl);
input [3:0] input1, input2;
input [1:0] ctrl;
output [3:0] out;
assign out = ctrl[0]?(ctrl[1]?(input1 ^ input2): (input1 | input2)) : (ctrl[1]?(~input1): (input1 & input2));
endmodule

module alu_4bit(operand1, operand2, ALUctrl, out, cout);
input [2:0] ALUctrl;
input [3:0] operand1, operand2;
output [3:0] out;
output cout;
wire [3:0] arith_out, logic_out;
add_sub_4bit a1(operand1, operand2, arith_out, cout, ALUctrl[0]);
logical_unit_4bit l1(operand1, operand2, logic_out, ALUctrl[1:0]);
assign out = ALUctrl[2]?(arith_out):(logic_out);
endmodule

module alu_4bit_tb;
reg [2:0] aluctrl;
reg [3:0] op1, op2;
wire cout;
wire [3:0] out;
alu_4bit a(op1, op2, aluctrl, out, cout);
initial
begin
    op1=4'b0000; op2=4'b0000; aluctrl=3'b000;
    $monitor("Time=%0t, op1=%4b op2=%4b aluctrl=%3b out=%4b cout=%b", $time, op1, op2, aluctrl, out, cout);
    #5 op1=4'b1001; op2=4'b0101; aluctrl=3'b100;
    #5 op1=4'b0001; op2=4'b0100; aluctrl=3'b101;
    #5 op1=4'b1000; op2=4'b1011; aluctrl=3'b000;
    #5 op1=4'b0101; op2=4'b0110; aluctrl=3'b001;
    #5 op1=4'b1011; aluctrl=3'b010;
    #5 op1=4'b1001; op2=4'b1100; aluctrl=3'b011;
    #5 $finish;
end
endmodule