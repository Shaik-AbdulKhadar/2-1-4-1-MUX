// 2:1 MUX Structural
module mux2to1_struct(output Y, input A, B, S);
  wire nS, w1, w2;

  not (nS, S);
  and (w1, A, nS);
  and (w2, B, S);
  or  (Y, w1, w2);
endmodule

// 4:1 MUX Structural
module mux4to1_struct(output Y, input [3:0] D, input [1:0] S);
  wire [3:0] and_out;
  wire [3:0] select;

  // Selection logic using basic gates
  assign select[0] = ~S[1] & ~S[0];
  assign select[1] = ~S[1] &  S[0];
  assign select[2] =  S[1] & ~S[0];
  assign select[3] =  S[1] &  S[0];

  assign and_out[0] = D[0] & select[0];
  assign and_out[1] = D[1] & select[1];
  assign and_out[2] = D[2] & select[2];
  assign and_out[3] = D[3] & select[3];

  assign Y = and_out[0] | and_out[1] | and_out[2] | and_out[3];
endmodule
