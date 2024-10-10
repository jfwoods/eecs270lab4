module numDisp(A, H1, H0); //display 1 4-bit 2's c num
input [3:0] A;
output [6:0] H0;
output [6:0] H1;

reg [6:0] NEG; // "-" character
reg [6:0] CHARS[0:15];

initial
begin
    CHARS[0] = 7'b1000000;
    CHARS[1] = 7'b1111001;
    CHARS[2] = 7'b0100100;
    CHARS[3] = 7'b0110000;
    CHARS[4] = 7'b0011001;
    CHARS[5] = 7'b0010010;
    CHARS[6] = 7'b0000010;
    CHARS[7] = 7'b1111000;
    CHARS[8] = 7'b0000000;
    CHARS[9] = 7'b1111000; //7
    CHARS[10] = 7'b0000010;
    CHARS[11] = 7'b0010010;
    CHARS[12] = 7'b0011001; //4
    CHARS[13] = 7'b0110000;
    CHARS[14] = 7'b0100100;
    CHARS[15] = 7'b1111001; //1
    NEG = 7'b0111111;
end

assign H0 = A[3] ? NEG : 7'b1111111;
assign H1 = CHARS[A];
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

input [3:0] A, B, R;
input ovf;
output [6:0] H7, H6, H5, H4, H2, H0;

ovfDisp overflow(ovf, H0);
numDisp aDisp(A, H7, H6);
numDisp bDisp(B, H5, H4);
numDisp rDisp(R, H3, H2);
endmodule