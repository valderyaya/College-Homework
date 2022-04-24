/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : R-2020.09
// Date      : Sun Apr 24 01:22:17 2022
/////////////////////////////////////////////////////////////


module CLA_4bit ( A, B, Cin, S, Cout );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output Cout;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21;
  wire   [3:0] P;
  wire   [3:0] G;
  wire   [3:1] C;

  GTECH_XOR2 C25 ( .A(A[3]), .B(B[3]), .Z(P[3]) );
  GTECH_XOR2 C26 ( .A(A[2]), .B(B[2]), .Z(P[2]) );
  GTECH_XOR2 C27 ( .A(A[1]), .B(B[1]), .Z(P[1]) );
  GTECH_XOR2 C28 ( .A(A[0]), .B(B[0]), .Z(P[0]) );
  GTECH_AND2 C29 ( .A(A[3]), .B(B[3]), .Z(G[3]) );
  GTECH_AND2 C30 ( .A(A[2]), .B(B[2]), .Z(G[2]) );
  GTECH_AND2 C31 ( .A(A[1]), .B(B[1]), .Z(G[1]) );
  GTECH_AND2 C32 ( .A(A[0]), .B(B[0]), .Z(G[0]) );
  GTECH_AND2 C33 ( .A(P[2]), .B(P[1]), .Z(N0) );
  GTECH_OR2 C34 ( .A(N6), .B(N8), .Z(C[3]) );
  GTECH_OR2 C35 ( .A(N4), .B(N5), .Z(N6) );
  GTECH_OR2 C36 ( .A(G[2]), .B(N3), .Z(N4) );
  GTECH_AND2 C37 ( .A(P[2]), .B(G[1]), .Z(N3) );
  GTECH_AND2 C38 ( .A(N0), .B(G[0]), .Z(N5) );
  GTECH_AND2 C39 ( .A(N7), .B(Cin), .Z(N8) );
  GTECH_AND2 C40 ( .A(N0), .B(P[0]), .Z(N7) );
  GTECH_OR2 C41 ( .A(N10), .B(N12), .Z(C[2]) );
  GTECH_OR2 C42 ( .A(G[1]), .B(N9), .Z(N10) );
  GTECH_AND2 C43 ( .A(P[1]), .B(G[0]), .Z(N9) );
  GTECH_AND2 C44 ( .A(N11), .B(Cin), .Z(N12) );
  GTECH_AND2 C45 ( .A(P[1]), .B(P[0]), .Z(N11) );
  GTECH_OR2 C46 ( .A(G[0]), .B(N13), .Z(C[1]) );
  GTECH_AND2 C47 ( .A(P[0]), .B(Cin), .Z(N13) );
  GTECH_AND2 C48 ( .A(P[3]), .B(P[2]), .Z(N1) );
  GTECH_AND2 C49 ( .A(N1), .B(P[1]), .Z(N2) );
  GTECH_OR2 C50 ( .A(N19), .B(N21), .Z(Cout) );
  GTECH_OR2 C51 ( .A(N17), .B(N18), .Z(N19) );
  GTECH_OR2 C52 ( .A(N15), .B(N16), .Z(N17) );
  GTECH_OR2 C53 ( .A(G[3]), .B(N14), .Z(N15) );
  GTECH_AND2 C54 ( .A(P[3]), .B(G[2]), .Z(N14) );
  GTECH_AND2 C55 ( .A(N1), .B(G[1]), .Z(N16) );
  GTECH_AND2 C56 ( .A(N2), .B(G[0]), .Z(N18) );
  GTECH_AND2 C57 ( .A(N20), .B(Cin), .Z(N21) );
  GTECH_AND2 C58 ( .A(N2), .B(P[0]), .Z(N20) );
  GTECH_XOR2 C59 ( .A(P[3]), .B(C[3]), .Z(S[3]) );
  GTECH_XOR2 C60 ( .A(P[2]), .B(C[2]), .Z(S[2]) );
  GTECH_XOR2 C61 ( .A(P[1]), .B(C[1]), .Z(S[1]) );
  GTECH_XOR2 C62 ( .A(P[0]), .B(Cin), .Z(S[0]) );
endmodule


module Adder_16bit ( A, B, Cin, S, Cout );
  input [15:0] A;
  input [15:0] B;
  output [15:0] S;
  input Cin;
  output Cout;

  wire   [2:0] C;

  CLA_4bit a ( .A(A[3:0]), .B(B[3:0]), .Cin(Cin), .S(S[3:0]), .Cout(C[0]) );
  CLA_4bit b ( .A(A[7:4]), .B(B[7:4]), .Cin(C[0]), .S(S[7:4]), .Cout(C[1]) );
  CLA_4bit c ( .A(A[11:8]), .B(B[11:8]), .Cin(C[1]), .S(S[11:8]), .Cout(C[2])
         );
  CLA_4bit d ( .A(A[15:12]), .B(B[15:12]), .Cin(C[2]), .S(S[15:12]), .Cout(
        Cout) );
endmodule


