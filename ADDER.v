module fullAdder(a, b, inC, ouC, s);
input a, b, inC;
output ouC, s;

assign s = a ^ b ^ inC;
assign ouC = (a&b) | (a ^ b)&inC;
endmodule


module ADDER(V1, V2, R, ovf);
input [3:0] V1, V2;
output [3:0] R;
output ovf;
wire [3:0] A;
wire [3:0] B;

wire c01, c12, c23; //first num is CIN, 2nd is COUT

//Putting vals into buses
assign A = ~bsuba | add ? V1 : V2;
assign B = ~bsuba | add ? V2 : V1;

fullAdder add0(A[0], B[0], ctrl, c01, R[0]);
fullAdder add1(A[1], B[1], c01, c12, R[1]);
fullAdder add2(A[2], B[2], c12, c23, R[2]);
fullAdder add3(A[3], B[3], c23, ovf, R[3]);

endmodule

module absVal(A, R, error);
input [3:0] A;
output [3:0] R;
output error;

wire sign; assign sign = A[3]; //if 0, R = A. if 1, invert A and add 4b'0001 

endmodule