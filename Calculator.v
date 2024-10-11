module Calculator(KEY, SW, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX0);
   input [2:0] KEY;
   input [7:0] SW; 
   output [6:0] HEX7, HEX6;
   output [6:0] HEX5, HEX4;
   output [6:0] HEX3, HEX2;
   output [6:0] HEX0; 

   wire [3:0] A, B;
   assign A[3:0] = SW[7:4];
   assign B[3:0] = SW[3:0];





   

endmodule

module Prefix(KEY, A, B, X, Y, cIN);
   input [2:0] KEY;
   input [3:0] A, B;
   output [3:0] X, Y;
   output cIN;

   //opcode decoding
   wire add, asubb, bsuba, absA, absB, sub, abs;
   assign add = (~KEY[0] & ~KEY[1] & ~KEY[2]) | (~KEY[0] & ~KEY[1] & KEY[2]);
   assign asubb = KEY[0] & ~KEY[1] & ~KEY[2];
   assign bsuba = KEY[0] & ~KEY[1] & KEY[2];
   assign absA = KEY[2] & KEY[1];
   assign absB = ~KEY[2] & KEY[1];
   assign sub = asubb | bsuba;
   assign abs = absA | absB;

   

endmodule