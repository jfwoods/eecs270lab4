module fullAdder(a, b, inC, ouC, s);
input a, b, inC;
output ouC, s;

assign s = a ^ b ^ inC;
assign ouC = (a&b) | (a ^ b)&inC;
endmodule

module twosComp(X, R);
    input [3:0] X;
    output [3:0] R;
    wire [3:0] xInv;
    assign xInv[3:0] = ~X[3:0];
    wire ovf;
    ADDER add1(X, 4b'0001, R, ovf);
endmodule


module ADDER(X, Y, R, ovf);
input [3:0] X;
input [3:0] Y;
output [3:0] R;
output ovf;

wire c01, c12, c23; //first num is CIN, 2nd is COUT
wire cin;

fullAdder add0(X[0], Y[0], cin, c01, R[0]);
fullAdder add1(X[1], Y[1], c01, c12, R[1]);
fullAdder add2(X[2], Y[2], c12, c23, R[2]);
fullAdder add3(X[3], Y[3], c23, ovf, R[3]);

endmodule

module absVal(A, R);
input [3:0] A;
output [3:0] R;

wire sign; assign sign = A[3]; //if 0, R = A. if 1, invert A and add 4b'0001 
wire [3:0] twoComp;
twosComp twoC(A, twoComp);

assign R = sign ? twoComp : A;
endmodule