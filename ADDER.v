module fullAdder(a, b, inC, ouC, s);
input a, b, inC;
output ouC, s;

assign s = a ^ b ^ inC;
assign ouC = (a&b) + (a ^ b)&inC;
endmodule


module ADDER(V1, V2, OP, R, ovf);
input [3:0] V1, V2;
input [2:0] OP;
output [3:0] R;
output ovf;
reg [3:0] A;
reg [3:0] B;

wire add, asubb, bsuba, absA, absB;
assign add = (~OP[0] & ~OP[1] & ~OP[2]) | (~OP[0] & ~OP[1] & OP[2]);
assign asubb = OP[0] & ~OP[1] & ~OP[2];
assign bsuba = OP[0] & ~OP[1] & OP[2];
assign absA = OP[2] & OP[1];
assign absB = ~OP[2] & OP[1];


wire ctrl; //1 = subtract, 0 = add
wire c01, c12, c23; //first num is CIN, 2nd is COUT
assign ctrl = ~(add | absA | absB);

//Putting vals into registers
assign A = ~bsuba | add ? V1 : V2;
assign B = ~bsuba | add ? V2 : V1;

reg [3:0] C;
assign C = B ^ ctrl;

fullAdder add0(A[0], C[0], ctrl, c01, R[0]);
fullAdder add1(A[1], C[1], c01, c12, R[1]);
fullAdder add2(A[2], C[2], c12, c23, R[2]);
fullAdder add3(A[3], C[3], c23, ovf, R[3]);
endmodule

module absVal(A, R, error);
input [3:0] A;
output [3:0] R;
output error;

wire sign; assign sign = A[3]; //if 0, R = A. if 1, invert A and add 4b'0001 

endmodule