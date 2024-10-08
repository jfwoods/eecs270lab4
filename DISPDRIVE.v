module numDisp(A, H1, H0); //display 1 4-bit 2's c num

endmodule

module ovfDisp(ovf, H0);
input ovf;
output [6:0] H0;

reg [1:0] vals[6:0]; //1 is E, 0 is off

initial 
begin
    vals[1] = '7b0000110;
    vals[0] = '7b1111111;
end

assign H0 = ovf ? vals[1] : vals[0];
endmodule

module DISPDRIVE(A, B, R, ovf, H7, H6, H5, H4, H2, H0);



endmodule