// BEGIN ANSOFT HEADER
//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position
// END ANSOFT HEADER

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=26.1086 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=26.1086 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=26.1086 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.973632, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.973632, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.973632, I0:=0 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_4, NAN:=N, NBP:=N0_5, NBN:=N, NCP:=N0_6, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


// BEGIN ANSOFT HEADER
//         Left: N_1 N_2 N_3
//        Right: N_4 N_5
// END ANSOFT HEADER

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  AM       VR1a  N1:=N_1, N2:=N_17  ; 
INTERN  E        BEma  N1:=N_19, N2:=N_17  ( EMF:=N_4.V * N_10.V, PARTDERIV:=1 ); 
INTERN  E        BVa  N1:=N_21, N2:=N_19  ( EMF:=N_23.V*cos(N_8.V) + N_24.V*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIa  N1:=N_21, N2:=GND  ; 
INTERN  VM       VM_Ea  N1:=N_17, N2:=GND  ; 
INTERN  AM       VR1b  N1:=N_2, N2:=N_18  ; 
INTERN  E        BEmb  N1:=N_20, N2:=N_18  ( EMF:=N_4.V * N_11.V, PARTDERIV:=1 ); 
INTERN  E        BVb  N1:=N_22, N2:=N_20  ( EMF:=N_23.V*sin(N_8.V) - N_24.V*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIb  N1:=N_22, N2:=GND  ; 
INTERN  VM       VM_Eb  N1:=N_18, N2:=GND  ; 
INTERN  AM       VR0  N1:=N_3, N2:=N_14  ; 
INTERN  E        BEm0  N1:=GND, N2:=N_14  ( EMF:=N_4.V * N_12.V, PARTDERIV:=1 ); 
INTERN  I        BI1d  N1:=GND, N2:=N_23  ( IS:=VIa.I*cos(N_8.V) + VIb.I*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1d  N1:=N_23, N2:=N_25  ; 
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=1.29197 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.645984, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-1.29197 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.645984, I0:=0 ); 
INTERN  AM       VImq  N1:=N_34, N2:=GND  ; 
INTERN  I        BTm  N1:=GND, N2:=N_4  ( IS:=(VIa.I*N_10.V + VIb.I*N_11.V), PARTDERIV:=1 ); 
INTERN  R        RT  N1:=N_4, N2:=GND  ( R:=1e12 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_7  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_7, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_7, N2:=GND  ; 
INTERN  EV       Ex1  N1:=GND, N2:=N_8  ( QUANT:=VM_Pos.V, FACT:=2 ); 
INTERN  VM       VM_Ex1  N1:=N_8, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  VM       VM_kea  N1:=N_10, N2:=GND  ; 
INTERN  VM       VM_keb  N1:=N_11, N2:=GND  ; 
INTERN  VM       VM_ke0  N1:=N_12, N2:=GND  ; 
INTERN  NDSRC    Pke N0:=N_10, N1:=GND, N2:=N_11, N3:=GND, N4:=N_12, N5:=GND  ( QUANT:={N_8.V}, SRC:={vsrc, vsrc, vsrc}, TableData:="\
.MODEL Setup1_ke_table pwl TABLE=( 361, -2.87979, -2.86234, -2.84489, -2.82743,\
 -2.80998, -2.79253, -2.77507, -2.75762, -2.74017, -2.72271, -2.70526,\
 -2.68781, -2.67035, -2.6529, -2.63545, -2.61799, -2.60054, -2.58309, -2.56563,\
 -2.54818, -2.53073, -2.51327, -2.49582, -2.47837, -2.46091, -2.44346,\
 -2.42601, -2.40855, -2.3911, -2.37365, -2.35619, -2.33874, -2.32129, -2.30383,\
 -2.28638, -2.26893, -2.25147, -2.23402, -2.21657, -2.19911, -2.18166,\
 -2.16421, -2.14675, -2.1293, -2.11185, -2.0944, -2.07694, -2.05949, -2.04204,\
 -2.02458, -2.00713, -1.98968, -1.97222, -1.95477, -1.93732, -1.91986,\
 -1.90241, -1.88496, -1.8675, -1.85005, -1.8326, -1.81514, -1.79769, -1.78024,\
 -1.76278, -1.74533, -1.72788, -1.71042, -1.69297, -1.67552, -1.65806,\
 -1.64061, -1.62316, -1.6057, -1.58825, -1.5708, -1.55334, -1.53589, -1.51844,\
 -1.50098, -1.48353, -1.46608, -1.44862, -1.43117, -1.41372, -1.39626,\
 -1.37881, -1.36136, -1.3439, -1.32645, -1.309, -1.29154, -1.27409, -1.25664,\
 -1.23918, -1.22173, -1.20428, -1.18682, -1.16937, -1.15192, -1.13446,\
 -1.11701, -1.09956, -1.0821, -1.06465, -1.0472, -1.02974, -1.01229, -0.994838,\
 -0.977384, -0.959931, -0.942478, -0.925025, -0.907571, -0.890118, -0.872665,\
 -0.855211, -0.837758, -0.820305, -0.802851, -0.785398, -0.767945, -0.750492,\
 -0.733038, -0.715585, -0.698132, -0.680678, -0.663225, -0.645772, -0.628319,\
 -0.610865, -0.593412, -0.575959, -0.558505, -0.541052, -0.523599, -0.506145,\
 -0.488692, -0.471239, -0.453786, -0.436332, -0.418879, -0.401426, -0.383972,\
 -0.366519, -0.349066, -0.331613, -0.314159, -0.296706, -0.279253, -0.261799,\
 -0.244346, -0.226893, -0.20944, -0.191986, -0.174533, -0.15708, -0.139626,\
 -0.122173, -0.10472, -0.0872665, -0.0698132, -0.0523599, -0.0349066,\
 -0.0174533, 0, 0.0174533, 0.0349066, 0.0523599, 0.0698132, 0.0872665, 0.10472,\
 0.122173, 0.139626, 0.15708, 0.174533, 0.191986, 0.20944, 0.226893, 0.244346,\
 0.261799, 0.279253, 0.296706, 0.314159, 0.331613, 0.349066, 0.366519,\
 0.383972, 0.401426, 0.418879, 0.436332, 0.453786, 0.471239, 0.488692,\
 0.506145, 0.523599, 0.541052, 0.558505, 0.575959, 0.593412, 0.610865,\
 0.628319, 0.645772, 0.663225, 0.680678, 0.698132, 0.715585, 0.733038,\
 0.750492, 0.767945, 0.785398, 0.802851, 0.820305, 0.837758, 0.855211,\
 0.872665, 0.890118, 0.907571, 0.925025, 0.942478, 0.959931, 0.977384,\
 0.994838, 1.01229, 1.02974, 1.0472, 1.06465, 1.0821, 1.09956, 1.11701,\
 1.13446, 1.15192, 1.16937, 1.18682, 1.20428, 1.22173, 1.23918, 1.25664,\
 1.27409, 1.29154, 1.309, 1.32645, 1.3439, 1.36136, 1.37881, 1.39626, 1.41372,\
 1.43117, 1.44862, 1.46608, 1.48353, 1.50098, 1.51844, 1.53589, 1.55334,\
 1.5708, 1.58825, 1.6057, 1.62316, 1.64061, 1.65806, 1.67552, 1.69297, 1.71042,\
 1.72788, 1.74533, 1.76278, 1.78024, 1.79769, 1.81514, 1.8326, 1.85005, 1.8675,\
 1.88496, 1.90241, 1.91986, 1.93732, 1.95477, 1.97222, 1.98968, 2.00713,\
 2.02458, 2.04204, 2.05949, 2.07694, 2.0944, 2.11185, 2.1293, 2.14675, 2.16421,\
 2.18166, 2.19911, 2.21657, 2.23402, 2.25147, 2.26893, 2.28638, 2.30383,\
 2.32129, 2.33874, 2.35619, 2.37365, 2.3911, 2.40855, 2.42601, 2.44346,\
 2.46091, 2.47837, 2.49582, 2.51327, 2.53073, 2.54818, 2.56563, 2.58309,\
 2.60054, 2.61799, 2.63545, 2.6529, 2.67035, 2.68781, 2.70526, 2.72271,\
 2.74017, 2.75762, 2.77507, 2.79253, 2.80998, 2.82743, 2.84489, 2.86234,\
 2.87979, 2.89725, 2.9147, 2.93215, 2.94961, 2.96706, 2.98451, 3.00197,\
 3.01942, 3.03687, 3.05433, 3.07178, 3.08923, 3.10669, 3.12414, 3.14159,\
 3.15905, 3.1765, 3.19395, 3.21141, 3.22886, 3.24631, 3.26377, 3.28122,\
 3.29867, 3.31613, 3.33358, 3.35103, 3.36849, 3.38594, 3.40339, 3, -2.92264,\
 -2.96583, -3.00883, -3.05348, -3.10183, -3.15635, -3.22024, -3.29768,\
 -3.39412, -3.51592, -3.66892, -3.85553, -4.07207, -4.31034, -4.5641, -4.83462,\
 -5.12832, -5.44729, -5.77999, -6.10166, -6.38654, -6.62063, -6.80397,\
 -6.94484, -7.05339, -7.13847, -7.20676, -7.26312, -7.31104, -7.35313,\
 -7.39146, -7.42775, -7.46359, -7.50059, -7.54054, -7.58563, -7.63867,\
 -7.70341, -7.78469, -7.8881, -8.01838, -8.17639, -8.35626, -8.54669, -8.73734,\
 -8.9248, -9.11189, -9.30141, -9.4899, -9.66699, -9.82129, -9.94683, -10.0443,\
 -10.1184, -10.1743, -10.2167, -10.249, -10.2735, -10.2919, -10.3052, -10.3141,\
 -10.319, -10.3199, -10.3166, -10.3086, -10.2948, -10.2736, -10.2425, -10.1981,\
 -10.1365, -10.0555, -9.95719, -9.85206, -9.75762, -9.69242, -9.66925,\
 -9.69242, -9.75762, -9.85206, -9.95719, -10.0555, -10.1365, -10.1981,\
 -10.2425, -10.2736, -10.2948, -10.3086, -10.3166, -10.3199, -10.319, -10.3141,\
 -10.3052, -10.2919, -10.2735, -10.249, -10.2167, -10.1743, -10.1184, -10.0443,\
 -9.94683, -9.82129, -9.66699, -9.4899, -9.30141, -9.11189, -8.9248, -8.73734,\
 -8.54669, -8.35626, -8.17639, -8.01838, -7.8881, -7.78469, -7.70341, -7.63867,\
 -7.58563, -7.54054, -7.50059, -7.46359, -7.42775, -7.39146, -7.35313,\
 -7.31104, -7.26312, -7.20676, -7.13847, -7.05339, -6.94484, -6.80397,\
 -6.62063, -6.38654, -6.10166, -5.77999, -5.44729, -5.12832, -4.83462, -4.5641,\
 -4.31034, -4.07207, -3.85553, -3.66892, -3.51592, -3.39412, -3.29768,\
 -3.22024, -3.15635, -3.10183, -3.05348, -3.00883, -2.96583, -2.92264,\
 -2.87745, -2.82831, -2.77293, -2.70846, -2.6311, -2.53565, -2.41497, -2.25964,\
 -2.05873, -1.80291, -1.4906, -1.13364, -0.754722, -0.374544, 0, 0.374544,\
 0.754722, 1.13364, 1.4906, 1.80291, 2.05873, 2.25964, 2.41497, 2.53565,\
 2.6311, 2.70846, 2.77293, 2.82831, 2.87745, 2.92264, 2.96583, 3.00883,\
 3.05348, 3.10183, 3.15635, 3.22024, 3.29768, 3.39412, 3.51592, 3.66892,\
 3.85553, 4.07207, 4.31034, 4.5641, 4.83462, 5.12832, 5.44729, 5.77999,\
 6.10166, 6.38654, 6.62063, 6.80397, 6.94484, 7.05339, 7.13847, 7.20676,\
 7.26312, 7.31104, 7.35313, 7.39146, 7.42775, 7.46359, 7.50059, 7.54054,\
 7.58563, 7.63867, 7.70341, 7.78469, 7.8881, 8.01838, 8.17639, 8.35626,\
 8.54669, 8.73734, 8.9248, 9.11189, 9.30141, 9.4899, 9.66699, 9.82129, 9.94683,\
 10.0443, 10.1184, 10.1743, 10.2167, 10.249, 10.2735, 10.2919, 10.3052,\
 10.3141, 10.319, 10.3199, 10.3166, 10.3086, 10.2948, 10.2736, 10.2425,\
 10.1981, 10.1365, 10.0555, 9.95719, 9.85206, 9.75762, 9.69242, 9.66925,\
 9.69242, 9.75762, 9.85206, 9.95719, 10.0555, 10.1365, 10.1981, 10.2425,\
 10.2736, 10.2948, 10.3086, 10.3166, 10.3199, 10.319, 10.3141, 10.3052,\
 10.2919, 10.2735, 10.249, 10.2167, 10.1743, 10.1184, 10.0443, 9.94683,\
 9.82129, 9.66699, 9.4899, 9.30141, 9.11189, 8.9248, 8.73734, 8.54669, 8.35626,\
 8.17639, 8.01838, 7.8881, 7.78469, 7.70341, 7.63867, 7.58563, 7.54054,\
 7.50059, 7.46359, 7.42775, 7.39146, 7.35313, 7.31104, 7.26312, 7.20676,\
 7.13847, 7.05339, 6.94484, 6.80397, 6.62063, 6.38654, 6.10166, 5.77999,\
 5.44729, 5.12832, 4.83462, 4.5641, 4.31034, 4.07207, 3.85553, 3.66892,\
 3.51592, 3.39412, 3.29768, 3.22024, 3.15635, 3.10183, 3.05348, 3.00883,\
 2.96583, 2.92264, 2.87745, 2.82831, 2.77293, 2.70846, 2.6311, 2.53565,\
 2.41497, 2.25964, 2.05873, 1.80291, 1.4906, 1.13364, 0.754722, 0.374544, 0,\
 -0.374544, -0.754722, -1.13364, -1.4906, -1.80291, -2.05873, -2.25964,\
 -2.41497, -2.53565, -2.6311, -2.70846, -2.77293, -2.82831, -2.87745, -2.92264,\
 10.2223, 10.203, 10.1792, 10.1497, 10.1125, 10.0651, 10.0038, 9.92313,\
 9.81614, 9.67476, 9.4928, 9.27158, 9.02517, 8.77856, 8.55676, 8.37381,\
 8.23101, 8.12214, 8.0391, 7.97478, 7.92378, 7.88225, 7.84746, 7.81744,\
 7.79069, 7.76604, 7.74251, 7.71922, 7.69533, 7.66998, 7.64224, 7.611, 7.57495,\
 7.53237, 7.481, 7.4177, 7.33811, 7.23613, 7.1037, 6.93142, 6.71124, 6.44184,\
 6.1335, 5.80591, 5.47699, 5.15274, 4.82827, 4.49869, 4.16998, 3.86004, 3.5885,\
 3.36559, 3.18989, 3.05329, 2.94623, 2.8605, 2.7898, 2.72951, 2.67618, 2.62712,\
 2.58007, 2.53301, 2.48388, 2.43044, 2.36999, 2.29908, 2.21308, 2.10569,\
 1.96868, 1.7925, 1.56902, 1.2968, 0.986064, 0.65642, 0.325754, 0, -0.325754,\
 -0.65642, -0.986064, -1.2968, -1.56902, -1.7925, -1.96868, -2.10569, -2.21308,\
 -2.29908, -2.36999, -2.43044, -2.48388, -2.53301, -2.58007, -2.62712,\
 -2.67618, -2.72951, -2.7898, -2.8605, -2.94623, -3.05329, -3.18989, -3.36559,\
 -3.5885, -3.86004, -4.16998, -4.49869, -4.82827, -5.15274, -5.47699, -5.80591,\
 -6.1335, -6.44184, -6.71124, -6.93142, -7.1037, -7.23613, -7.33811, -7.4177,\
 -7.481, -7.53237, -7.57495, -7.611, -7.64224, -7.66998, -7.69533, -7.71922,\
 -7.74251, -7.76604, -7.79069, -7.81744, -7.84746, -7.88225, -7.92378,\
 -7.97478, -8.0391, -8.12214, -8.23101, -8.37381, -8.55676, -8.77856, -9.02517,\
 -9.27158, -9.4928, -9.67476, -9.81614, -9.92313, -10.0038, -10.0651, -10.1125,\
 -10.1497, -10.1792, -10.203, -10.2223, -10.2381, -10.2511, -10.2619, -10.2708,\
 -10.2782, -10.2843, -10.2894, -10.2936, -10.297, -10.2997, -10.3019, -10.3035,\
 -10.3046, -10.3053, -10.3055, -10.3053, -10.3046, -10.3035, -10.3019,\
 -10.2997, -10.297, -10.2936, -10.2894, -10.2843, -10.2782, -10.2708, -10.2619,\
 -10.2511, -10.2381, -10.2223, -10.203, -10.1792, -10.1497, -10.1125, -10.0651,\
 -10.0038, -9.92313, -9.81614, -9.67476, -9.4928, -9.27158, -9.02517, -8.77856,\
 -8.55676, -8.37381, -8.23101, -8.12214, -8.0391, -7.97478, -7.92378, -7.88225,\
 -7.84746, -7.81744, -7.79069, -7.76604, -7.74251, -7.71922, -7.69533,\
 -7.66998, -7.64224, -7.611, -7.57495, -7.53237, -7.481, -7.4177, -7.33811,\
 -7.23613, -7.1037, -6.93142, -6.71124, -6.44184, -6.1335, -5.80591, -5.47699,\
 -5.15274, -4.82827, -4.49869, -4.16998, -3.86004, -3.5885, -3.36559, -3.18989,\
 -3.05329, -2.94623, -2.8605, -2.7898, -2.72951, -2.67618, -2.62712, -2.58007,\
 -2.53301, -2.48388, -2.43044, -2.36999, -2.29908, -2.21308, -2.10569,\
 -1.96868, -1.7925, -1.56902, -1.2968, -0.986064, -0.65642, -0.325754, 0,\
 0.325754, 0.65642, 0.986064, 1.2968, 1.56902, 1.7925, 1.96868, 2.10569,\
 2.21308, 2.29908, 2.36999, 2.43044, 2.48388, 2.53301, 2.58007, 2.62712,\
 2.67618, 2.72951, 2.7898, 2.8605, 2.94623, 3.05329, 3.18989, 3.36559, 3.5885,\
 3.86004, 4.16998, 4.49869, 4.82827, 5.15274, 5.47699, 5.80591, 6.1335,\
 6.44184, 6.71124, 6.93142, 7.1037, 7.23613, 7.33811, 7.4177, 7.481, 7.53237,\
 7.57495, 7.611, 7.64224, 7.66998, 7.69533, 7.71922, 7.74251, 7.76604, 7.79069,\
 7.81744, 7.84746, 7.88225, 7.92378, 7.97478, 8.0391, 8.12214, 8.23101,\
 8.37381, 8.55676, 8.77856, 9.02517, 9.27158, 9.4928, 9.67476, 9.81614,\
 9.92313, 10.0038, 10.0651, 10.1125, 10.1497, 10.1792, 10.203, 10.2223,\
 10.2381, 10.2511, 10.2619, 10.2708, 10.2782, 10.2843, 10.2894, 10.2936,\
 10.297, 10.2997, 10.3019, 10.3035, 10.3046, 10.3053, 10.3055, 10.3053,\
 10.3046, 10.3035, 10.3019, 10.2997, 10.297, 10.2936, 10.2894, 10.2843,\
 10.2782, 10.2708, 10.2619, 10.2511, 10.2381, 10.2223, -1.9442, -1.95075,\
 -1.95174, -1.94687, -1.93534, -1.91569, -1.88557, -1.84144, -1.7785, -1.69138,\
 -1.57665, -1.43761, -1.28889, -1.15531, -1.06308, -1.0303, -1.06308, -1.15531,\
 -1.28889, -1.43761, -1.57665, -1.69138, -1.7785, -1.84144, -1.88557, -1.91569,\
 -1.93534, -1.94687, -1.95174, -1.95075, -1.9442, -1.932, -1.91364, -1.88819,\
 -1.85414, -1.80921, -1.75007, -1.67191, -1.56832, -1.43172, -1.25569,\
 -1.03922, -0.790816, -0.526621, -0.261361, 0, 0.261361, 0.526621, 0.790816,\
 1.03922, 1.25569, 1.43172, 1.56832, 1.67191, 1.75007, 1.80921, 1.85414,\
 1.88819, 1.91364, 1.932, 1.9442, 1.95075, 1.95174, 1.94687, 1.93534, 1.91569,\
 1.88557, 1.84144, 1.7785, 1.69138, 1.57665, 1.43761, 1.28889, 1.15531,\
 1.06308, 1.0303, 1.06308, 1.15531, 1.28889, 1.43761, 1.57665, 1.69138, 1.7785,\
 1.84144, 1.88557, 1.91569, 1.93534, 1.94687, 1.95174, 1.95075, 1.9442, 1.932,\
 1.91364, 1.88819, 1.85414, 1.80921, 1.75007, 1.67191, 1.56832, 1.43172,\
 1.25569, 1.03922, 0.790816, 0.526621, 0.261361, 0, -0.261361, -0.526621,\
 -0.790816, -1.03922, -1.25569, -1.43172, -1.56832, -1.67191, -1.75007,\
 -1.80921, -1.85414, -1.88819, -1.91364, -1.932, -1.9442, -1.95075, -1.95174,\
 -1.94687, -1.93534, -1.91569, -1.88557, -1.84144, -1.7785, -1.69138, -1.57665,\
 -1.43761, -1.28889, -1.15531, -1.06308, -1.0303, -1.06308, -1.15531, -1.28889,\
 -1.43761, -1.57665, -1.69138, -1.7785, -1.84144, -1.88557, -1.91569, -1.93534,\
 -1.94687, -1.95174, -1.95075, -1.9442, -1.932, -1.91364, -1.88819, -1.85414,\
 -1.80921, -1.75007, -1.67191, -1.56832, -1.43172, -1.25569, -1.03922,\
 -0.790816, -0.526621, -0.261361, 0, 0.261361, 0.526621, 0.790816, 1.03922,\
 1.25569, 1.43172, 1.56832, 1.67191, 1.75007, 1.80921, 1.85414, 1.88819,\
 1.91364, 1.932, 1.9442, 1.95075, 1.95174, 1.94687, 1.93534, 1.91569, 1.88557,\
 1.84144, 1.7785, 1.69138, 1.57665, 1.43761, 1.28889, 1.15531, 1.06308, 1.0303,\
 1.06308, 1.15531, 1.28889, 1.43761, 1.57665, 1.69138, 1.7785, 1.84144,\
 1.88557, 1.91569, 1.93534, 1.94687, 1.95174, 1.95075, 1.9442, 1.932, 1.91364,\
 1.88819, 1.85414, 1.80921, 1.75007, 1.67191, 1.56832, 1.43172, 1.25569,\
 1.03922, 0.790816, 0.526621, 0.261361, 0, -0.261361, -0.526621, -0.790816,\
 -1.03922, -1.25569, -1.43172, -1.56832, -1.67191, -1.75007, -1.80921,\
 -1.85414, -1.88819, -1.91364, -1.932, -1.9442, -1.95075, -1.95174, -1.94687,\
 -1.93534, -1.91569, -1.88557, -1.84144, -1.7785, -1.69138, -1.57665, -1.43761,\
 -1.28889, -1.15531, -1.06308, -1.0303, -1.06308, -1.15531, -1.28889, -1.43761,\
 -1.57665, -1.69138, -1.7785, -1.84144, -1.88557, -1.91569, -1.93534, -1.94687,\
 -1.95174, -1.95075, -1.9442, -1.932, -1.91364, -1.88819, -1.85414, -1.80921,\
 -1.75007, -1.67191, -1.56832, -1.43172, -1.25569, -1.03922, -0.790816,\
 -0.526621, -0.261361, 0, 0.261361, 0.526621, 0.790816, 1.03922, 1.25569,\
 1.43172, 1.56832, 1.67191, 1.75007, 1.80921, 1.85414, 1.88819, 1.91364, 1.932,\
 1.9442, 1.95075, 1.95174, 1.94687, 1.93534, 1.91569, 1.88557, 1.84144, 1.7785,\
 1.69138, 1.57665, 1.43761, 1.28889, 1.15531, 1.06308, 1.0303, 1.06308,\
 1.15531, 1.28889, 1.43761, 1.57665, 1.69138, 1.7785, 1.84144, 1.88557,\
 1.91569, 1.93534, 1.94687, 1.95174, 1.95075, 1.9442, 1.932, 1.91364, 1.88819,\
 1.85414, 1.80921, 1.75007, 1.67191, 1.56832, 1.43172, 1.25569, 1.03922,\
 0.790816, 0.526621, 0.261361, 0, -0.261361, -0.526621, -0.790816, -1.03922,\
 -1.25569, -1.43172, -1.56832, -1.67191, -1.75007, -1.80921, -1.85414,\
 -1.88819, -1.91364, -1.932, -1.9442) PERIODIC NOSPLINE" );
}

}