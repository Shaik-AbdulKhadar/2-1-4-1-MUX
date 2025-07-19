`timescale 1ns/1ps

module Mux_struct_tb;
  reg A, B;
  reg [3:0] D;
  reg S;
  reg [1:0] S4;
  wire Y2, Y4;

  // Instantiate Structural MUX modules
  mux2to1_struct u1(Y2, A, B, S);
  mux4to1_struct u2(Y4, D, S4);

  initial begin
    $display("---- 2:1 MUX STRUCTURAL TEST ----");
    A = 0; B = 1; S = 0; #10;
    $display("S=%b A=%b B=%b | Y=%b", S, A, B, Y2);
    S = 1; #10;
    $display("S=%b A=%b B=%b | Y=%b", S, A, B, Y2);

    $display("\n---- 4:1 MUX STRUCTURAL TEST ----");
    D = 4'b1010;

    S4 = 2'b00; #10;
    $display("S4=%b D=%b | Y=%b", S4, D, Y4);

    S4 = 2'b01; #10;
    $display("S4=%b D=%b | Y=%b", S4, D, Y4);

    S4 = 2'b10; #10;
    $display("S4=%b D=%b | Y=%b", S4, D, Y4);

    S4 = 2'b11; #10;
    $display("S4=%b D=%b | Y=%b", S4, D, Y4);

    $finish;
  end
endmodule
