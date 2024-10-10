module Calculator(KEY, SW, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX0);
   input [2:0] KEY;
   input [7:0] SW; 
   output [6:0] HEX7, HEX6;
   output [6:0] HEX5, HEX4;
   output [6:0] HEX3, HEX2;
   output [6:0] HEX0; 

//opcode decoding
   wire add, asubb, bsuba, absA, absB;
   assign add = (~KEY[0] & ~KEY[1] & ~KEY[2]) | (~KEY[0] & ~KEY[1] & KEY[2]);
   assign asubb = KEY[0] & ~KEY[1] & ~KEY[2];
   assign bsuba = KEY[0] & ~KEY[1] & KEY[2];
   assign absA = KEY[2] & KEY[1];
   assign absB = ~KEY[2] & KEY[1];

   

endmodule