module fullAdder(a, b, inC, ouC, s);
input a, b, inC;
output ouC, s;

assign s = a ^ b ^ inC;
assign ouC = (a&b) + (a ^ b)&inC;
endmodule


module ADDER(A, B, OP, R, ovf);
input [3:0] A, B;
input [2:0] OP;

endmodule

module absVal(A, R, error);
input [3:0] A;
output [3:0] R;
output error;

wire sign; assign sign = A[3]; //if 0, R = A. if 1, invert A and add 4b'0001 

endmodule