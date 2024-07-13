module encoder_8to3(I0, I1, I2, I3, I4, I5, I6, I7, Y0, Y1, Y2);
input I0, I1, I2, I3, I4, I5, I6, I7;
output Y0, Y1, Y2;
or o1(Y0, I0, I2, I4, I6);
or o2(Y1, I1, I2, I4, I5);
or o3(Y2, I4, I5, I6, I7);
endmodule

module encoder_8to3_tb;
reg i0, i1, i2, i3, i4, i5, i6, i7;
wire y0, y1, y2;
encoder_8to3 e1(i0, i1, i2, i3, i4, i5, i6, i7, y0, y1, y2);
initial
begin
    i7=1'b0; i6=1'b0; i5=1'b0; i4=1'b0; i3=1'b0; i2=1'b0; i1=1'b0; i0=1'b1;
    $monitor("Time=%0t, I0=%b, I1=%b, I2=%b, I3=%b, I4=%b, I5=%b, I6=%b, I7=%b, Y0=%b, Y1=%b, Y2=%b", $time, i0, i1, i2, i3, i4, i5, i6, i7, y0, y1, y2);
    #5 i7=1'b0; i6=1'b0; i5=1'b0; i4=1'b1; i3=1'b0; i2=1'b0; i1=1'b0; i0=1'b0;
    #5 i7=1'b0; i6=1'b0; i5=1'b0; i4=1'b0; i3=1'b0; i2=1'b0; i1=1'b0; i0=1'b1;
    #5 i7=1'b0; i6=1'b0; i5=1'b0; i4=1'b0; i3=1'b1; i2=1'b0; i1=1'b0; i0=1'b0;
end
endmodule