module ALU ( A, B, Cin, Mode, Y, Cout, Overflow );
  input [15:0] A;
  input [15:0] B;
  input [3:0] Mode;
  output [15:0] Y;
  input Cin;
  output Cout, Overflow;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, C1, C2, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55,
         N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83,
         N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97,
         N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109,
         N110, N111, N112, N113, N114, N115, N116, N117, N118, N119, N120,
         N121, N122, N123, N124, N125, N126, N127, N128, N129, N130, N131,
         N132, N133, N134, N135, N136, N137, N138, N139, N140, N141, N142,
         N143, N144, N145, N146, N147, N148, N149, N150, N151, N152, N153,
         N154, N155, N156, N157, N158, N159, N160, N161, N162, N163, N164,
         N165, N166, N167, N168, N169, N170, N171, N172, N173, N174, N175,
         N176, N177, N178, N179, N180, N181, N182, N183, N184, N185, N186,
         N187, N188, N189, N190, N191, N192, N193, N194, N195, N196, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N206, N207, N208,
         N209, N210, N211, N212, N213, N214, N215, N216, N217, N218, N219,
         N220, N221, N222, N223, N224, N225, N226, N227, N228, N229, N230,
         N231, N232, N233, N234, N235, N236, N237, N238, N239, N240, N241,
         N242, N243, N244, N245, N246, N247, N248, N249, N250, N251, N252,
         N253, N254, N255, N256, N257, N258, N259, N260, N261, N262, N263,
         N264, N265, N266, N267, N268, N269, N270, N271, N272, N273, N274,
         N275, N276, N277, N278, N279, N280, N281, N282, N283, N284, N285,
         N286, N287, N288, N289, N290, N291, N292, N293, N294, N295, N296,
         N297, N298, N299, N300, N301, N302, N303, N304, N305, N306, N307,
         N308, N309, N310, N311, N312, N313, N314, N315, N316, N317, N318,
         N319, N320, N321, N322, N323, N324, N325, N326, N327, N328, N329,
         N330, N331, N332, N333, N334, N335, N336, N337, N338, N339, N340,
         N341, N342, N343, N344, N345, N346, N347, N348, N349, N350, N351,
         N352, N353, N354, N355, N356, N357, N358, N359, N360, N361, N362,
         N363, N364, N365, N366, N367, N368, N369, N370, N371, N372, N373,
         N374, N375, N376, N377, N378, N379, N380, N381, N382, N383, N384,
         N385, N386, N387, N388, N389, N390, N391, N392, N393, N394, N395,
         N396, N397, N398, N399, N400, N401, N402, N403, N404, N405, N406,
         N407;
  wire   [15:0] nB;
  wire   [15:0] Y1;
  wire   [15:0] Y2;

  Adder_16bit adder1 ( .A(A), .B(B), .Cin(Cin), .S(Y1), .Cout(C1) );
  Adder_16bit adder2 ( .A(A), .B(nB), .Cin(1'b0), .S(Y2), .Cout(C2) );
  GTECH_AND2 C41 ( .A(N67), .B(N68), .Z(N71) );
  GTECH_AND2 C42 ( .A(N69), .B(N70), .Z(N72) );
  GTECH_AND2 C43 ( .A(N71), .B(N72), .Z(N73) );
  GTECH_OR2 C45 ( .A(Mode[3]), .B(Mode[2]), .Z(N74) );
  GTECH_OR2 C46 ( .A(Mode[1]), .B(N70), .Z(N75) );
  GTECH_OR2 C47 ( .A(N74), .B(N75), .Z(N76) );
  GTECH_OR2 C51 ( .A(N69), .B(Mode[0]), .Z(N78) );
  GTECH_OR2 C52 ( .A(N74), .B(N78), .Z(N79) );
  GTECH_OR2 C57 ( .A(N69), .B(N70), .Z(N81) );
  GTECH_OR2 C58 ( .A(N74), .B(N81), .Z(N82) );
  GTECH_OR2 C61 ( .A(Mode[3]), .B(N68), .Z(N84) );
  GTECH_OR2 C62 ( .A(Mode[1]), .B(Mode[0]), .Z(N85) );
  GTECH_OR2 C63 ( .A(N84), .B(N85), .Z(N86) );
  GTECH_OR2 C69 ( .A(N84), .B(N75), .Z(N88) );
  GTECH_OR2 C75 ( .A(N84), .B(N78), .Z(N90) );
  GTECH_OR2 C82 ( .A(N84), .B(N81), .Z(N92) );
  GTECH_OR2 C85 ( .A(N67), .B(Mode[2]), .Z(N94) );
  GTECH_OR2 C87 ( .A(N94), .B(N85), .Z(N95) );
  GTECH_OR2 C93 ( .A(N94), .B(N75), .Z(N97) );
  GTECH_OR2 C99 ( .A(N94), .B(N78), .Z(N99) );
  GTECH_OR2 C106 ( .A(N94), .B(N81), .Z(N101) );
  GTECH_OR2 C112 ( .A(N107), .B(N85), .Z(N103) );
  GTECH_OR2 C119 ( .A(N107), .B(N75), .Z(N105) );
  GTECH_OR2 C124 ( .A(N67), .B(N68), .Z(N107) );
  GTECH_OR2 C126 ( .A(N107), .B(N78), .Z(N108) );
  GTECH_AND2 C128 ( .A(Mode[3]), .B(Mode[2]), .Z(N110) );
  GTECH_AND2 C129 ( .A(Mode[1]), .B(Mode[0]), .Z(N111) );
  GTECH_AND2 C130 ( .A(N110), .B(N111), .Z(N112) );
  LT_UNS_OP lt_124 ( .A(A), .B(B), .Z(N200) );
  GTECH_OR2 C245 ( .A(A[15]), .B(N202), .Z(N203) );
  GTECH_OR2 C248 ( .A(A[15]), .B(A[14]), .Z(N206) );
  GTECH_OR2 C249 ( .A(N206), .B(N205), .Z(N207) );
  GTECH_OR2 C252 ( .A(A[15]), .B(A[14]), .Z(N210) );
  GTECH_OR2 C253 ( .A(A[13]), .B(N209), .Z(N211) );
  GTECH_OR2 C254 ( .A(N210), .B(N211), .Z(N212) );
  GTECH_OR2 C257 ( .A(A[15]), .B(A[14]), .Z(N215) );
  GTECH_OR2 C258 ( .A(A[13]), .B(A[12]), .Z(N216) );
  GTECH_OR2 C259 ( .A(N215), .B(N216), .Z(N217) );
  GTECH_OR2 C260 ( .A(N217), .B(N214), .Z(N218) );
  GTECH_OR2 C263 ( .A(A[15]), .B(A[14]), .Z(N221) );
  GTECH_OR2 C264 ( .A(A[13]), .B(A[12]), .Z(N222) );
  GTECH_OR2 C265 ( .A(A[11]), .B(N220), .Z(N223) );
  GTECH_OR2 C266 ( .A(N221), .B(N222), .Z(N224) );
  GTECH_OR2 C267 ( .A(N224), .B(N223), .Z(N225) );
  GTECH_OR2 C270 ( .A(A[15]), .B(A[14]), .Z(N228) );
  GTECH_OR2 C271 ( .A(A[13]), .B(A[12]), .Z(N229) );
  GTECH_OR2 C272 ( .A(A[11]), .B(A[10]), .Z(N230) );
  GTECH_OR2 C273 ( .A(N228), .B(N229), .Z(N231) );
  GTECH_OR2 C274 ( .A(N230), .B(N227), .Z(N232) );
  GTECH_OR2 C275 ( .A(N231), .B(N232), .Z(N233) );
  GTECH_OR2 C278 ( .A(A[15]), .B(A[14]), .Z(N236) );
  GTECH_OR2 C279 ( .A(A[13]), .B(A[12]), .Z(N237) );
  GTECH_OR2 C280 ( .A(A[11]), .B(A[10]), .Z(N238) );
  GTECH_OR2 C281 ( .A(A[9]), .B(N235), .Z(N239) );
  GTECH_OR2 C282 ( .A(N236), .B(N237), .Z(N240) );
  GTECH_OR2 C283 ( .A(N238), .B(N239), .Z(N241) );
  GTECH_OR2 C284 ( .A(N240), .B(N241), .Z(N242) );
  GTECH_OR2 C287 ( .A(A[15]), .B(A[14]), .Z(N245) );
  GTECH_OR2 C288 ( .A(A[13]), .B(A[12]), .Z(N246) );
  GTECH_OR2 C289 ( .A(A[11]), .B(A[10]), .Z(N247) );
  GTECH_OR2 C290 ( .A(A[9]), .B(A[8]), .Z(N248) );
  GTECH_OR2 C291 ( .A(N245), .B(N246), .Z(N249) );
  GTECH_OR2 C292 ( .A(N247), .B(N248), .Z(N250) );
  GTECH_OR2 C293 ( .A(N249), .B(N250), .Z(N251) );
  GTECH_OR2 C294 ( .A(N251), .B(N244), .Z(N252) );
  GTECH_OR2 C297 ( .A(A[15]), .B(A[14]), .Z(N255) );
  GTECH_OR2 C298 ( .A(A[13]), .B(A[12]), .Z(N256) );
  GTECH_OR2 C299 ( .A(A[11]), .B(A[10]), .Z(N257) );
  GTECH_OR2 C300 ( .A(A[9]), .B(A[8]), .Z(N258) );
  GTECH_OR2 C301 ( .A(A[7]), .B(N254), .Z(N259) );
  GTECH_OR2 C302 ( .A(N255), .B(N256), .Z(N260) );
  GTECH_OR2 C303 ( .A(N257), .B(N258), .Z(N261) );
  GTECH_OR2 C304 ( .A(N260), .B(N261), .Z(N262) );
  GTECH_OR2 C305 ( .A(N262), .B(N259), .Z(N263) );
  GTECH_OR2 C308 ( .A(A[15]), .B(A[14]), .Z(N266) );
  GTECH_OR2 C309 ( .A(A[13]), .B(A[12]), .Z(N267) );
  GTECH_OR2 C310 ( .A(A[11]), .B(A[10]), .Z(N268) );
  GTECH_OR2 C311 ( .A(A[9]), .B(A[8]), .Z(N269) );
  GTECH_OR2 C312 ( .A(A[7]), .B(A[6]), .Z(N270) );
  GTECH_OR2 C313 ( .A(N266), .B(N267), .Z(N271) );
  GTECH_OR2 C314 ( .A(N268), .B(N269), .Z(N272) );
  GTECH_OR2 C315 ( .A(N270), .B(N265), .Z(N273) );
  GTECH_OR2 C316 ( .A(N271), .B(N272), .Z(N274) );
  GTECH_OR2 C317 ( .A(N274), .B(N273), .Z(N275) );
  GTECH_OR2 C320 ( .A(A[15]), .B(A[14]), .Z(N278) );
  GTECH_OR2 C321 ( .A(A[13]), .B(A[12]), .Z(N279) );
  GTECH_OR2 C322 ( .A(A[11]), .B(A[10]), .Z(N280) );
  GTECH_OR2 C323 ( .A(A[9]), .B(A[8]), .Z(N281) );
  GTECH_OR2 C324 ( .A(A[7]), .B(A[6]), .Z(N282) );
  GTECH_OR2 C325 ( .A(A[5]), .B(N277), .Z(N283) );
  GTECH_OR2 C326 ( .A(N278), .B(N279), .Z(N284) );
  GTECH_OR2 C327 ( .A(N280), .B(N281), .Z(N285) );
  GTECH_OR2 C328 ( .A(N282), .B(N283), .Z(N286) );
  GTECH_OR2 C329 ( .A(N284), .B(N285), .Z(N287) );
  GTECH_OR2 C330 ( .A(N287), .B(N286), .Z(N288) );
  GTECH_OR2 C333 ( .A(A[15]), .B(A[14]), .Z(N291) );
  GTECH_OR2 C334 ( .A(A[13]), .B(A[12]), .Z(N292) );
  GTECH_OR2 C335 ( .A(A[11]), .B(A[10]), .Z(N293) );
  GTECH_OR2 C336 ( .A(A[9]), .B(A[8]), .Z(N294) );
  GTECH_OR2 C337 ( .A(A[7]), .B(A[6]), .Z(N295) );
  GTECH_OR2 C338 ( .A(A[5]), .B(A[4]), .Z(N296) );
  GTECH_OR2 C339 ( .A(N291), .B(N292), .Z(N297) );
  GTECH_OR2 C340 ( .A(N293), .B(N294), .Z(N298) );
  GTECH_OR2 C341 ( .A(N295), .B(N296), .Z(N299) );
  GTECH_OR2 C342 ( .A(N297), .B(N298), .Z(N300) );
  GTECH_OR2 C343 ( .A(N299), .B(N290), .Z(N301) );
  GTECH_OR2 C344 ( .A(N300), .B(N301), .Z(N302) );
  GTECH_OR2 C347 ( .A(A[15]), .B(A[14]), .Z(N305) );
  GTECH_OR2 C348 ( .A(A[13]), .B(A[12]), .Z(N306) );
  GTECH_OR2 C349 ( .A(A[11]), .B(A[10]), .Z(N307) );
  GTECH_OR2 C350 ( .A(A[9]), .B(A[8]), .Z(N308) );
  GTECH_OR2 C351 ( .A(A[7]), .B(A[6]), .Z(N309) );
  GTECH_OR2 C352 ( .A(A[5]), .B(A[4]), .Z(N310) );
  GTECH_OR2 C353 ( .A(A[3]), .B(N304), .Z(N311) );
  GTECH_OR2 C354 ( .A(N305), .B(N306), .Z(N312) );
  GTECH_OR2 C355 ( .A(N307), .B(N308), .Z(N313) );
  GTECH_OR2 C356 ( .A(N309), .B(N310), .Z(N314) );
  GTECH_OR2 C357 ( .A(N312), .B(N313), .Z(N315) );
  GTECH_OR2 C358 ( .A(N314), .B(N311), .Z(N316) );
  GTECH_OR2 C359 ( .A(N315), .B(N316), .Z(N317) );
  GTECH_OR2 C362 ( .A(A[15]), .B(A[14]), .Z(N320) );
  GTECH_OR2 C363 ( .A(A[13]), .B(A[12]), .Z(N321) );
  GTECH_OR2 C364 ( .A(A[11]), .B(A[10]), .Z(N322) );
  GTECH_OR2 C365 ( .A(A[9]), .B(A[8]), .Z(N323) );
  GTECH_OR2 C366 ( .A(A[7]), .B(A[6]), .Z(N324) );
  GTECH_OR2 C367 ( .A(A[5]), .B(A[4]), .Z(N325) );
  GTECH_OR2 C368 ( .A(A[3]), .B(A[2]), .Z(N326) );
  GTECH_OR2 C369 ( .A(N320), .B(N321), .Z(N327) );
  GTECH_OR2 C370 ( .A(N322), .B(N323), .Z(N328) );
  GTECH_OR2 C371 ( .A(N324), .B(N325), .Z(N329) );
  GTECH_OR2 C372 ( .A(N326), .B(N319), .Z(N330) );
  GTECH_OR2 C373 ( .A(N327), .B(N328), .Z(N331) );
  GTECH_OR2 C374 ( .A(N329), .B(N330), .Z(N332) );
  GTECH_OR2 C375 ( .A(N331), .B(N332), .Z(N333) );
  GTECH_OR2 C378 ( .A(A[15]), .B(A[14]), .Z(N336) );
  GTECH_OR2 C379 ( .A(A[13]), .B(A[12]), .Z(N337) );
  GTECH_OR2 C380 ( .A(A[11]), .B(A[10]), .Z(N338) );
  GTECH_OR2 C381 ( .A(A[9]), .B(A[8]), .Z(N339) );
  GTECH_OR2 C382 ( .A(A[7]), .B(A[6]), .Z(N340) );
  GTECH_OR2 C383 ( .A(A[5]), .B(A[4]), .Z(N341) );
  GTECH_OR2 C384 ( .A(A[3]), .B(A[2]), .Z(N342) );
  GTECH_OR2 C385 ( .A(A[1]), .B(N335), .Z(N343) );
  GTECH_OR2 C386 ( .A(N336), .B(N337), .Z(N344) );
  GTECH_OR2 C387 ( .A(N338), .B(N339), .Z(N345) );
  GTECH_OR2 C388 ( .A(N340), .B(N341), .Z(N346) );
  GTECH_OR2 C389 ( .A(N342), .B(N343), .Z(N347) );
  GTECH_OR2 C390 ( .A(N344), .B(N345), .Z(N348) );
  GTECH_OR2 C391 ( .A(N346), .B(N347), .Z(N349) );
  GTECH_OR2 C392 ( .A(N348), .B(N349), .Z(N350) );
  \**SEQGEN**  Overflow_reg ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N393), .enable(N391), .Q(Overflow), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  Cout_reg ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N392), .enable(N391), .Q(Cout), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[15]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N390), .enable(N374), .Q(Y[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[14]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N389), .enable(N374), .Q(Y[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[13]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N388), .enable(N374), .Q(Y[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[12]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N387), .enable(N374), .Q(Y[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[11]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N386), .enable(N374), .Q(Y[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[10]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N385), .enable(N374), .Q(Y[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[9]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N384), .enable(N374), .Q(Y[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[8]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N383), .enable(N374), .Q(Y[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N382), .enable(N374), .Q(Y[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N381), .enable(N374), .Q(Y[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N380), .enable(N374), .Q(Y[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N379), .enable(N374), .Q(Y[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N378), .enable(N374), .Q(Y[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N377), .enable(N374), .Q(Y[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N376), .enable(N374), .Q(Y[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  \**SEQGEN**  \Y_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(N375), .enable(N374), .Q(Y[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  ASH_UNS_UNS_OP sll_113 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .SH(A[3:0]), .Z({
        N194, N193, N192, N191, N190, N189, N188, N187, N186, N185, N184, N183, 
        N182, N181, N180, N179}) );
  GTECH_NOT I_0 ( .A(B[15]), .Z(N394) );
  GTECH_NOT I_1 ( .A(A[15]), .Z(N395) );
  SUB_UNS_OP sub_52 ( .A(1'b0), .B(B), .Z(nB) );
  SELECT_OP C513 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(N200), .CONTROL1(N0), 
        .CONTROL2(N1), .CONTROL3(N199), .Z(N201) );
  GTECH_BUF B_0 ( .A(N196), .Z(N0) );
  GTECH_BUF B_1 ( .A(N197), .Z(N1) );
  SELECT_OP C514 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b1), .DATA11(1'b1), .DATA12(1'b1), .DATA13(1'b1), .DATA14(
        1'b1), .DATA15(1'b1), .DATA16(1'b1), .DATA17(1'b0), .CONTROL1(N2), 
        .CONTROL2(N3), .CONTROL3(N4), .CONTROL4(N5), .CONTROL5(N6), .CONTROL6(
        N7), .CONTROL7(N8), .CONTROL8(N9), .CONTROL9(N10), .CONTROL10(N11), 
        .CONTROL11(N12), .CONTROL12(N13), .CONTROL13(N14), .CONTROL14(N15), 
        .CONTROL15(N16), .CONTROL16(N17), .CONTROL17(N368), .Z(N369) );
  GTECH_BUF B_2 ( .A(N352), .Z(N2) );
  GTECH_BUF B_3 ( .A(N204), .Z(N3) );
  GTECH_BUF B_4 ( .A(N208), .Z(N4) );
  GTECH_BUF B_5 ( .A(N213), .Z(N5) );
  GTECH_BUF B_6 ( .A(N219), .Z(N6) );
  GTECH_BUF B_7 ( .A(N226), .Z(N7) );
  GTECH_BUF B_8 ( .A(N234), .Z(N8) );
  GTECH_BUF B_9 ( .A(N243), .Z(N9) );
  GTECH_BUF B_10 ( .A(N253), .Z(N10) );
  GTECH_BUF B_11 ( .A(N264), .Z(N11) );
  GTECH_BUF B_12 ( .A(N276), .Z(N12) );
  GTECH_BUF B_13 ( .A(N289), .Z(N13) );
  GTECH_BUF B_14 ( .A(N303), .Z(N14) );
  GTECH_BUF B_15 ( .A(N318), .Z(N15) );
  GTECH_BUF B_16 ( .A(N334), .Z(N16) );
  GTECH_BUF B_17 ( .A(N351), .Z(N17) );
  SELECT_OP C515 ( .DATA1({1'b1, 1'b1, 1'b1, 1'b1}), .DATA2({1'b1, 1'b1, 1'b1, 
        1'b0}), .DATA3({1'b1, 1'b1, 1'b0, 1'b1}), .DATA4({1'b1, 1'b1, 1'b0, 
        1'b0}), .DATA5({1'b1, 1'b0, 1'b1, 1'b1}), .DATA6({1'b1, 1'b0, 1'b1, 
        1'b0}), .DATA7({1'b1, 1'b0, 1'b0, 1'b1}), .DATA8({1'b1, 1'b0, 1'b0, 
        1'b0}), .DATA9({1'b0, 1'b1, 1'b1, 1'b1}), .DATA10({1'b0, 1'b1, 1'b1, 
        1'b0}), .DATA11({1'b0, 1'b1, 1'b0, 1'b1}), .DATA12({1'b0, 1'b1, 1'b0, 
        1'b0}), .DATA13({1'b0, 1'b0, 1'b1, 1'b1}), .DATA14({1'b0, 1'b0, 1'b1, 
        1'b0}), .DATA15({1'b0, 1'b0, 1'b0, 1'b1}), .DATA16({1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .CONTROL4(N5), 
        .CONTROL5(N6), .CONTROL6(N7), .CONTROL7(N8), .CONTROL8(N9), .CONTROL9(
        N10), .CONTROL10(N11), .CONTROL11(N12), .CONTROL12(N13), .CONTROL13(
        N14), .CONTROL14(N15), .CONTROL15(N16), .CONTROL16(N17), .Z({N373, 
        N372, N371, N370}) );
  SELECT_OP C516 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b1), .DATA11(1'b1), .DATA12(1'b1), .DATA13(1'b1), .DATA14(
        1'b1), .DATA15(1'b1), .DATA16(N369), .CONTROL1(N18), .CONTROL2(N19), 
        .CONTROL3(N20), .CONTROL4(N21), .CONTROL5(N22), .CONTROL6(N23), 
        .CONTROL7(N24), .CONTROL8(N25), .CONTROL9(N26), .CONTROL10(N27), 
        .CONTROL11(N28), .CONTROL12(N29), .CONTROL13(N30), .CONTROL14(N31), 
        .CONTROL15(N32), .CONTROL16(N33), .Z(N374) );
  GTECH_BUF B_18 ( .A(N73), .Z(N18) );
  GTECH_BUF B_19 ( .A(N77), .Z(N19) );
  GTECH_BUF B_20 ( .A(N80), .Z(N20) );
  GTECH_BUF B_21 ( .A(N83), .Z(N21) );
  GTECH_BUF B_22 ( .A(N87), .Z(N22) );
  GTECH_BUF B_23 ( .A(N89), .Z(N23) );
  GTECH_BUF B_24 ( .A(N91), .Z(N24) );
  GTECH_BUF B_25 ( .A(N93), .Z(N25) );
  GTECH_BUF B_26 ( .A(N96), .Z(N26) );
  GTECH_BUF B_27 ( .A(N98), .Z(N27) );
  GTECH_BUF B_28 ( .A(N100), .Z(N28) );
  GTECH_BUF B_29 ( .A(N102), .Z(N29) );
  GTECH_BUF B_30 ( .A(N104), .Z(N30) );
  GTECH_BUF B_31 ( .A(N106), .Z(N31) );
  GTECH_BUF B_32 ( .A(N109), .Z(N32) );
  GTECH_BUF B_33 ( .A(N112), .Z(N33) );
  SELECT_OP C517 ( .DATA1({A[14:0], 1'b0}), .DATA2({A[14:0], 1'b0}), .DATA3({
        1'b0, A[15:1]}), .DATA4({A[15], A[15:1]}), .DATA5(Y1), .DATA6(Y2), 
        .DATA7({N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, 
        N125, N126, N127, N128, N129, N130}), .DATA8({N35, N36, N37, N38, N39, 
        N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50}), .DATA9({N131, 
        N132, N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143, 
        N144, N145, N146}), .DATA10({N51, N52, N53, N54, N55, N56, N57, N58, 
        N59, N60, N61, N62, N63, N64, N65, N66}), .DATA11({N147, N148, N149, 
        N150, N151, N152, N153, N154, N155, N156, N157, N158, N159, N160, N161, 
        N162}), .DATA12({N163, N164, N165, N166, N167, N168, N169, N170, N171, 
        N172, N173, N174, N175, N176, N177, N178}), .DATA13({N194, N193, N192, 
        N191, N190, N189, N188, N187, N186, N185, N184, N183, N182, N181, N180, 
        N179}), .DATA14({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, N201}), .DATA15(B), .DATA16({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, N373, 
        N372, N371, N370}), .CONTROL1(N18), .CONTROL2(N19), .CONTROL3(N20), 
        .CONTROL4(N21), .CONTROL5(N22), .CONTROL6(N23), .CONTROL7(N24), 
        .CONTROL8(N25), .CONTROL9(N26), .CONTROL10(N27), .CONTROL11(N28), 
        .CONTROL12(N29), .CONTROL13(N30), .CONTROL14(N31), .CONTROL15(N32), 
        .CONTROL16(N33), .Z({N390, N389, N388, N387, N386, N385, N384, N383, 
        N382, N381, N380, N379, N378, N377, N376, N375}) );
  SELECT_OP C518 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b0), .DATA8(1'b0), .DATA9(1'b0), 
        .DATA10(1'b0), .DATA11(1'b0), .DATA12(1'b0), .DATA13(1'b0), .DATA14(
        1'b0), .DATA15(1'b0), .DATA16(1'b0), .CONTROL1(N18), .CONTROL2(N19), 
        .CONTROL3(N20), .CONTROL4(N21), .CONTROL5(N22), .CONTROL6(N23), 
        .CONTROL7(N24), .CONTROL8(N25), .CONTROL9(N26), .CONTROL10(N27), 
        .CONTROL11(N28), .CONTROL12(N29), .CONTROL13(N30), .CONTROL14(N31), 
        .CONTROL15(N32), .CONTROL16(N33), .Z(N391) );
  SELECT_OP C519 ( .DATA1(C1), .DATA2(C2), .CONTROL1(N22), .CONTROL2(N23), .Z(
        N392) );
  SELECT_OP C520 ( .DATA1(N113), .DATA2(N114), .CONTROL1(N22), .CONTROL2(N23), 
        .Z(N393) );
  GTECH_NOT I_2 ( .A(A[15]), .Z(N34) );
  GTECH_OR2 C524 ( .A(A[15]), .B(B[15]), .Z(N35) );
  GTECH_OR2 C525 ( .A(A[14]), .B(B[14]), .Z(N36) );
  GTECH_OR2 C526 ( .A(A[13]), .B(B[13]), .Z(N37) );
  GTECH_OR2 C527 ( .A(A[12]), .B(B[12]), .Z(N38) );
  GTECH_OR2 C528 ( .A(A[11]), .B(B[11]), .Z(N39) );
  GTECH_OR2 C529 ( .A(A[10]), .B(B[10]), .Z(N40) );
  GTECH_OR2 C530 ( .A(A[9]), .B(B[9]), .Z(N41) );
  GTECH_OR2 C531 ( .A(A[8]), .B(B[8]), .Z(N42) );
  GTECH_OR2 C532 ( .A(A[7]), .B(B[7]), .Z(N43) );
  GTECH_OR2 C533 ( .A(A[6]), .B(B[6]), .Z(N44) );
  GTECH_OR2 C534 ( .A(A[5]), .B(B[5]), .Z(N45) );
  GTECH_OR2 C535 ( .A(A[4]), .B(B[4]), .Z(N46) );
  GTECH_OR2 C536 ( .A(A[3]), .B(B[3]), .Z(N47) );
  GTECH_OR2 C537 ( .A(A[2]), .B(B[2]), .Z(N48) );
  GTECH_OR2 C538 ( .A(A[1]), .B(B[1]), .Z(N49) );
  GTECH_OR2 C539 ( .A(A[0]), .B(B[0]), .Z(N50) );
  GTECH_XOR2 C540 ( .A(A[15]), .B(B[15]), .Z(N51) );
  GTECH_XOR2 C541 ( .A(A[14]), .B(B[14]), .Z(N52) );
  GTECH_XOR2 C542 ( .A(A[13]), .B(B[13]), .Z(N53) );
  GTECH_XOR2 C543 ( .A(A[12]), .B(B[12]), .Z(N54) );
  GTECH_XOR2 C544 ( .A(A[11]), .B(B[11]), .Z(N55) );
  GTECH_XOR2 C545 ( .A(A[10]), .B(B[10]), .Z(N56) );
  GTECH_XOR2 C546 ( .A(A[9]), .B(B[9]), .Z(N57) );
  GTECH_XOR2 C547 ( .A(A[8]), .B(B[8]), .Z(N58) );
  GTECH_XOR2 C548 ( .A(A[7]), .B(B[7]), .Z(N59) );
  GTECH_XOR2 C549 ( .A(A[6]), .B(B[6]), .Z(N60) );
  GTECH_XOR2 C550 ( .A(A[5]), .B(B[5]), .Z(N61) );
  GTECH_XOR2 C551 ( .A(A[4]), .B(B[4]), .Z(N62) );
  GTECH_XOR2 C552 ( .A(A[3]), .B(B[3]), .Z(N63) );
  GTECH_XOR2 C553 ( .A(A[2]), .B(B[2]), .Z(N64) );
  GTECH_XOR2 C554 ( .A(A[1]), .B(B[1]), .Z(N65) );
  GTECH_XOR2 C555 ( .A(A[0]), .B(B[0]), .Z(N66) );
  GTECH_NOT I_3 ( .A(Mode[3]), .Z(N67) );
  GTECH_NOT I_4 ( .A(Mode[2]), .Z(N68) );
  GTECH_NOT I_5 ( .A(Mode[1]), .Z(N69) );
  GTECH_NOT I_6 ( .A(Mode[0]), .Z(N70) );
  GTECH_NOT I_7 ( .A(N76), .Z(N77) );
  GTECH_NOT I_8 ( .A(N79), .Z(N80) );
  GTECH_NOT I_9 ( .A(N82), .Z(N83) );
  GTECH_NOT I_10 ( .A(N86), .Z(N87) );
  GTECH_NOT I_11 ( .A(N88), .Z(N89) );
  GTECH_NOT I_12 ( .A(N90), .Z(N91) );
  GTECH_NOT I_13 ( .A(N92), .Z(N93) );
  GTECH_NOT I_14 ( .A(N95), .Z(N96) );
  GTECH_NOT I_15 ( .A(N97), .Z(N98) );
  GTECH_NOT I_16 ( .A(N99), .Z(N100) );
  GTECH_NOT I_17 ( .A(N101), .Z(N102) );
  GTECH_NOT I_18 ( .A(N103), .Z(N104) );
  GTECH_NOT I_19 ( .A(N105), .Z(N106) );
  GTECH_NOT I_20 ( .A(N108), .Z(N109) );
  GTECH_OR2 C590 ( .A(N398), .B(N401), .Z(N113) );
  GTECH_AND2 C591 ( .A(N396), .B(N397), .Z(N398) );
  GTECH_AND2 C592 ( .A(A[15]), .B(B[15]), .Z(N396) );
  GTECH_NOT I_21 ( .A(Y1[15]), .Z(N397) );
  GTECH_AND2 C594 ( .A(N400), .B(Y1[15]), .Z(N401) );
  GTECH_AND2 C595 ( .A(N34), .B(N399), .Z(N400) );
  GTECH_NOT I_22 ( .A(B[15]), .Z(N399) );
  GTECH_OR2 C597 ( .A(N404), .B(N407), .Z(N114) );
  GTECH_AND2 C598 ( .A(N402), .B(N403), .Z(N404) );
  GTECH_AND2 C599 ( .A(A[15]), .B(nB[15]), .Z(N402) );
  GTECH_NOT I_23 ( .A(Y2[15]), .Z(N403) );
  GTECH_AND2 C601 ( .A(N406), .B(Y2[15]), .Z(N407) );
  GTECH_AND2 C602 ( .A(N34), .B(N405), .Z(N406) );
  GTECH_NOT I_24 ( .A(nB[15]), .Z(N405) );
  GTECH_AND2 C604 ( .A(A[15]), .B(B[15]), .Z(N115) );
  GTECH_AND2 C605 ( .A(A[14]), .B(B[14]), .Z(N116) );
  GTECH_AND2 C606 ( .A(A[13]), .B(B[13]), .Z(N117) );
  GTECH_AND2 C607 ( .A(A[12]), .B(B[12]), .Z(N118) );
  GTECH_AND2 C608 ( .A(A[11]), .B(B[11]), .Z(N119) );
  GTECH_AND2 C609 ( .A(A[10]), .B(B[10]), .Z(N120) );
  GTECH_AND2 C610 ( .A(A[9]), .B(B[9]), .Z(N121) );
  GTECH_AND2 C611 ( .A(A[8]), .B(B[8]), .Z(N122) );
  GTECH_AND2 C612 ( .A(A[7]), .B(B[7]), .Z(N123) );
  GTECH_AND2 C613 ( .A(A[6]), .B(B[6]), .Z(N124) );
  GTECH_AND2 C614 ( .A(A[5]), .B(B[5]), .Z(N125) );
  GTECH_AND2 C615 ( .A(A[4]), .B(B[4]), .Z(N126) );
  GTECH_AND2 C616 ( .A(A[3]), .B(B[3]), .Z(N127) );
  GTECH_AND2 C617 ( .A(A[2]), .B(B[2]), .Z(N128) );
  GTECH_AND2 C618 ( .A(A[1]), .B(B[1]), .Z(N129) );
  GTECH_AND2 C619 ( .A(A[0]), .B(B[0]), .Z(N130) );
  GTECH_NOT I_25 ( .A(A[15]), .Z(N131) );
  GTECH_NOT I_26 ( .A(A[14]), .Z(N132) );
  GTECH_NOT I_27 ( .A(A[13]), .Z(N133) );
  GTECH_NOT I_28 ( .A(A[12]), .Z(N134) );
  GTECH_NOT I_29 ( .A(A[11]), .Z(N135) );
  GTECH_NOT I_30 ( .A(A[10]), .Z(N136) );
  GTECH_NOT I_31 ( .A(A[9]), .Z(N137) );
  GTECH_NOT I_32 ( .A(A[8]), .Z(N138) );
  GTECH_NOT I_33 ( .A(A[7]), .Z(N139) );
  GTECH_NOT I_34 ( .A(A[6]), .Z(N140) );
  GTECH_NOT I_35 ( .A(A[5]), .Z(N141) );
  GTECH_NOT I_36 ( .A(A[4]), .Z(N142) );
  GTECH_NOT I_37 ( .A(A[3]), .Z(N143) );
  GTECH_NOT I_38 ( .A(A[2]), .Z(N144) );
  GTECH_NOT I_39 ( .A(A[1]), .Z(N145) );
  GTECH_NOT I_40 ( .A(A[0]), .Z(N146) );
  GTECH_NOT I_41 ( .A(N51), .Z(N147) );
  GTECH_NOT I_42 ( .A(N52), .Z(N148) );
  GTECH_NOT I_43 ( .A(N53), .Z(N149) );
  GTECH_NOT I_44 ( .A(N54), .Z(N150) );
  GTECH_NOT I_45 ( .A(N55), .Z(N151) );
  GTECH_NOT I_46 ( .A(N56), .Z(N152) );
  GTECH_NOT I_47 ( .A(N57), .Z(N153) );
  GTECH_NOT I_48 ( .A(N58), .Z(N154) );
  GTECH_NOT I_49 ( .A(N59), .Z(N155) );
  GTECH_NOT I_50 ( .A(N60), .Z(N156) );
  GTECH_NOT I_51 ( .A(N61), .Z(N157) );
  GTECH_NOT I_52 ( .A(N62), .Z(N158) );
  GTECH_NOT I_53 ( .A(N63), .Z(N159) );
  GTECH_NOT I_54 ( .A(N64), .Z(N160) );
  GTECH_NOT I_55 ( .A(N65), .Z(N161) );
  GTECH_NOT I_56 ( .A(N66), .Z(N162) );
  GTECH_NOT I_57 ( .A(N35), .Z(N163) );
  GTECH_NOT I_58 ( .A(N36), .Z(N164) );
  GTECH_NOT I_59 ( .A(N37), .Z(N165) );
  GTECH_NOT I_60 ( .A(N38), .Z(N166) );
  GTECH_NOT I_61 ( .A(N39), .Z(N167) );
  GTECH_NOT I_62 ( .A(N40), .Z(N168) );
  GTECH_NOT I_63 ( .A(N41), .Z(N169) );
  GTECH_NOT I_64 ( .A(N42), .Z(N170) );
  GTECH_NOT I_65 ( .A(N43), .Z(N171) );
  GTECH_NOT I_66 ( .A(N44), .Z(N172) );
  GTECH_NOT I_67 ( .A(N45), .Z(N173) );
  GTECH_NOT I_68 ( .A(N46), .Z(N174) );
  GTECH_NOT I_69 ( .A(N47), .Z(N175) );
  GTECH_NOT I_70 ( .A(N48), .Z(N176) );
  GTECH_NOT I_71 ( .A(N49), .Z(N177) );
  GTECH_NOT I_72 ( .A(N50), .Z(N178) );
  GTECH_BUF B_34 ( .A(N104) );
  GTECH_BUF B_35 ( .A(N106), .Z(N195) );
  GTECH_AND2 C670 ( .A(N395), .B(B[15]), .Z(N196) );
  GTECH_AND2 C671 ( .A(A[15]), .B(N394), .Z(N197) );
  GTECH_OR2 C674 ( .A(N197), .B(N196), .Z(N198) );
  GTECH_NOT I_73 ( .A(N198), .Z(N199) );
  GTECH_AND2 C676 ( .A(N195), .B(N199) );
  GTECH_NOT I_74 ( .A(A[14]), .Z(N202) );
  GTECH_NOT I_75 ( .A(N203), .Z(N204) );
  GTECH_NOT I_76 ( .A(A[13]), .Z(N205) );
  GTECH_NOT I_77 ( .A(N207), .Z(N208) );
  GTECH_NOT I_78 ( .A(A[12]), .Z(N209) );
  GTECH_NOT I_79 ( .A(N212), .Z(N213) );
  GTECH_NOT I_80 ( .A(A[11]), .Z(N214) );
  GTECH_NOT I_81 ( .A(N218), .Z(N219) );
  GTECH_NOT I_82 ( .A(A[10]), .Z(N220) );
  GTECH_NOT I_83 ( .A(N225), .Z(N226) );
  GTECH_NOT I_84 ( .A(A[9]), .Z(N227) );
  GTECH_NOT I_85 ( .A(N233), .Z(N234) );
  GTECH_NOT I_86 ( .A(A[8]), .Z(N235) );
  GTECH_NOT I_87 ( .A(N242), .Z(N243) );
  GTECH_NOT I_88 ( .A(A[7]), .Z(N244) );
  GTECH_NOT I_89 ( .A(N252), .Z(N253) );
  GTECH_NOT I_90 ( .A(A[6]), .Z(N254) );
  GTECH_NOT I_91 ( .A(N263), .Z(N264) );
  GTECH_NOT I_92 ( .A(A[5]), .Z(N265) );
  GTECH_NOT I_93 ( .A(N275), .Z(N276) );
  GTECH_NOT I_94 ( .A(A[4]), .Z(N277) );
  GTECH_NOT I_95 ( .A(N288), .Z(N289) );
  GTECH_NOT I_96 ( .A(A[3]), .Z(N290) );
  GTECH_NOT I_97 ( .A(N302), .Z(N303) );
  GTECH_NOT I_98 ( .A(A[2]), .Z(N304) );
  GTECH_NOT I_99 ( .A(N317), .Z(N318) );
  GTECH_NOT I_100 ( .A(A[1]), .Z(N319) );
  GTECH_NOT I_101 ( .A(N333), .Z(N334) );
  GTECH_NOT I_102 ( .A(A[0]), .Z(N335) );
  GTECH_NOT I_103 ( .A(N350), .Z(N351) );
  GTECH_BUF B_36 ( .A(A[15]), .Z(N352) );
  GTECH_OR2 C723 ( .A(N204), .B(N352), .Z(N353) );
  GTECH_OR2 C724 ( .A(N208), .B(N353), .Z(N354) );
  GTECH_OR2 C725 ( .A(N213), .B(N354), .Z(N355) );
  GTECH_OR2 C726 ( .A(N219), .B(N355), .Z(N356) );
  GTECH_OR2 C727 ( .A(N226), .B(N356), .Z(N357) );
  GTECH_OR2 C728 ( .A(N234), .B(N357), .Z(N358) );
  GTECH_OR2 C729 ( .A(N243), .B(N358), .Z(N359) );
  GTECH_OR2 C730 ( .A(N253), .B(N359), .Z(N360) );
  GTECH_OR2 C731 ( .A(N264), .B(N360), .Z(N361) );
  GTECH_OR2 C732 ( .A(N276), .B(N361), .Z(N362) );
  GTECH_OR2 C733 ( .A(N289), .B(N362), .Z(N363) );
  GTECH_OR2 C734 ( .A(N303), .B(N363), .Z(N364) );
  GTECH_OR2 C735 ( .A(N318), .B(N364), .Z(N365) );
  GTECH_OR2 C736 ( .A(N334), .B(N365), .Z(N366) );
  GTECH_OR2 C737 ( .A(N351), .B(N366), .Z(N367) );
  GTECH_NOT I_104 ( .A(N367), .Z(N368) );
endmodule

