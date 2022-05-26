/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : R-2020.09
// Date      : Thu May 26 13:58:42 2022
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
         N86, N87, N88, N89, N90, N91, N92, N93;
  wire   [3:0] stat;
  wire   [3:0] nxt;

  \**SEQGEN**  \stat_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(
        nxt[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \stat_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(
        nxt[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \stat_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(
        nxt[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \stat_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(
        nxt[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stat[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_AND2 C25 ( .A(N18), .B(N19), .Z(N22) );
  GTECH_AND2 C26 ( .A(N20), .B(N21), .Z(N23) );
  GTECH_AND2 C27 ( .A(N22), .B(N23), .Z(N24) );
  GTECH_OR2 C29 ( .A(stat[2]), .B(stat[1]), .Z(N25) );
  GTECH_OR2 C30 ( .A(stat[0]), .B(N21), .Z(N26) );
  GTECH_OR2 C31 ( .A(N25), .B(N26), .Z(N27) );
  GTECH_OR2 C34 ( .A(stat[2]), .B(stat[1]), .Z(N29) );
  GTECH_OR2 C35 ( .A(N20), .B(data), .Z(N30) );
  GTECH_OR2 C36 ( .A(N29), .B(N30), .Z(N31) );
  GTECH_OR2 C40 ( .A(stat[2]), .B(stat[1]), .Z(N33) );
  GTECH_OR2 C41 ( .A(N20), .B(N21), .Z(N34) );
  GTECH_OR2 C42 ( .A(N33), .B(N34), .Z(N35) );
  GTECH_OR2 C45 ( .A(stat[2]), .B(N19), .Z(N37) );
  GTECH_OR2 C46 ( .A(stat[0]), .B(data), .Z(N38) );
  GTECH_OR2 C47 ( .A(N37), .B(N38), .Z(N39) );
  GTECH_OR2 C51 ( .A(stat[2]), .B(N19), .Z(N41) );
  GTECH_OR2 C52 ( .A(stat[0]), .B(N21), .Z(N42) );
  GTECH_OR2 C53 ( .A(N41), .B(N42), .Z(N43) );
  GTECH_OR2 C57 ( .A(stat[2]), .B(N19), .Z(N45) );
  GTECH_OR2 C58 ( .A(N20), .B(data), .Z(N46) );
  GTECH_OR2 C59 ( .A(N45), .B(N46), .Z(N47) );
  GTECH_OR2 C64 ( .A(stat[2]), .B(N19), .Z(N49) );
  GTECH_OR2 C65 ( .A(N20), .B(N21), .Z(N50) );
  GTECH_OR2 C66 ( .A(N49), .B(N50), .Z(N51) );
  GTECH_OR2 C69 ( .A(N18), .B(stat[1]), .Z(N53) );
  GTECH_OR2 C70 ( .A(stat[0]), .B(data), .Z(N54) );
  GTECH_OR2 C71 ( .A(N53), .B(N54), .Z(N55) );
  GTECH_OR2 C75 ( .A(N18), .B(stat[1]), .Z(N57) );
  GTECH_OR2 C76 ( .A(stat[0]), .B(N21), .Z(N58) );
  GTECH_OR2 C77 ( .A(N57), .B(N58), .Z(N59) );
  GTECH_OR2 C81 ( .A(N18), .B(stat[1]), .Z(N61) );
  GTECH_OR2 C82 ( .A(N20), .B(data), .Z(N62) );
  GTECH_OR2 C83 ( .A(N61), .B(N62), .Z(N63) );
  GTECH_OR2 C88 ( .A(N18), .B(stat[1]), .Z(N65) );
  GTECH_OR2 C89 ( .A(N20), .B(N21), .Z(N66) );
  GTECH_OR2 C90 ( .A(N65), .B(N66), .Z(N67) );
  GTECH_OR2 C94 ( .A(N18), .B(N19), .Z(N69) );
  GTECH_OR2 C95 ( .A(stat[0]), .B(data), .Z(N70) );
  GTECH_OR2 C96 ( .A(N69), .B(N70), .Z(N71) );
  GTECH_OR2 C101 ( .A(N18), .B(N19), .Z(N73) );
  GTECH_OR2 C102 ( .A(stat[0]), .B(N21), .Z(N74) );
  GTECH_OR2 C103 ( .A(N73), .B(N74), .Z(N75) );
  GTECH_OR2 C108 ( .A(N18), .B(N19), .Z(N77) );
  GTECH_OR2 C109 ( .A(N20), .B(data), .Z(N78) );
  GTECH_OR2 C110 ( .A(N77), .B(N78), .Z(N79) );
  GTECH_AND2 C112 ( .A(stat[2]), .B(stat[1]), .Z(N81) );
  GTECH_AND2 C113 ( .A(stat[0]), .B(data), .Z(N82) );
  GTECH_AND2 C114 ( .A(N81), .B(N82), .Z(N83) );
  GTECH_NOT I_0 ( .A(stat[3]), .Z(N89) );
  GTECH_OR2 C164 ( .A(stat[2]), .B(N89), .Z(N90) );
  GTECH_OR2 C165 ( .A(stat[1]), .B(N90), .Z(N91) );
  GTECH_OR2 C166 ( .A(stat[0]), .B(N91), .Z(N92) );
  GTECH_NOT I_1 ( .A(N92), .Z(N93) );
  SELECT_OP C169 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({1'b0, 1'b0, 1'b0}), 
        .DATA3({1'b0, 1'b0, 1'b1}), .DATA4({1'b0, 1'b1, 1'b0}), .DATA5({1'b0, 
        1'b1, 1'b1}), .DATA6({1'b0, 1'b0, 1'b0}), .DATA7({1'b0, 1'b0, 1'b1}), 
        .DATA8({1'b1, 1'b0, 1'b0}), .DATA9({1'b1, 1'b0, 1'b1}), .DATA10({1'b0, 
        1'b0, 1'b0}), .DATA11({1'b0, 1'b0, 1'b1}), .DATA12({1'b1, 1'b1, 1'b0}), 
        .DATA13({1'b0, 1'b1, 1'b1}), .DATA14({1'b1, 1'b1, 1'b1}), .DATA15({
        1'b1, 1'b0, 1'b1}), .DATA16({1'b0, 1'b0, 1'b0}), .CONTROL1(N0), 
        .CONTROL2(N1), .CONTROL3(N2), .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(
        N5), .CONTROL7(N6), .CONTROL8(N7), .CONTROL9(N8), .CONTROL10(N9), 
        .CONTROL11(N10), .CONTROL12(N11), .CONTROL13(N12), .CONTROL14(N13), 
        .CONTROL15(N14), .CONTROL16(N15), .Z({N86, N85, N84}) );
  GTECH_BUF B_0 ( .A(N24), .Z(N0) );
  GTECH_BUF B_1 ( .A(N28), .Z(N1) );
  GTECH_BUF B_2 ( .A(N32), .Z(N2) );
  GTECH_BUF B_3 ( .A(N36), .Z(N3) );
  GTECH_BUF B_4 ( .A(N40), .Z(N4) );
  GTECH_BUF B_5 ( .A(N44), .Z(N5) );
  GTECH_BUF B_6 ( .A(N48), .Z(N6) );
  GTECH_BUF B_7 ( .A(N52), .Z(N7) );
  GTECH_BUF B_8 ( .A(N56), .Z(N8) );
  GTECH_BUF B_9 ( .A(N60), .Z(N9) );
  GTECH_BUF B_10 ( .A(N64), .Z(N10) );
  GTECH_BUF B_11 ( .A(N68), .Z(N11) );
  GTECH_BUF B_12 ( .A(N72), .Z(N12) );
  GTECH_BUF B_13 ( .A(N76), .Z(N13) );
  GTECH_BUF B_14 ( .A(N80), .Z(N14) );
  GTECH_BUF B_15 ( .A(N83), .Z(N15) );
  SELECT_OP C170 ( .DATA1(1'b0), .DATA2(1'b1), .CONTROL1(N88), .CONTROL2(N15), 
        .Z(N87) );
  SELECT_OP C171 ( .DATA1({N87, N86, N85, N84}), .DATA2({1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N16), .CONTROL2(N17), .Z(nxt) );
  GTECH_BUF B_16 ( .A(N89), .Z(N16) );
  GTECH_BUF B_17 ( .A(stat[3]), .Z(N17) );
  GTECH_NOT I_2 ( .A(stat[2]), .Z(N18) );
  GTECH_NOT I_3 ( .A(stat[1]), .Z(N19) );
  GTECH_NOT I_4 ( .A(stat[0]), .Z(N20) );
  GTECH_NOT I_5 ( .A(data), .Z(N21) );
  GTECH_NOT I_6 ( .A(N27), .Z(N28) );
  GTECH_NOT I_7 ( .A(N31), .Z(N32) );
  GTECH_NOT I_8 ( .A(N35), .Z(N36) );
  GTECH_NOT I_9 ( .A(N39), .Z(N40) );
  GTECH_NOT I_10 ( .A(N43), .Z(N44) );
  GTECH_NOT I_11 ( .A(N47), .Z(N48) );
  GTECH_NOT I_12 ( .A(N51), .Z(N52) );
  GTECH_NOT I_13 ( .A(N55), .Z(N56) );
  GTECH_NOT I_14 ( .A(N59), .Z(N60) );
  GTECH_NOT I_15 ( .A(N63), .Z(N64) );
  GTECH_NOT I_16 ( .A(N67), .Z(N68) );
  GTECH_NOT I_17 ( .A(N71), .Z(N72) );
  GTECH_NOT I_18 ( .A(N75), .Z(N76) );
  GTECH_NOT I_19 ( .A(N79), .Z(N80) );
  GTECH_BUF B_18 ( .A(N93), .Z(flag) );
  GTECH_NOT I_20 ( .A(N83), .Z(N88) );
endmodule

