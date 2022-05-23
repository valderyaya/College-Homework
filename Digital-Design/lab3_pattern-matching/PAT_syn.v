/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : R-2020.09
// Date      : Tue May 24 01:06:12 2022
/////////////////////////////////////////////////////////////


module PAT ( clk, reset, data, flag );
  input clk, reset, data;
  output flag;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100;
  wire   [3:0] stat;
  wire   [3:0] nxt;

  \**SEQGEN**  \stat_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N24), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \stat_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N23), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \stat_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N22), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \stat_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N21), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_AND2 C21 ( .A(N25), .B(N26), .Z(N29) );
  GTECH_AND2 C22 ( .A(N27), .B(N28), .Z(N30) );
  GTECH_AND2 C23 ( .A(N29), .B(N30), .Z(N31) );
  GTECH_OR2 C25 ( .A(stat[2]), .B(stat[1]), .Z(N32) );
  GTECH_OR2 C26 ( .A(stat[0]), .B(N28), .Z(N33) );
  GTECH_OR2 C27 ( .A(N32), .B(N33), .Z(N34) );
  GTECH_OR2 C30 ( .A(stat[2]), .B(stat[1]), .Z(N36) );
  GTECH_OR2 C31 ( .A(N27), .B(data), .Z(N37) );
  GTECH_OR2 C32 ( .A(N36), .B(N37), .Z(N38) );
  GTECH_OR2 C36 ( .A(stat[2]), .B(stat[1]), .Z(N40) );
  GTECH_OR2 C37 ( .A(N27), .B(N28), .Z(N41) );
  GTECH_OR2 C38 ( .A(N40), .B(N41), .Z(N42) );
  GTECH_OR2 C41 ( .A(stat[2]), .B(N26), .Z(N44) );
  GTECH_OR2 C42 ( .A(stat[0]), .B(data), .Z(N45) );
  GTECH_OR2 C43 ( .A(N44), .B(N45), .Z(N46) );
  GTECH_OR2 C47 ( .A(stat[2]), .B(N26), .Z(N48) );
  GTECH_OR2 C48 ( .A(stat[0]), .B(N28), .Z(N49) );
  GTECH_OR2 C49 ( .A(N48), .B(N49), .Z(N50) );
  GTECH_OR2 C53 ( .A(stat[2]), .B(N26), .Z(N52) );
  GTECH_OR2 C54 ( .A(N27), .B(data), .Z(N53) );
  GTECH_OR2 C55 ( .A(N52), .B(N53), .Z(N54) );
  GTECH_OR2 C60 ( .A(stat[2]), .B(N26), .Z(N56) );
  GTECH_OR2 C61 ( .A(N27), .B(N28), .Z(N57) );
  GTECH_OR2 C62 ( .A(N56), .B(N57), .Z(N58) );
  GTECH_OR2 C65 ( .A(N25), .B(stat[1]), .Z(N60) );
  GTECH_OR2 C66 ( .A(stat[0]), .B(data), .Z(N61) );
  GTECH_OR2 C67 ( .A(N60), .B(N61), .Z(N62) );
  GTECH_OR2 C71 ( .A(N25), .B(stat[1]), .Z(N64) );
  GTECH_OR2 C72 ( .A(stat[0]), .B(N28), .Z(N65) );
  GTECH_OR2 C73 ( .A(N64), .B(N65), .Z(N66) );
  GTECH_OR2 C77 ( .A(N25), .B(stat[1]), .Z(N68) );
  GTECH_OR2 C78 ( .A(N27), .B(data), .Z(N69) );
  GTECH_OR2 C79 ( .A(N68), .B(N69), .Z(N70) );
  GTECH_OR2 C84 ( .A(N25), .B(stat[1]), .Z(N72) );
  GTECH_OR2 C85 ( .A(N27), .B(N28), .Z(N73) );
  GTECH_OR2 C86 ( .A(N72), .B(N73), .Z(N74) );
  GTECH_OR2 C90 ( .A(N25), .B(N26), .Z(N76) );
  GTECH_OR2 C91 ( .A(stat[0]), .B(data), .Z(N77) );
  GTECH_OR2 C92 ( .A(N76), .B(N77), .Z(N78) );
  GTECH_OR2 C97 ( .A(N25), .B(N26), .Z(N80) );
  GTECH_OR2 C98 ( .A(stat[0]), .B(N28), .Z(N81) );
  GTECH_OR2 C99 ( .A(N80), .B(N81), .Z(N82) );
  GTECH_OR2 C104 ( .A(N25), .B(N26), .Z(N84) );
  GTECH_OR2 C105 ( .A(N27), .B(data), .Z(N85) );
  GTECH_OR2 C106 ( .A(N84), .B(N85), .Z(N86) );
  GTECH_AND2 C108 ( .A(stat[2]), .B(stat[1]), .Z(N88) );
  GTECH_AND2 C109 ( .A(stat[0]), .B(data), .Z(N89) );
  GTECH_AND2 C110 ( .A(N88), .B(N89), .Z(N90) );
  GTECH_NOT I_0 ( .A(stat[3]), .Z(N96) );
  GTECH_OR2 C160 ( .A(stat[2]), .B(N96), .Z(N97) );
  GTECH_OR2 C161 ( .A(stat[1]), .B(N97), .Z(N98) );
  GTECH_OR2 C162 ( .A(stat[0]), .B(N98), .Z(N99) );
  GTECH_NOT I_1 ( .A(N99), .Z(N100) );
  SELECT_OP C165 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(nxt), .CONTROL1(N0), .CONTROL2(N1), .Z({N24, N23, N22, N21}) );
  GTECH_BUF B_0 ( .A(reset), .Z(N0) );
  GTECH_BUF B_1 ( .A(N20), .Z(N1) );
  SELECT_OP C166 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({1'b0, 1'b0, 1'b0}), 
        .DATA3({1'b0, 1'b0, 1'b1}), .DATA4({1'b0, 1'b1, 1'b0}), .DATA5({1'b0, 
        1'b1, 1'b1}), .DATA6({1'b0, 1'b0, 1'b0}), .DATA7({1'b0, 1'b0, 1'b1}), 
        .DATA8({1'b1, 1'b0, 1'b0}), .DATA9({1'b1, 1'b0, 1'b1}), .DATA10({1'b0, 
        1'b0, 1'b0}), .DATA11({1'b0, 1'b0, 1'b1}), .DATA12({1'b1, 1'b1, 1'b0}), 
        .DATA13({1'b0, 1'b1, 1'b1}), .DATA14({1'b1, 1'b1, 1'b1}), .DATA15({
        1'b1, 1'b0, 1'b1}), .DATA16({1'b0, 1'b0, 1'b0}), .CONTROL1(N2), 
        .CONTROL2(N3), .CONTROL3(N4), .CONTROL4(N5), .CONTROL5(N6), .CONTROL6(
        N7), .CONTROL7(N8), .CONTROL8(N9), .CONTROL9(N10), .CONTROL10(N11), 
        .CONTROL11(N12), .CONTROL12(N13), .CONTROL13(N14), .CONTROL14(N15), 
        .CONTROL15(N16), .CONTROL16(N17), .Z({N93, N92, N91}) );
  GTECH_BUF B_2 ( .A(N31), .Z(N2) );
  GTECH_BUF B_3 ( .A(N35), .Z(N3) );
  GTECH_BUF B_4 ( .A(N39), .Z(N4) );
  GTECH_BUF B_5 ( .A(N43), .Z(N5) );
  GTECH_BUF B_6 ( .A(N47), .Z(N6) );
  GTECH_BUF B_7 ( .A(N51), .Z(N7) );
  GTECH_BUF B_8 ( .A(N55), .Z(N8) );
  GTECH_BUF B_9 ( .A(N59), .Z(N9) );
  GTECH_BUF B_10 ( .A(N63), .Z(N10) );
  GTECH_BUF B_11 ( .A(N67), .Z(N11) );
  GTECH_BUF B_12 ( .A(N71), .Z(N12) );
  GTECH_BUF B_13 ( .A(N75), .Z(N13) );
  GTECH_BUF B_14 ( .A(N79), .Z(N14) );
  GTECH_BUF B_15 ( .A(N83), .Z(N15) );
  GTECH_BUF B_16 ( .A(N87), .Z(N16) );
  GTECH_BUF B_17 ( .A(N90), .Z(N17) );
  SELECT_OP C167 ( .DATA1(1'b0), .DATA2(1'b1), .CONTROL1(N95), .CONTROL2(N17), 
        .Z(N94) );
  SELECT_OP C168 ( .DATA1({N94, N93, N92, N91}), .DATA2({1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N18), .CONTROL2(N19), .Z(nxt) );
  GTECH_BUF B_18 ( .A(N96), .Z(N18) );
  GTECH_BUF B_19 ( .A(stat[3]), .Z(N19) );
  GTECH_NOT I_2 ( .A(reset), .Z(N20) );
  GTECH_NOT I_3 ( .A(stat[2]), .Z(N25) );
  GTECH_NOT I_4 ( .A(stat[1]), .Z(N26) );
  GTECH_NOT I_5 ( .A(stat[0]), .Z(N27) );
  GTECH_NOT I_6 ( .A(data), .Z(N28) );
  GTECH_NOT I_7 ( .A(N34), .Z(N35) );
  GTECH_NOT I_8 ( .A(N38), .Z(N39) );
  GTECH_NOT I_9 ( .A(N42), .Z(N43) );
  GTECH_NOT I_10 ( .A(N46), .Z(N47) );
  GTECH_NOT I_11 ( .A(N50), .Z(N51) );
  GTECH_NOT I_12 ( .A(N54), .Z(N55) );
  GTECH_NOT I_13 ( .A(N58), .Z(N59) );
  GTECH_NOT I_14 ( .A(N62), .Z(N63) );
  GTECH_NOT I_15 ( .A(N66), .Z(N67) );
  GTECH_NOT I_16 ( .A(N70), .Z(N71) );
  GTECH_NOT I_17 ( .A(N74), .Z(N75) );
  GTECH_NOT I_18 ( .A(N78), .Z(N79) );
  GTECH_NOT I_19 ( .A(N82), .Z(N83) );
  GTECH_NOT I_20 ( .A(N86), .Z(N87) );
  GTECH_BUF B_20 ( .A(N100), .Z(flag) );
  GTECH_NOT I_21 ( .A(N90), .Z(N95) );
endmodule

