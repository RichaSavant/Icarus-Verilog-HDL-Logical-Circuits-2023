//3 to 8 decoder using 2 to 4 decoder
module decoder2to4_gl(i0, i1, en, y0, y1, y2, y3);

input i0, i1, en;
output y0, y1, y2, y3;
wire i0bar, i1bar;

not g1(i0bar, i0);
not g2(i1bar, i1);
and g3(y0, i0bar, i1bar, en);
and g4(y1, i0bar, i1, en);
and g5(y2, i0, i1bar, en);
and g6(y3, i0, i1, en);

endmodule

module decoder3to8_g1(i0,i1,i2,en,y0,y1,y2,y3,y4,y5,y6,y7);

input i0,i1,i2,en;
output y0,y1,y2,y3,y4,y5,y6,y7;
wire i0bar,i1bar,i2bar,a,b;

not g9(i2bar,i2);
and g7(a,i2bar,en);
and g8(b,i2,en);


decoder2to4_gl t1(i0,i1,a,y0,y1,y2,y3);
decoder2to4_gl t2(i0,i1,b,y4,y5,y6,y7);

endmodule

module decoder3to8_g1_tb;

reg i0,i1,i2,en;
wire y0,y1,y2,y3,y4,y5,y6,y7;

decoder3to8_g1 t1(i0,i1,i2,en,y0,y1,y2,y3,y4,y5,y6,y7);

initial 

begin
    i0=1'b0;
    i1=1'b0;
    i2=1'b0;
    en=1'b0;
    $monitor("Time=%f,w0=%b,w1=%b,w2=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",$time,i0,i1,i2,y0,y1,y2,y3,y4,y5,y6,y7);
    #5 en=1'b1;i2=1'b0;i1=1'b0;i0=1'b0;
    #5 en=1'b1;i2=1'b0;i1=1'b0;i0=1'b1;
    #5 en=1'b1;i2=1'b0;i1=1'b1;i0=1'b1;
    #5 en=1'b1;i2=1'b1;i1=1'b0;i0=1'b0;
    #5 en=1'b1;i2=1'b1;i1=1'b0;i0=1'b1;
    #5 en=1'b1;i2=1'b1;i1=1'b1;i0=1'b0;
    #5 en=1'b1;i2=1'b1;i1=1'b1;i0=1'b1;
end

endmodule

