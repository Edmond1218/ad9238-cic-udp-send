-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from filter_0002_rtl_core
-- VHDL created on Tue Jul 26 11:08:33 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity filter_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(37 downto 0);  -- sfix38
        clk : in std_logic;
        areset : in std_logic
    );
end filter_0002_rtl_core;

architecture normal of filter_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr13_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr14_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr19_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr20_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr21_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr22_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr23_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr24_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr25_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr25_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr26_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr27_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr28_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr29_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr30_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr31_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr33_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr34_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr35_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr36_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr36_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr37_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr37_q_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr38_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr39_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr40_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr41_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr42_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr43_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr44_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr45_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr46_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr47_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr48_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr49_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr49_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr50_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr50_q_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_cm19_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm20_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm21_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm24_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_46_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_46_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_46_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_46_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_46_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_43_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_43_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_43_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_43_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_43_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_42_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_42_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_42_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_42_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_42_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_41_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_41_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_41_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_41_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_41_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_38_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_38_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_38_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_38_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_38_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_35_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_34_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_34_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_34_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_34_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_34_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_s1 : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_33_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_s1 : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_32_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_31_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_30_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_30_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_30_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_30_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_30_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_29_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_26_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_26_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_26_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_26_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_26_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_24_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_21_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_20_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_s1 : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_19_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_s1 : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_18_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_s1 : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_17_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_16_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_s1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_15_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_a0 : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_7_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_7_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_7_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_7_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_8_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_8_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_8_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_8_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_9_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_11_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_11_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_11_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_11_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_12_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_12_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_12_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_12_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_13_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_13_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_13_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_13_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_14_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_14_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_14_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_14_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_15_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_15_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_15_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_15_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add0_16_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_16_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_16_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_16_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_17_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_17_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_17_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_17_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add0_18_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_18_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_18_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_18_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_19_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_19_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_19_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_19_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_20_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_20_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_20_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_20_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_21_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_21_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_21_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_21_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add0_22_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_22_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_22_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_22_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_23_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_23_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_23_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_23_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add0_24_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_24_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_24_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add0_24_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add1_4_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_4_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_4_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_4_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_6_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_6_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_6_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_6_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_7_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_7_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_7_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_7_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add1_8_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_8_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_8_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_8_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add1_9_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_9_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_9_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_9_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_10_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_10_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_10_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_10_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_add1_11_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_11_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_11_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_11_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_12_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_12_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_12_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add1_12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_add2_2_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_2_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_2_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_2_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_3_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_3_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_3_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_3_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add2_4_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_4_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_4_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_4_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add2_5_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_5_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_5_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add2_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_add3_1_a : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add3_1_b : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add3_1_o : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add3_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add3_2_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add3_2_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add3_2_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add3_2_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_mtree_add4_0_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add4_0_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add4_0_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add4_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add4_1_a : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add4_1_b : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add4_1_o : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add4_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_add5_0_a : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add5_0_b : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add5_0_o : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add5_0_q : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_sub_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_sub_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_5_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_5_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_5_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_sub_5_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_sub_5_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_sub_5_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_sub_5_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_sub_5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_add_3_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_add_3_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_add_3_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_add_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_add_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_add_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_add_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_add_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_5_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_5_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_5_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_sub_5_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_5_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_5_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_5_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_5_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_5_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_a : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_o : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_add_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_5_a : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_5_b : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_5_o : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_sub_5_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_sub_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_3_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_3_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_3_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_add_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_3_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_3_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_3_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_3_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_5_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_5_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_5_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_5_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_5_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_5_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_5_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_3_a : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_3_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_3_o : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_sub_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_50_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_37_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_37_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_shift2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_shift2_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_shift0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_shift0_qint : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_shift2_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift2_qint : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift2_qint : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_49_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_48_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_47_shift6_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_45_shift6_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift6_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_44_shift6_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_shift4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_40_shift4_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift4_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift4_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift6_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_39_shift6_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift4_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift4_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift6_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift6_qint : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift4_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift6_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift6_qint : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_shift4_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift4_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift4_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift6_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift6_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift4_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift6_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift6_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift6_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift4_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift6_qint : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift4_qint : STD_LOGIC_VECTOR (24 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_13(DELAY,1088)@10 + 3
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_14(DELAY,1089)@13 + 1
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_14 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_50_shift2(BITSHIFT,233)@14
    u0_m0_wo0_mtree_mult1_50_shift2_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q & "0000000";
    u0_m0_wo0_mtree_mult1_50_shift2_q <= u0_m0_wo0_mtree_mult1_50_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_50_shift0(BITSHIFT,231)@13
    u0_m0_wo0_mtree_mult1_50_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q & "00000";
    u0_m0_wo0_mtree_mult1_50_shift0_q <= u0_m0_wo0_mtree_mult1_50_shift0_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_50_sub_1(SUB,232)@13 + 1
    u0_m0_wo0_mtree_mult1_50_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_50_shift0_q(20)) & u0_m0_wo0_mtree_mult1_50_shift0_q));
    u0_m0_wo0_mtree_mult1_50_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q(15)) & d_u0_m0_wo0_wi0_r0_phasedelay0_q_13_q));
    u0_m0_wo0_mtree_mult1_50_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_50_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_50_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_50_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_50_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_50_sub_1_q <= u0_m0_wo0_mtree_mult1_50_sub_1_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_50_sub_3(SUB,234)@14 + 1
    u0_m0_wo0_mtree_mult1_50_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo0_mtree_mult1_50_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_50_sub_1_q));
    u0_m0_wo0_mtree_mult1_50_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_50_shift2_q(22)) & u0_m0_wo0_mtree_mult1_50_shift2_q));
    u0_m0_wo0_mtree_mult1_50_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_50_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_50_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_50_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_50_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_50_sub_3_q <= u0_m0_wo0_mtree_mult1_50_sub_3_o(23 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_12(DELAY,1090)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr1_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_13(DELAY,1091)@12 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_49_shift2(BITSHIFT,237)@13
    u0_m0_wo0_mtree_mult1_49_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_13_q & "0000000";
    u0_m0_wo0_mtree_mult1_49_shift2_q <= u0_m0_wo0_mtree_mult1_49_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_49_shift0(BITSHIFT,235)@12
    u0_m0_wo0_mtree_mult1_49_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_12_q & "00000";
    u0_m0_wo0_mtree_mult1_49_shift0_q <= u0_m0_wo0_mtree_mult1_49_shift0_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_49_sub_1(SUB,236)@12 + 1
    u0_m0_wo0_mtree_mult1_49_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_49_shift0_q(20)) & u0_m0_wo0_mtree_mult1_49_shift0_q));
    u0_m0_wo0_mtree_mult1_49_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => d_u0_m0_wo0_wi0_r0_delayr1_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr1_q_12_q));
    u0_m0_wo0_mtree_mult1_49_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_49_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_49_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_49_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_49_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_49_sub_1_q <= u0_m0_wo0_mtree_mult1_49_sub_1_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_49_sub_3(SUB,238)@13 + 1
    u0_m0_wo0_mtree_mult1_49_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo0_mtree_mult1_49_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_49_sub_1_q));
    u0_m0_wo0_mtree_mult1_49_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_49_shift2_q(22)) & u0_m0_wo0_mtree_mult1_49_shift2_q));
    u0_m0_wo0_mtree_mult1_49_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_49_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_49_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_49_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_49_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_49_sub_3_q <= u0_m0_wo0_mtree_mult1_49_sub_3_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_49_shift4(BITSHIFT,239)@14
    u0_m0_wo0_mtree_mult1_49_shift4_qint <= u0_m0_wo0_mtree_mult1_49_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_49_shift4_q <= u0_m0_wo0_mtree_mult1_49_shift4_qint(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_48_shift2(BITSHIFT,242)@12
    u0_m0_wo0_mtree_mult1_48_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_12_q & "00";
    u0_m0_wo0_mtree_mult1_48_shift2_q <= u0_m0_wo0_mtree_mult1_48_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_12(DELAY,1092)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr2_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_48_sub_3(SUB,243)@12 + 1
    u0_m0_wo0_mtree_mult1_48_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_12_q));
    u0_m0_wo0_mtree_mult1_48_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_48_shift2_q(17)) & u0_m0_wo0_mtree_mult1_48_shift2_q));
    u0_m0_wo0_mtree_mult1_48_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_48_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_48_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_48_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_48_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_48_sub_3_q <= u0_m0_wo0_mtree_mult1_48_sub_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_48_shift4(BITSHIFT,244)@13
    u0_m0_wo0_mtree_mult1_48_shift4_qint <= u0_m0_wo0_mtree_mult1_48_sub_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_48_shift4_q <= u0_m0_wo0_mtree_mult1_48_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_48_shift0(BITSHIFT,240)@12
    u0_m0_wo0_mtree_mult1_48_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_12_q & "0000";
    u0_m0_wo0_mtree_mult1_48_shift0_q <= u0_m0_wo0_mtree_mult1_48_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_48_add_1(ADD,241)@12 + 1
    u0_m0_wo0_mtree_mult1_48_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => d_u0_m0_wo0_wi0_r0_delayr2_q_12_q(15)) & d_u0_m0_wo0_wi0_r0_delayr2_q_12_q));
    u0_m0_wo0_mtree_mult1_48_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_48_shift0_q(19)) & u0_m0_wo0_mtree_mult1_48_shift0_q));
    u0_m0_wo0_mtree_mult1_48_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_48_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_48_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_48_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_48_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_48_add_1_q <= u0_m0_wo0_mtree_mult1_48_add_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_48_add_5(ADD,245)@13 + 1
    u0_m0_wo0_mtree_mult1_48_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_48_add_1_q(20)) & u0_m0_wo0_mtree_mult1_48_add_1_q));
    u0_m0_wo0_mtree_mult1_48_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_48_shift4_q(25)) & u0_m0_wo0_mtree_mult1_48_shift4_q));
    u0_m0_wo0_mtree_mult1_48_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_48_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_48_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_48_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_48_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_48_add_5_q <= u0_m0_wo0_mtree_mult1_48_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_add0_24(ADD,199)@14 + 1
    u0_m0_wo0_mtree_add0_24_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_48_add_5_q);
    u0_m0_wo0_mtree_add0_24_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => u0_m0_wo0_mtree_mult1_49_shift4_q(24)) & u0_m0_wo0_mtree_mult1_49_shift4_q));
    u0_m0_wo0_mtree_add0_24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_24_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_24_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_24_a) + SIGNED(u0_m0_wo0_mtree_add0_24_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_24_q <= u0_m0_wo0_mtree_add0_24_o(26 downto 0);

    -- u0_m0_wo0_mtree_add1_12(ADD,212)@15 + 1
    u0_m0_wo0_mtree_add1_12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add0_24_q(26)) & u0_m0_wo0_mtree_add0_24_q));
    u0_m0_wo0_mtree_add1_12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 24 => u0_m0_wo0_mtree_mult1_50_sub_3_q(23)) & u0_m0_wo0_mtree_mult1_50_sub_3_q));
    u0_m0_wo0_mtree_add1_12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_12_a) + SIGNED(u0_m0_wo0_mtree_add1_12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_12_q <= u0_m0_wo0_mtree_add1_12_o(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_47_shift2(BITSHIFT,248)@10
    u0_m0_wo0_mtree_mult1_47_shift2_qint <= u0_m0_wo0_wi0_r0_delayr3_q & "00";
    u0_m0_wo0_mtree_mult1_47_shift2_q <= u0_m0_wo0_mtree_mult1_47_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_47_add_3(ADD,249)@10 + 1
    u0_m0_wo0_mtree_mult1_47_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr3_q(15)) & u0_m0_wo0_wi0_r0_delayr3_q));
    u0_m0_wo0_mtree_mult1_47_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_47_shift2_q(17)) & u0_m0_wo0_mtree_mult1_47_shift2_q));
    u0_m0_wo0_mtree_mult1_47_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_47_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_47_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_47_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_47_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_47_add_3_q <= u0_m0_wo0_mtree_mult1_47_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_47_shift4(BITSHIFT,250)@11
    u0_m0_wo0_mtree_mult1_47_shift4_qint <= u0_m0_wo0_mtree_mult1_47_add_3_q & "00000";
    u0_m0_wo0_mtree_mult1_47_shift4_q <= u0_m0_wo0_mtree_mult1_47_shift4_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_47_shift0(BITSHIFT,246)@10
    u0_m0_wo0_mtree_mult1_47_shift0_qint <= u0_m0_wo0_wi0_r0_delayr3_q & "000";
    u0_m0_wo0_mtree_mult1_47_shift0_q <= u0_m0_wo0_mtree_mult1_47_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_47_sub_1(SUB,247)@10 + 1
    u0_m0_wo0_mtree_mult1_47_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_47_shift0_q(18)) & u0_m0_wo0_mtree_mult1_47_shift0_q));
    u0_m0_wo0_mtree_mult1_47_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr3_q(15)) & u0_m0_wo0_wi0_r0_delayr3_q));
    u0_m0_wo0_mtree_mult1_47_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_47_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_47_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_47_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_47_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_47_sub_1_q <= u0_m0_wo0_mtree_mult1_47_sub_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_47_sub_5(SUB,251)@11 + 1
    u0_m0_wo0_mtree_mult1_47_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => u0_m0_wo0_mtree_mult1_47_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_47_sub_1_q));
    u0_m0_wo0_mtree_mult1_47_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_47_shift4_q(23)) & u0_m0_wo0_mtree_mult1_47_shift4_q));
    u0_m0_wo0_mtree_mult1_47_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_47_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_47_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_47_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_47_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_47_sub_5_q <= u0_m0_wo0_mtree_mult1_47_sub_5_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_47_shift6(BITSHIFT,252)@12
    u0_m0_wo0_mtree_mult1_47_shift6_qint <= u0_m0_wo0_mtree_mult1_47_sub_5_q & "00";
    u0_m0_wo0_mtree_mult1_47_shift6_q <= u0_m0_wo0_mtree_mult1_47_shift6_qint(26 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm4(CONSTANT,77)@0
    u0_m0_wo0_cm4_q <= "10001011101";

    -- u0_m0_wo0_mtree_mult1_46(MULT,128)@10 + 2
    u0_m0_wo0_mtree_mult1_46_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_46_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr4_q);
    u0_m0_wo0_mtree_mult1_46_reset <= areset;
    u0_m0_wo0_mtree_mult1_46_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 16,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_46_a0,
        datab => u0_m0_wo0_mtree_mult1_46_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_46_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_46_s1
    );
    u0_m0_wo0_mtree_mult1_46_q <= u0_m0_wo0_mtree_mult1_46_s1;

    -- u0_m0_wo0_mtree_add0_23(ADD,198)@12 + 1
    u0_m0_wo0_mtree_add0_23_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_46_q(26)) & u0_m0_wo0_mtree_mult1_46_q));
    u0_m0_wo0_mtree_add0_23_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_47_shift6_q(26)) & u0_m0_wo0_mtree_mult1_47_shift6_q));
    u0_m0_wo0_mtree_add0_23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_23_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_23_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_23_a) + SIGNED(u0_m0_wo0_mtree_add0_23_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_23_q <= u0_m0_wo0_mtree_add0_23_o(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_45_shift2(BITSHIFT,263)@10
    u0_m0_wo0_mtree_mult1_45_shift2_qint <= u0_m0_wo0_wi0_r0_delayr5_q & "00";
    u0_m0_wo0_mtree_mult1_45_shift2_q <= u0_m0_wo0_mtree_mult1_45_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_45_add_3(ADD,264)@10 + 1
    u0_m0_wo0_mtree_mult1_45_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr5_q(15)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_mtree_mult1_45_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_45_shift2_q(17)) & u0_m0_wo0_mtree_mult1_45_shift2_q));
    u0_m0_wo0_mtree_mult1_45_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_45_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_45_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_45_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_45_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_45_add_3_q <= u0_m0_wo0_mtree_mult1_45_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_45_shift4(BITSHIFT,265)@11
    u0_m0_wo0_mtree_mult1_45_shift4_qint <= u0_m0_wo0_mtree_mult1_45_add_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_45_shift4_q <= u0_m0_wo0_mtree_mult1_45_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_45_shift0(BITSHIFT,261)@10
    u0_m0_wo0_mtree_mult1_45_shift0_qint <= u0_m0_wo0_wi0_r0_delayr5_q & "0000";
    u0_m0_wo0_mtree_mult1_45_shift0_q <= u0_m0_wo0_mtree_mult1_45_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_45_sub_1(SUB,262)@10 + 1
    u0_m0_wo0_mtree_mult1_45_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr5_q(15)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_mtree_mult1_45_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_45_shift0_q(19)) & u0_m0_wo0_mtree_mult1_45_shift0_q));
    u0_m0_wo0_mtree_mult1_45_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_45_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_45_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_45_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_45_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_45_sub_1_q <= u0_m0_wo0_mtree_mult1_45_sub_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_45_sub_5(SUB,266)@11 + 1
    u0_m0_wo0_mtree_mult1_45_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_45_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_45_sub_1_q));
    u0_m0_wo0_mtree_mult1_45_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_45_shift4_q(25)) & u0_m0_wo0_mtree_mult1_45_shift4_q));
    u0_m0_wo0_mtree_mult1_45_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_45_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_45_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_45_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_45_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_45_sub_5_q <= u0_m0_wo0_mtree_mult1_45_sub_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_45_shift6(BITSHIFT,267)@12
    u0_m0_wo0_mtree_mult1_45_shift6_qint <= u0_m0_wo0_mtree_mult1_45_sub_5_q & "0";
    u0_m0_wo0_mtree_mult1_45_shift6_q <= u0_m0_wo0_mtree_mult1_45_shift6_qint(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_44_shift2(BITSHIFT,270)@10
    u0_m0_wo0_mtree_mult1_44_shift2_qint <= u0_m0_wo0_wi0_r0_delayr6_q & "000";
    u0_m0_wo0_mtree_mult1_44_shift2_q <= u0_m0_wo0_mtree_mult1_44_shift2_qint(18 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_44_sub_3(SUB,271)@10 + 1
    u0_m0_wo0_mtree_mult1_44_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr6_q(15)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo0_mtree_mult1_44_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_44_shift2_q(18)) & u0_m0_wo0_mtree_mult1_44_shift2_q));
    u0_m0_wo0_mtree_mult1_44_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_44_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_44_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_44_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_44_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_44_sub_3_q <= u0_m0_wo0_mtree_mult1_44_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_44_shift4(BITSHIFT,272)@11
    u0_m0_wo0_mtree_mult1_44_shift4_qint <= u0_m0_wo0_mtree_mult1_44_sub_3_q & "000000";
    u0_m0_wo0_mtree_mult1_44_shift4_q <= u0_m0_wo0_mtree_mult1_44_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_44_shift0(BITSHIFT,268)@10
    u0_m0_wo0_mtree_mult1_44_shift0_qint <= u0_m0_wo0_wi0_r0_delayr6_q & "0000";
    u0_m0_wo0_mtree_mult1_44_shift0_q <= u0_m0_wo0_mtree_mult1_44_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_44_add_1(ADD,269)@10 + 1
    u0_m0_wo0_mtree_mult1_44_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr6_q(15)) & u0_m0_wo0_wi0_r0_delayr6_q));
    u0_m0_wo0_mtree_mult1_44_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_44_shift0_q(19)) & u0_m0_wo0_mtree_mult1_44_shift0_q));
    u0_m0_wo0_mtree_mult1_44_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_44_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_44_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_44_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_44_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_44_add_1_q <= u0_m0_wo0_mtree_mult1_44_add_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_44_add_5(ADD,273)@11 + 1
    u0_m0_wo0_mtree_mult1_44_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_44_add_1_q(20)) & u0_m0_wo0_mtree_mult1_44_add_1_q));
    u0_m0_wo0_mtree_mult1_44_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_44_shift4_q(25)) & u0_m0_wo0_mtree_mult1_44_shift4_q));
    u0_m0_wo0_mtree_mult1_44_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_44_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_44_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_44_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_44_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_44_add_5_q <= u0_m0_wo0_mtree_mult1_44_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_44_shift6(BITSHIFT,274)@12
    u0_m0_wo0_mtree_mult1_44_shift6_qint <= u0_m0_wo0_mtree_mult1_44_add_5_q & "00";
    u0_m0_wo0_mtree_mult1_44_shift6_q <= u0_m0_wo0_mtree_mult1_44_shift6_qint(28 downto 0);

    -- u0_m0_wo0_mtree_add0_22(ADD,197)@12 + 1
    u0_m0_wo0_mtree_add0_22_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_44_shift6_q);
    u0_m0_wo0_mtree_add0_22_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_45_shift6_q(27)) & u0_m0_wo0_mtree_mult1_45_shift6_q));
    u0_m0_wo0_mtree_add0_22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_22_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_22_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_22_a) + SIGNED(u0_m0_wo0_mtree_add0_22_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_22_q <= u0_m0_wo0_mtree_add0_22_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_11(ADD,211)@13 + 1
    u0_m0_wo0_mtree_add1_11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_add0_22_q(28)) & u0_m0_wo0_mtree_add0_22_q));
    u0_m0_wo0_mtree_add1_11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_add0_23_q(27)) & u0_m0_wo0_mtree_add0_23_q));
    u0_m0_wo0_mtree_add1_11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_11_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_11_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_11_a) + SIGNED(u0_m0_wo0_mtree_add1_11_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_11_q <= u0_m0_wo0_mtree_add1_11_o(29 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,26)@10
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm7(CONSTANT,80)@0
    u0_m0_wo0_cm7_q <= "1011110110101";

    -- u0_m0_wo0_mtree_mult1_43(MULT,131)@10 + 2
    u0_m0_wo0_mtree_mult1_43_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q);
    u0_m0_wo0_mtree_mult1_43_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr7_q);
    u0_m0_wo0_mtree_mult1_43_reset <= areset;
    u0_m0_wo0_mtree_mult1_43_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_43_a0,
        datab => u0_m0_wo0_mtree_mult1_43_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_43_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_43_s1
    );
    u0_m0_wo0_mtree_mult1_43_q <= u0_m0_wo0_mtree_mult1_43_s1;

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm8(CONSTANT,81)@0
    u0_m0_wo0_cm8_q <= "1011001110001";

    -- u0_m0_wo0_mtree_mult1_42(MULT,132)@10 + 2
    u0_m0_wo0_mtree_mult1_42_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_q);
    u0_m0_wo0_mtree_mult1_42_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr8_q);
    u0_m0_wo0_mtree_mult1_42_reset <= areset;
    u0_m0_wo0_mtree_mult1_42_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_42_a0,
        datab => u0_m0_wo0_mtree_mult1_42_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_42_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_42_s1
    );
    u0_m0_wo0_mtree_mult1_42_q <= u0_m0_wo0_mtree_mult1_42_s1;

    -- u0_m0_wo0_mtree_add0_21(ADD,196)@12 + 1
    u0_m0_wo0_mtree_add0_21_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_42_q(28)) & u0_m0_wo0_mtree_mult1_42_q));
    u0_m0_wo0_mtree_add0_21_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_43_q(28)) & u0_m0_wo0_mtree_mult1_43_q));
    u0_m0_wo0_mtree_add0_21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_21_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_21_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_21_a) + SIGNED(u0_m0_wo0_mtree_add0_21_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_21_q <= u0_m0_wo0_mtree_add0_21_o(29 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm9(CONSTANT,82)@0
    u0_m0_wo0_cm9_q <= "1010111001011";

    -- u0_m0_wo0_mtree_mult1_41(MULT,133)@10 + 2
    u0_m0_wo0_mtree_mult1_41_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo0_mtree_mult1_41_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_q);
    u0_m0_wo0_mtree_mult1_41_reset <= areset;
    u0_m0_wo0_mtree_mult1_41_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_41_a0,
        datab => u0_m0_wo0_mtree_mult1_41_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_41_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_41_s1
    );
    u0_m0_wo0_mtree_mult1_41_q <= u0_m0_wo0_mtree_mult1_41_s1;

    -- u0_m0_wo0_mtree_mult1_40_shift2(BITSHIFT,303)@10
    u0_m0_wo0_mtree_mult1_40_shift2_qint <= u0_m0_wo0_wi0_r0_delayr10_q & "00";
    u0_m0_wo0_mtree_mult1_40_shift2_q <= u0_m0_wo0_mtree_mult1_40_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@10
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_40_add_3(ADD,304)@10 + 1
    u0_m0_wo0_mtree_mult1_40_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr10_q(15)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo0_mtree_mult1_40_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_40_shift2_q(17)) & u0_m0_wo0_mtree_mult1_40_shift2_q));
    u0_m0_wo0_mtree_mult1_40_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_40_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_40_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_40_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_40_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_40_add_3_q <= u0_m0_wo0_mtree_mult1_40_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_40_shift4(BITSHIFT,305)@11
    u0_m0_wo0_mtree_mult1_40_shift4_qint <= u0_m0_wo0_mtree_mult1_40_add_3_q & "000000000";
    u0_m0_wo0_mtree_mult1_40_shift4_q <= u0_m0_wo0_mtree_mult1_40_shift4_qint(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_40_shift0(BITSHIFT,301)@10
    u0_m0_wo0_mtree_mult1_40_shift0_qint <= u0_m0_wo0_wi0_r0_delayr10_q & "00000";
    u0_m0_wo0_mtree_mult1_40_shift0_q <= u0_m0_wo0_mtree_mult1_40_shift0_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_40_sub_1(SUB,302)@10 + 1
    u0_m0_wo0_mtree_mult1_40_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_40_shift0_q(20)) & u0_m0_wo0_mtree_mult1_40_shift0_q));
    u0_m0_wo0_mtree_mult1_40_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr10_q(15)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo0_mtree_mult1_40_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_40_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_40_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_40_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_40_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_40_sub_1_q <= u0_m0_wo0_mtree_mult1_40_sub_1_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_40_sub_5(SUB,306)@11 + 1
    u0_m0_wo0_mtree_mult1_40_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_40_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_40_sub_1_q));
    u0_m0_wo0_mtree_mult1_40_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_40_shift4_q(27)) & u0_m0_wo0_mtree_mult1_40_shift4_q));
    u0_m0_wo0_mtree_mult1_40_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_40_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_40_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_40_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_40_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_40_sub_5_q <= u0_m0_wo0_mtree_mult1_40_sub_5_o(28 downto 0);

    -- u0_m0_wo0_mtree_add0_20(ADD,195)@12 + 1
    u0_m0_wo0_mtree_add0_20_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_40_sub_5_q(28)) & u0_m0_wo0_mtree_mult1_40_sub_5_q));
    u0_m0_wo0_mtree_add0_20_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_41_q(28)) & u0_m0_wo0_mtree_mult1_41_q));
    u0_m0_wo0_mtree_add0_20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_20_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_20_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_20_a) + SIGNED(u0_m0_wo0_mtree_add0_20_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_20_q <= u0_m0_wo0_mtree_add0_20_o(29 downto 0);

    -- u0_m0_wo0_mtree_add1_10(ADD,210)@13 + 1
    u0_m0_wo0_mtree_add1_10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_20_q(29)) & u0_m0_wo0_mtree_add0_20_q));
    u0_m0_wo0_mtree_add1_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_21_q(29)) & u0_m0_wo0_mtree_add0_21_q));
    u0_m0_wo0_mtree_add1_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_10_a) + SIGNED(u0_m0_wo0_mtree_add1_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_10_q <= u0_m0_wo0_mtree_add1_10_o(30 downto 0);

    -- u0_m0_wo0_mtree_add2_5(ADD,218)@14 + 1
    u0_m0_wo0_mtree_add2_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add1_10_q(30)) & u0_m0_wo0_mtree_add1_10_q));
    u0_m0_wo0_mtree_add2_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => u0_m0_wo0_mtree_add1_11_q(29)) & u0_m0_wo0_mtree_add1_11_q));
    u0_m0_wo0_mtree_add2_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_5_a) + SIGNED(u0_m0_wo0_mtree_add2_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_5_q <= u0_m0_wo0_mtree_add2_5_o(31 downto 0);

    -- u0_m0_wo0_mtree_mult1_39_shift2(BITSHIFT,309)@10
    u0_m0_wo0_mtree_mult1_39_shift2_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "00000";
    u0_m0_wo0_mtree_mult1_39_shift2_q <= u0_m0_wo0_mtree_mult1_39_shift2_qint(20 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@10
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_39_add_3(ADD,310)@10 + 1
    u0_m0_wo0_mtree_mult1_39_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr11_q(15)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo0_mtree_mult1_39_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_39_shift2_q(20)) & u0_m0_wo0_mtree_mult1_39_shift2_q));
    u0_m0_wo0_mtree_mult1_39_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_39_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_39_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_39_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_39_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_39_add_3_q <= u0_m0_wo0_mtree_mult1_39_add_3_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_39_shift4(BITSHIFT,311)@11
    u0_m0_wo0_mtree_mult1_39_shift4_qint <= u0_m0_wo0_mtree_mult1_39_add_3_q & "00000";
    u0_m0_wo0_mtree_mult1_39_shift4_q <= u0_m0_wo0_mtree_mult1_39_shift4_qint(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_39_shift0(BITSHIFT,307)@10
    u0_m0_wo0_mtree_mult1_39_shift0_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "00";
    u0_m0_wo0_mtree_mult1_39_shift0_q <= u0_m0_wo0_mtree_mult1_39_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_39_add_1(ADD,308)@10 + 1
    u0_m0_wo0_mtree_mult1_39_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr11_q(15)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo0_mtree_mult1_39_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_39_shift0_q(17)) & u0_m0_wo0_mtree_mult1_39_shift0_q));
    u0_m0_wo0_mtree_mult1_39_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_39_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_39_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_39_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_39_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_39_add_1_q <= u0_m0_wo0_mtree_mult1_39_add_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_39_sub_5(SUB,312)@11 + 1
    u0_m0_wo0_mtree_mult1_39_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 19 => u0_m0_wo0_mtree_mult1_39_add_1_q(18)) & u0_m0_wo0_mtree_mult1_39_add_1_q));
    u0_m0_wo0_mtree_mult1_39_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_39_shift4_q(26)) & u0_m0_wo0_mtree_mult1_39_shift4_q));
    u0_m0_wo0_mtree_mult1_39_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_39_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_39_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_39_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_39_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_39_sub_5_q <= u0_m0_wo0_mtree_mult1_39_sub_5_o(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_39_shift6(BITSHIFT,313)@12
    u0_m0_wo0_mtree_mult1_39_shift6_qint <= u0_m0_wo0_mtree_mult1_39_sub_5_q & "0";
    u0_m0_wo0_mtree_mult1_39_shift6_q <= u0_m0_wo0_mtree_mult1_39_shift6_qint(28 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@10
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm12(CONSTANT,85)@0
    u0_m0_wo0_cm12_q <= "101100101001";

    -- u0_m0_wo0_mtree_mult1_38(MULT,136)@10 + 2
    u0_m0_wo0_mtree_mult1_38_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_q);
    u0_m0_wo0_mtree_mult1_38_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo0_mtree_mult1_38_reset <= areset;
    u0_m0_wo0_mtree_mult1_38_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_38_a0,
        datab => u0_m0_wo0_mtree_mult1_38_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_38_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_38_s1
    );
    u0_m0_wo0_mtree_mult1_38_q <= u0_m0_wo0_mtree_mult1_38_s1;

    -- u0_m0_wo0_mtree_add0_19(ADD,194)@12 + 1
    u0_m0_wo0_mtree_add0_19_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_mult1_38_q(27)) & u0_m0_wo0_mtree_mult1_38_q));
    u0_m0_wo0_mtree_add0_19_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_39_shift6_q(28)) & u0_m0_wo0_mtree_mult1_39_shift6_q));
    u0_m0_wo0_mtree_add0_19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_19_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_19_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_19_a) + SIGNED(u0_m0_wo0_mtree_add0_19_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_19_q <= u0_m0_wo0_mtree_add0_19_o(29 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,32)@10
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr13_q_12(DELAY,1093)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr13_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => d_u0_m0_wo0_wi0_r0_delayr13_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_37_shift0(BITSHIFT,322)@12
    u0_m0_wo0_mtree_mult1_37_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr13_q_12_q & "0000000";
    u0_m0_wo0_mtree_mult1_37_shift0_q <= u0_m0_wo0_mtree_mult1_37_shift0_qint(22 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,33)@10
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr14_q_11(DELAY,1094)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr14_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => d_u0_m0_wo0_wi0_r0_delayr14_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_36_shift2(BITSHIFT,325)@11
    u0_m0_wo0_mtree_mult1_36_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr14_q_11_q & "00000000000";
    u0_m0_wo0_mtree_mult1_36_shift2_q <= u0_m0_wo0_mtree_mult1_36_shift2_qint(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_36_shift0(BITSHIFT,323)@10
    u0_m0_wo0_mtree_mult1_36_shift0_qint <= u0_m0_wo0_wi0_r0_delayr14_q & "00";
    u0_m0_wo0_mtree_mult1_36_shift0_q <= u0_m0_wo0_mtree_mult1_36_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_36_sub_1(SUB,324)@10 + 1
    u0_m0_wo0_mtree_mult1_36_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr14_q(15)) & u0_m0_wo0_wi0_r0_delayr14_q));
    u0_m0_wo0_mtree_mult1_36_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_36_shift0_q(17)) & u0_m0_wo0_mtree_mult1_36_shift0_q));
    u0_m0_wo0_mtree_mult1_36_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_36_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_36_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_36_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_36_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_36_sub_1_q <= u0_m0_wo0_mtree_mult1_36_sub_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_36_add_3(ADD,326)@11 + 1
    u0_m0_wo0_mtree_mult1_36_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 19 => u0_m0_wo0_mtree_mult1_36_sub_1_q(18)) & u0_m0_wo0_mtree_mult1_36_sub_1_q));
    u0_m0_wo0_mtree_mult1_36_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_36_shift2_q(26)) & u0_m0_wo0_mtree_mult1_36_shift2_q));
    u0_m0_wo0_mtree_mult1_36_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_36_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_36_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_36_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_36_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_36_add_3_q <= u0_m0_wo0_mtree_mult1_36_add_3_o(27 downto 0);

    -- u0_m0_wo0_mtree_add0_18(ADD,193)@12 + 1
    u0_m0_wo0_mtree_add0_18_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_36_add_3_q(27)) & u0_m0_wo0_mtree_mult1_36_add_3_q));
    u0_m0_wo0_mtree_add0_18_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 23 => u0_m0_wo0_mtree_mult1_37_shift0_q(22)) & u0_m0_wo0_mtree_mult1_37_shift0_q));
    u0_m0_wo0_mtree_add0_18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_18_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_18_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_18_a) + SIGNED(u0_m0_wo0_mtree_add0_18_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_18_q <= u0_m0_wo0_mtree_add0_18_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_9(ADD,209)@13 + 1
    u0_m0_wo0_mtree_add1_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_add0_18_q(28)) & u0_m0_wo0_mtree_add0_18_q));
    u0_m0_wo0_mtree_add1_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_19_q(29)) & u0_m0_wo0_mtree_add0_19_q));
    u0_m0_wo0_mtree_add1_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_9_a) + SIGNED(u0_m0_wo0_mtree_add1_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_9_q <= u0_m0_wo0_mtree_add1_9_o(30 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,34)@10
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm15(CONSTANT,88)@0
    u0_m0_wo0_cm15_q <= "01000110100011";

    -- u0_m0_wo0_mtree_mult1_35(MULT,139)@10 + 2
    u0_m0_wo0_mtree_mult1_35_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm15_q);
    u0_m0_wo0_mtree_mult1_35_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr15_q);
    u0_m0_wo0_mtree_mult1_35_reset <= areset;
    u0_m0_wo0_mtree_mult1_35_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 16,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_35_a0,
        datab => u0_m0_wo0_mtree_mult1_35_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_35_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_35_s1
    );
    u0_m0_wo0_mtree_mult1_35_q <= u0_m0_wo0_mtree_mult1_35_s1;

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,35)@10
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm16(CONSTANT,89)@0
    u0_m0_wo0_cm16_q <= "01110101001110";

    -- u0_m0_wo0_mtree_mult1_34(MULT,140)@10 + 2
    u0_m0_wo0_mtree_mult1_34_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm16_q);
    u0_m0_wo0_mtree_mult1_34_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_q);
    u0_m0_wo0_mtree_mult1_34_reset <= areset;
    u0_m0_wo0_mtree_mult1_34_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 16,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_34_a0,
        datab => u0_m0_wo0_mtree_mult1_34_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_34_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_34_s1
    );
    u0_m0_wo0_mtree_mult1_34_q <= u0_m0_wo0_mtree_mult1_34_s1;

    -- u0_m0_wo0_mtree_add0_17(ADD,192)@12 + 1
    u0_m0_wo0_mtree_add0_17_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_34_q(29)) & u0_m0_wo0_mtree_mult1_34_q));
    u0_m0_wo0_mtree_add0_17_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_35_q(29)) & u0_m0_wo0_mtree_mult1_35_q));
    u0_m0_wo0_mtree_add0_17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_17_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_17_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_17_a) + SIGNED(u0_m0_wo0_mtree_add0_17_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_17_q <= u0_m0_wo0_mtree_add0_17_o(30 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,36)@10
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm17(CONSTANT,90)@0
    u0_m0_wo0_cm17_q <= "010101010100100";

    -- u0_m0_wo0_mtree_mult1_33(MULT,141)@10 + 2
    u0_m0_wo0_mtree_mult1_33_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo0_mtree_mult1_33_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr17_q);
    u0_m0_wo0_mtree_mult1_33_reset <= areset;
    u0_m0_wo0_mtree_mult1_33_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 16,
        lpm_widthp => 31,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_33_a0,
        datab => u0_m0_wo0_mtree_mult1_33_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_33_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_33_s1
    );
    u0_m0_wo0_mtree_mult1_33_q <= u0_m0_wo0_mtree_mult1_33_s1;

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,37)@10
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm18(CONSTANT,91)@0
    u0_m0_wo0_cm18_q <= "011100100100001";

    -- u0_m0_wo0_mtree_mult1_32(MULT,142)@10 + 2
    u0_m0_wo0_mtree_mult1_32_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm18_q);
    u0_m0_wo0_mtree_mult1_32_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr18_q);
    u0_m0_wo0_mtree_mult1_32_reset <= areset;
    u0_m0_wo0_mtree_mult1_32_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 16,
        lpm_widthp => 31,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_32_a0,
        datab => u0_m0_wo0_mtree_mult1_32_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_32_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_32_s1
    );
    u0_m0_wo0_mtree_mult1_32_q <= u0_m0_wo0_mtree_mult1_32_s1;

    -- u0_m0_wo0_mtree_add0_16(ADD,191)@12 + 1
    u0_m0_wo0_mtree_add0_16_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_32_q(30)) & u0_m0_wo0_mtree_mult1_32_q));
    u0_m0_wo0_mtree_add0_16_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_33_q(30)) & u0_m0_wo0_mtree_mult1_33_q));
    u0_m0_wo0_mtree_add0_16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_16_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_16_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_16_a) + SIGNED(u0_m0_wo0_mtree_add0_16_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_16_q <= u0_m0_wo0_mtree_add0_16_o(31 downto 0);

    -- u0_m0_wo0_mtree_add1_8(ADD,208)@13 + 1
    u0_m0_wo0_mtree_add1_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_add0_16_q(31)) & u0_m0_wo0_mtree_add0_16_q));
    u0_m0_wo0_mtree_add1_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo0_mtree_add0_17_q(30)) & u0_m0_wo0_mtree_add0_17_q));
    u0_m0_wo0_mtree_add1_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_8_a) + SIGNED(u0_m0_wo0_mtree_add1_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_8_q <= u0_m0_wo0_mtree_add1_8_o(32 downto 0);

    -- u0_m0_wo0_mtree_add2_4(ADD,217)@14 + 1
    u0_m0_wo0_mtree_add2_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add1_8_q(32)) & u0_m0_wo0_mtree_add1_8_q));
    u0_m0_wo0_mtree_add2_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 31 => u0_m0_wo0_mtree_add1_9_q(30)) & u0_m0_wo0_mtree_add1_9_q));
    u0_m0_wo0_mtree_add2_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_4_a) + SIGNED(u0_m0_wo0_mtree_add2_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_4_q <= u0_m0_wo0_mtree_add2_4_o(33 downto 0);

    -- u0_m0_wo0_mtree_add3_2(ADD,221)@15 + 1
    u0_m0_wo0_mtree_add3_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add2_4_q(33)) & u0_m0_wo0_mtree_add2_4_q));
    u0_m0_wo0_mtree_add3_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 32 => u0_m0_wo0_mtree_add2_5_q(31)) & u0_m0_wo0_mtree_add2_5_q));
    u0_m0_wo0_mtree_add3_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_2_a) + SIGNED(u0_m0_wo0_mtree_add3_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_2_q <= u0_m0_wo0_mtree_add3_2_o(34 downto 0);

    -- u0_m0_wo0_mtree_add4_1(ADD,223)@16 + 1
    u0_m0_wo0_mtree_add4_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => u0_m0_wo0_mtree_add3_2_q(34)) & u0_m0_wo0_mtree_add3_2_q));
    u0_m0_wo0_mtree_add4_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 28 => u0_m0_wo0_mtree_add1_12_q(27)) & u0_m0_wo0_mtree_add1_12_q));
    u0_m0_wo0_mtree_add4_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_1_a) + SIGNED(u0_m0_wo0_mtree_add4_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_1_q <= u0_m0_wo0_mtree_add4_1_o(35 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr19(DELAY,38)@10
    u0_m0_wo0_wi0_r0_delayr19 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => u0_m0_wo0_wi0_r0_delayr19_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm19(CONSTANT,92)@0
    u0_m0_wo0_cm19_q <= "0100100000010111";

    -- u0_m0_wo0_mtree_mult1_31(MULT,143)@10 + 2
    u0_m0_wo0_mtree_mult1_31_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm19_q);
    u0_m0_wo0_mtree_mult1_31_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr19_q);
    u0_m0_wo0_mtree_mult1_31_reset <= areset;
    u0_m0_wo0_mtree_mult1_31_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_31_a0,
        datab => u0_m0_wo0_mtree_mult1_31_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_31_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_31_s1
    );
    u0_m0_wo0_mtree_mult1_31_q <= u0_m0_wo0_mtree_mult1_31_s1;

    -- u0_m0_wo0_wi0_r0_delayr20(DELAY,39)@10
    u0_m0_wo0_wi0_r0_delayr20 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => u0_m0_wo0_wi0_r0_delayr20_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm20(CONSTANT,93)@0
    u0_m0_wo0_cm20_q <= "0101011010111100";

    -- u0_m0_wo0_mtree_mult1_30(MULT,144)@10 + 2
    u0_m0_wo0_mtree_mult1_30_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm20_q);
    u0_m0_wo0_mtree_mult1_30_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr20_q);
    u0_m0_wo0_mtree_mult1_30_reset <= areset;
    u0_m0_wo0_mtree_mult1_30_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_30_a0,
        datab => u0_m0_wo0_mtree_mult1_30_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_30_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_30_s1
    );
    u0_m0_wo0_mtree_mult1_30_q <= u0_m0_wo0_mtree_mult1_30_s1;

    -- u0_m0_wo0_mtree_add0_15(ADD,190)@12 + 1
    u0_m0_wo0_mtree_add0_15_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_30_q(31)) & u0_m0_wo0_mtree_mult1_30_q));
    u0_m0_wo0_mtree_add0_15_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_31_q(31)) & u0_m0_wo0_mtree_mult1_31_q));
    u0_m0_wo0_mtree_add0_15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_15_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_15_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_15_a) + SIGNED(u0_m0_wo0_mtree_add0_15_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_15_q <= u0_m0_wo0_mtree_add0_15_o(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr21(DELAY,40)@10
    u0_m0_wo0_wi0_r0_delayr21 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => u0_m0_wo0_wi0_r0_delayr21_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm21(CONSTANT,94)@0
    u0_m0_wo0_cm21_q <= "0110010000111001";

    -- u0_m0_wo0_mtree_mult1_29(MULT,145)@10 + 2
    u0_m0_wo0_mtree_mult1_29_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm21_q);
    u0_m0_wo0_mtree_mult1_29_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr21_q);
    u0_m0_wo0_mtree_mult1_29_reset <= areset;
    u0_m0_wo0_mtree_mult1_29_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_29_a0,
        datab => u0_m0_wo0_mtree_mult1_29_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_29_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_29_s1
    );
    u0_m0_wo0_mtree_mult1_29_q <= u0_m0_wo0_mtree_mult1_29_s1;

    -- u0_m0_wo0_mtree_mult1_28_shift0(BITSHIFT,396)@10
    u0_m0_wo0_mtree_mult1_28_shift0_qint <= u0_m0_wo0_wi0_r0_delayr22_q & "000000";
    u0_m0_wo0_mtree_mult1_28_shift0_q <= u0_m0_wo0_mtree_mult1_28_shift0_qint(21 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr22(DELAY,41)@10
    u0_m0_wo0_wi0_r0_delayr22 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => u0_m0_wo0_wi0_r0_delayr22_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_28_add_1(ADD,397)@10 + 1
    u0_m0_wo0_mtree_mult1_28_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => u0_m0_wo0_wi0_r0_delayr22_q(15)) & u0_m0_wo0_wi0_r0_delayr22_q));
    u0_m0_wo0_mtree_mult1_28_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_28_shift0_q(21)) & u0_m0_wo0_mtree_mult1_28_shift0_q));
    u0_m0_wo0_mtree_mult1_28_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_28_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_28_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_28_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_28_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_28_add_1_q <= u0_m0_wo0_mtree_mult1_28_add_1_o(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_28_shift2(BITSHIFT,398)@10
    u0_m0_wo0_mtree_mult1_28_shift2_qint <= u0_m0_wo0_wi0_r0_delayr22_q & "000";
    u0_m0_wo0_mtree_mult1_28_shift2_q <= u0_m0_wo0_mtree_mult1_28_shift2_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_28_sub_3(SUB,399)@10 + 1
    u0_m0_wo0_mtree_mult1_28_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_28_shift2_q(18)) & u0_m0_wo0_mtree_mult1_28_shift2_q));
    u0_m0_wo0_mtree_mult1_28_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr22_q(15)) & u0_m0_wo0_wi0_r0_delayr22_q));
    u0_m0_wo0_mtree_mult1_28_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_28_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_28_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_28_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_28_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_28_sub_3_q <= u0_m0_wo0_mtree_mult1_28_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_28_shift4(BITSHIFT,400)@11
    u0_m0_wo0_mtree_mult1_28_shift4_qint <= u0_m0_wo0_mtree_mult1_28_sub_3_q & "000000000000";
    u0_m0_wo0_mtree_mult1_28_shift4_q <= u0_m0_wo0_mtree_mult1_28_shift4_qint(31 downto 0);

    -- u0_m0_wo0_mtree_mult1_28_sub_5(SUB,401)@11 + 1
    u0_m0_wo0_mtree_mult1_28_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_28_shift4_q(31)) & u0_m0_wo0_mtree_mult1_28_shift4_q));
    u0_m0_wo0_mtree_mult1_28_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 23 => u0_m0_wo0_mtree_mult1_28_add_1_q(22)) & u0_m0_wo0_mtree_mult1_28_add_1_q));
    u0_m0_wo0_mtree_mult1_28_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_28_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_28_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_28_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_28_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_28_sub_5_q <= u0_m0_wo0_mtree_mult1_28_sub_5_o(32 downto 0);

    -- u0_m0_wo0_mtree_add0_14(ADD,189)@12 + 1
    u0_m0_wo0_mtree_add0_14_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_28_sub_5_q);
    u0_m0_wo0_mtree_add0_14_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_29_q(31)) & u0_m0_wo0_mtree_mult1_29_q));
    u0_m0_wo0_mtree_add0_14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_14_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_14_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_14_a) + SIGNED(u0_m0_wo0_mtree_add0_14_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_14_q <= u0_m0_wo0_mtree_add0_14_o(32 downto 0);

    -- u0_m0_wo0_mtree_add1_7(ADD,207)@13 + 1
    u0_m0_wo0_mtree_add1_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_14_q(32)) & u0_m0_wo0_mtree_add0_14_q));
    u0_m0_wo0_mtree_add1_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_15_q(32)) & u0_m0_wo0_mtree_add0_15_q));
    u0_m0_wo0_mtree_add1_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_7_a) + SIGNED(u0_m0_wo0_mtree_add1_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_7_q <= u0_m0_wo0_mtree_add1_7_o(33 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr23(DELAY,42)@10
    u0_m0_wo0_wi0_r0_delayr23 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr22_q, xout => u0_m0_wo0_wi0_r0_delayr23_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_27_shift2(BITSHIFT,404)@10
    u0_m0_wo0_mtree_mult1_27_shift2_qint <= u0_m0_wo0_wi0_r0_delayr23_q & "0000";
    u0_m0_wo0_mtree_mult1_27_shift2_q <= u0_m0_wo0_mtree_mult1_27_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_sub_3(SUB,405)@10 + 1
    u0_m0_wo0_mtree_mult1_27_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_27_shift2_q(19)) & u0_m0_wo0_mtree_mult1_27_shift2_q));
    u0_m0_wo0_mtree_mult1_27_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr23_q(15)) & u0_m0_wo0_wi0_r0_delayr23_q));
    u0_m0_wo0_mtree_mult1_27_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_27_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_27_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_sub_3_q <= u0_m0_wo0_mtree_mult1_27_sub_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_shift4(BITSHIFT,406)@11
    u0_m0_wo0_mtree_mult1_27_shift4_qint <= u0_m0_wo0_mtree_mult1_27_sub_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_27_shift4_q <= u0_m0_wo0_mtree_mult1_27_shift4_qint(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_shift0(BITSHIFT,402)@10
    u0_m0_wo0_mtree_mult1_27_shift0_qint <= u0_m0_wo0_wi0_r0_delayr23_q & "000";
    u0_m0_wo0_mtree_mult1_27_shift0_q <= u0_m0_wo0_mtree_mult1_27_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_add_1(ADD,403)@10 + 1
    u0_m0_wo0_mtree_mult1_27_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr23_q(15)) & u0_m0_wo0_wi0_r0_delayr23_q));
    u0_m0_wo0_mtree_mult1_27_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_27_shift0_q(18)) & u0_m0_wo0_mtree_mult1_27_shift0_q));
    u0_m0_wo0_mtree_mult1_27_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_27_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_27_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_add_1_q <= u0_m0_wo0_mtree_mult1_27_add_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_add_5(ADD,407)@11 + 1
    u0_m0_wo0_mtree_mult1_27_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 20 => u0_m0_wo0_mtree_mult1_27_add_1_q(19)) & u0_m0_wo0_mtree_mult1_27_add_1_q));
    u0_m0_wo0_mtree_mult1_27_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_27_shift4_q(27)) & u0_m0_wo0_mtree_mult1_27_shift4_q));
    u0_m0_wo0_mtree_mult1_27_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_27_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_27_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_add_5_q <= u0_m0_wo0_mtree_mult1_27_add_5_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_shift6(BITSHIFT,408)@12
    u0_m0_wo0_mtree_mult1_27_shift6_qint <= u0_m0_wo0_mtree_mult1_27_add_5_q & "0000";
    u0_m0_wo0_mtree_mult1_27_shift6_q <= u0_m0_wo0_mtree_mult1_27_shift6_qint(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr24(DELAY,43)@10
    u0_m0_wo0_wi0_r0_delayr24 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr23_q, xout => u0_m0_wo0_wi0_r0_delayr24_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm24(CONSTANT,97)@0
    u0_m0_wo0_cm24_q <= "0111111000011010";

    -- u0_m0_wo0_mtree_mult1_26(MULT,148)@10 + 2
    u0_m0_wo0_mtree_mult1_26_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm24_q);
    u0_m0_wo0_mtree_mult1_26_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr24_q);
    u0_m0_wo0_mtree_mult1_26_reset <= areset;
    u0_m0_wo0_mtree_mult1_26_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_26_a0,
        datab => u0_m0_wo0_mtree_mult1_26_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_26_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_26_s1
    );
    u0_m0_wo0_mtree_mult1_26_q <= u0_m0_wo0_mtree_mult1_26_s1;

    -- u0_m0_wo0_mtree_add0_13(ADD,188)@12 + 1
    u0_m0_wo0_mtree_add0_13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_26_q(31)) & u0_m0_wo0_mtree_mult1_26_q));
    u0_m0_wo0_mtree_add0_13_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_27_shift6_q);
    u0_m0_wo0_mtree_add0_13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_13_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_13_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_13_a) + SIGNED(u0_m0_wo0_mtree_add0_13_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_13_q <= u0_m0_wo0_mtree_add0_13_o(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr25(DELAY,44)@10
    u0_m0_wo0_wi0_r0_delayr25 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr24_q, xout => u0_m0_wo0_wi0_r0_delayr25_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr25_q_11(DELAY,1095)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr25_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr25_q, xout => d_u0_m0_wo0_wi0_r0_delayr25_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_25_shift0(BITSHIFT,418)@11
    u0_m0_wo0_mtree_mult1_25_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr25_q_11_q & "000000000000000";
    u0_m0_wo0_mtree_mult1_25_shift0_q <= u0_m0_wo0_mtree_mult1_25_shift0_qint(30 downto 0);

    -- u0_m0_wo0_mtree_mult1_25_sub_1(SUB,419)@11 + 1
    u0_m0_wo0_mtree_mult1_25_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_25_shift0_q(30)) & u0_m0_wo0_mtree_mult1_25_shift0_q));
    u0_m0_wo0_mtree_mult1_25_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 16 => d_u0_m0_wo0_wi0_r0_delayr25_q_11_q(15)) & d_u0_m0_wo0_wi0_r0_delayr25_q_11_q));
    u0_m0_wo0_mtree_mult1_25_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_25_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_25_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_25_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_25_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_25_sub_1_q <= u0_m0_wo0_mtree_mult1_25_sub_1_o(31 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr26(DELAY,45)@10
    u0_m0_wo0_wi0_r0_delayr26 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr25_q, xout => u0_m0_wo0_wi0_r0_delayr26_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_24(MULT,150)@10 + 2
    u0_m0_wo0_mtree_mult1_24_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm24_q);
    u0_m0_wo0_mtree_mult1_24_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr26_q);
    u0_m0_wo0_mtree_mult1_24_reset <= areset;
    u0_m0_wo0_mtree_mult1_24_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_24_a0,
        datab => u0_m0_wo0_mtree_mult1_24_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_24_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_24_s1
    );
    u0_m0_wo0_mtree_mult1_24_q <= u0_m0_wo0_mtree_mult1_24_s1;

    -- u0_m0_wo0_mtree_add0_12(ADD,187)@12 + 1
    u0_m0_wo0_mtree_add0_12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_24_q(31)) & u0_m0_wo0_mtree_mult1_24_q));
    u0_m0_wo0_mtree_add0_12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_25_sub_1_q(31)) & u0_m0_wo0_mtree_mult1_25_sub_1_q));
    u0_m0_wo0_mtree_add0_12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_12_a) + SIGNED(u0_m0_wo0_mtree_add0_12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_12_q <= u0_m0_wo0_mtree_add0_12_o(32 downto 0);

    -- u0_m0_wo0_mtree_add1_6(ADD,206)@13 + 1
    u0_m0_wo0_mtree_add1_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_12_q(32)) & u0_m0_wo0_mtree_add0_12_q));
    u0_m0_wo0_mtree_add1_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_13_q(32)) & u0_m0_wo0_mtree_add0_13_q));
    u0_m0_wo0_mtree_add1_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_6_a) + SIGNED(u0_m0_wo0_mtree_add1_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_6_q <= u0_m0_wo0_mtree_add1_6_o(33 downto 0);

    -- u0_m0_wo0_mtree_add2_3(ADD,216)@14 + 1
    u0_m0_wo0_mtree_add2_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add1_6_q(33)) & u0_m0_wo0_mtree_add1_6_q));
    u0_m0_wo0_mtree_add2_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add1_7_q(33)) & u0_m0_wo0_mtree_add1_7_q));
    u0_m0_wo0_mtree_add2_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_3_a) + SIGNED(u0_m0_wo0_mtree_add2_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_3_q <= u0_m0_wo0_mtree_add2_3_o(34 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr27(DELAY,46)@10
    u0_m0_wo0_wi0_r0_delayr27 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr26_q, xout => u0_m0_wo0_wi0_r0_delayr27_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_23_shift2(BITSHIFT,431)@10
    u0_m0_wo0_mtree_mult1_23_shift2_qint <= u0_m0_wo0_wi0_r0_delayr27_q & "0000";
    u0_m0_wo0_mtree_mult1_23_shift2_q <= u0_m0_wo0_mtree_mult1_23_shift2_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_sub_3(SUB,432)@10 + 1
    u0_m0_wo0_mtree_mult1_23_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_23_shift2_q(19)) & u0_m0_wo0_mtree_mult1_23_shift2_q));
    u0_m0_wo0_mtree_mult1_23_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr27_q(15)) & u0_m0_wo0_wi0_r0_delayr27_q));
    u0_m0_wo0_mtree_mult1_23_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_23_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_sub_3_q <= u0_m0_wo0_mtree_mult1_23_sub_3_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift4(BITSHIFT,433)@11
    u0_m0_wo0_mtree_mult1_23_shift4_qint <= u0_m0_wo0_mtree_mult1_23_sub_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_23_shift4_q <= u0_m0_wo0_mtree_mult1_23_shift4_qint(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift0(BITSHIFT,429)@10
    u0_m0_wo0_mtree_mult1_23_shift0_qint <= u0_m0_wo0_wi0_r0_delayr27_q & "000";
    u0_m0_wo0_mtree_mult1_23_shift0_q <= u0_m0_wo0_mtree_mult1_23_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_add_1(ADD,430)@10 + 1
    u0_m0_wo0_mtree_mult1_23_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr27_q(15)) & u0_m0_wo0_wi0_r0_delayr27_q));
    u0_m0_wo0_mtree_mult1_23_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_23_shift0_q(18)) & u0_m0_wo0_mtree_mult1_23_shift0_q));
    u0_m0_wo0_mtree_mult1_23_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_add_1_q <= u0_m0_wo0_mtree_mult1_23_add_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_add_5(ADD,434)@11 + 1
    u0_m0_wo0_mtree_mult1_23_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 20 => u0_m0_wo0_mtree_mult1_23_add_1_q(19)) & u0_m0_wo0_mtree_mult1_23_add_1_q));
    u0_m0_wo0_mtree_mult1_23_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_23_shift4_q(27)) & u0_m0_wo0_mtree_mult1_23_shift4_q));
    u0_m0_wo0_mtree_mult1_23_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_add_5_q <= u0_m0_wo0_mtree_mult1_23_add_5_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift6(BITSHIFT,435)@12
    u0_m0_wo0_mtree_mult1_23_shift6_qint <= u0_m0_wo0_mtree_mult1_23_add_5_q & "0000";
    u0_m0_wo0_mtree_mult1_23_shift6_q <= u0_m0_wo0_mtree_mult1_23_shift6_qint(32 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_shift0(BITSHIFT,436)@10
    u0_m0_wo0_mtree_mult1_22_shift0_qint <= u0_m0_wo0_wi0_r0_delayr28_q & "000000";
    u0_m0_wo0_mtree_mult1_22_shift0_q <= u0_m0_wo0_mtree_mult1_22_shift0_qint(21 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr28(DELAY,47)@10
    u0_m0_wo0_wi0_r0_delayr28 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr27_q, xout => u0_m0_wo0_wi0_r0_delayr28_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_22_add_1(ADD,437)@10 + 1
    u0_m0_wo0_mtree_mult1_22_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 16 => u0_m0_wo0_wi0_r0_delayr28_q(15)) & u0_m0_wo0_wi0_r0_delayr28_q));
    u0_m0_wo0_mtree_mult1_22_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => u0_m0_wo0_mtree_mult1_22_shift0_q(21)) & u0_m0_wo0_mtree_mult1_22_shift0_q));
    u0_m0_wo0_mtree_mult1_22_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_22_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_22_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_22_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_22_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_22_add_1_q <= u0_m0_wo0_mtree_mult1_22_add_1_o(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_shift2(BITSHIFT,438)@10
    u0_m0_wo0_mtree_mult1_22_shift2_qint <= u0_m0_wo0_wi0_r0_delayr28_q & "000";
    u0_m0_wo0_mtree_mult1_22_shift2_q <= u0_m0_wo0_mtree_mult1_22_shift2_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_sub_3(SUB,439)@10 + 1
    u0_m0_wo0_mtree_mult1_22_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_22_shift2_q(18)) & u0_m0_wo0_mtree_mult1_22_shift2_q));
    u0_m0_wo0_mtree_mult1_22_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr28_q(15)) & u0_m0_wo0_wi0_r0_delayr28_q));
    u0_m0_wo0_mtree_mult1_22_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_22_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_22_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_22_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_22_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_22_sub_3_q <= u0_m0_wo0_mtree_mult1_22_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_shift4(BITSHIFT,440)@11
    u0_m0_wo0_mtree_mult1_22_shift4_qint <= u0_m0_wo0_mtree_mult1_22_sub_3_q & "000000000000";
    u0_m0_wo0_mtree_mult1_22_shift4_q <= u0_m0_wo0_mtree_mult1_22_shift4_qint(31 downto 0);

    -- u0_m0_wo0_mtree_mult1_22_sub_5(SUB,441)@11 + 1
    u0_m0_wo0_mtree_mult1_22_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_22_shift4_q(31)) & u0_m0_wo0_mtree_mult1_22_shift4_q));
    u0_m0_wo0_mtree_mult1_22_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 23 => u0_m0_wo0_mtree_mult1_22_add_1_q(22)) & u0_m0_wo0_mtree_mult1_22_add_1_q));
    u0_m0_wo0_mtree_mult1_22_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_22_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_22_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_22_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_22_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_22_sub_5_q <= u0_m0_wo0_mtree_mult1_22_sub_5_o(32 downto 0);

    -- u0_m0_wo0_mtree_add0_11(ADD,186)@12 + 1
    u0_m0_wo0_mtree_add0_11_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_22_sub_5_q);
    u0_m0_wo0_mtree_add0_11_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_23_shift6_q);
    u0_m0_wo0_mtree_add0_11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_11_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_11_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_11_a) + SIGNED(u0_m0_wo0_mtree_add0_11_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_11_q <= u0_m0_wo0_mtree_add0_11_o(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr29(DELAY,48)@10
    u0_m0_wo0_wi0_r0_delayr29 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr28_q, xout => u0_m0_wo0_wi0_r0_delayr29_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_21(MULT,153)@10 + 2
    u0_m0_wo0_mtree_mult1_21_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm21_q);
    u0_m0_wo0_mtree_mult1_21_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr29_q);
    u0_m0_wo0_mtree_mult1_21_reset <= areset;
    u0_m0_wo0_mtree_mult1_21_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_21_a0,
        datab => u0_m0_wo0_mtree_mult1_21_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_21_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_21_s1
    );
    u0_m0_wo0_mtree_mult1_21_q <= u0_m0_wo0_mtree_mult1_21_s1;

    -- u0_m0_wo0_wi0_r0_delayr30(DELAY,49)@10
    u0_m0_wo0_wi0_r0_delayr30 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr29_q, xout => u0_m0_wo0_wi0_r0_delayr30_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_20(MULT,154)@10 + 2
    u0_m0_wo0_mtree_mult1_20_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm20_q);
    u0_m0_wo0_mtree_mult1_20_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr30_q);
    u0_m0_wo0_mtree_mult1_20_reset <= areset;
    u0_m0_wo0_mtree_mult1_20_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_20_a0,
        datab => u0_m0_wo0_mtree_mult1_20_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_20_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_20_s1
    );
    u0_m0_wo0_mtree_mult1_20_q <= u0_m0_wo0_mtree_mult1_20_s1;

    -- u0_m0_wo0_mtree_add0_10(ADD,185)@12 + 1
    u0_m0_wo0_mtree_add0_10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_20_q(31)) & u0_m0_wo0_mtree_mult1_20_q));
    u0_m0_wo0_mtree_add0_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_21_q(31)) & u0_m0_wo0_mtree_mult1_21_q));
    u0_m0_wo0_mtree_add0_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_10_a) + SIGNED(u0_m0_wo0_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_10_q <= u0_m0_wo0_mtree_add0_10_o(32 downto 0);

    -- u0_m0_wo0_mtree_add1_5(ADD,205)@13 + 1
    u0_m0_wo0_mtree_add1_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_10_q(32)) & u0_m0_wo0_mtree_add0_10_q));
    u0_m0_wo0_mtree_add1_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_11_q(32)) & u0_m0_wo0_mtree_add0_11_q));
    u0_m0_wo0_mtree_add1_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_5_a) + SIGNED(u0_m0_wo0_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_5_q <= u0_m0_wo0_mtree_add1_5_o(33 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr31(DELAY,50)@10
    u0_m0_wo0_wi0_r0_delayr31 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr30_q, xout => u0_m0_wo0_wi0_r0_delayr31_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_19(MULT,155)@10 + 2
    u0_m0_wo0_mtree_mult1_19_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm19_q);
    u0_m0_wo0_mtree_mult1_19_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr31_q);
    u0_m0_wo0_mtree_mult1_19_reset <= areset;
    u0_m0_wo0_mtree_mult1_19_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_19_a0,
        datab => u0_m0_wo0_mtree_mult1_19_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_19_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_19_s1
    );
    u0_m0_wo0_mtree_mult1_19_q <= u0_m0_wo0_mtree_mult1_19_s1;

    -- u0_m0_wo0_wi0_r0_delayr32(DELAY,51)@10
    u0_m0_wo0_wi0_r0_delayr32 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr31_q, xout => u0_m0_wo0_wi0_r0_delayr32_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_18(MULT,156)@10 + 2
    u0_m0_wo0_mtree_mult1_18_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm18_q);
    u0_m0_wo0_mtree_mult1_18_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_q);
    u0_m0_wo0_mtree_mult1_18_reset <= areset;
    u0_m0_wo0_mtree_mult1_18_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 16,
        lpm_widthp => 31,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_18_a0,
        datab => u0_m0_wo0_mtree_mult1_18_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_18_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_18_s1
    );
    u0_m0_wo0_mtree_mult1_18_q <= u0_m0_wo0_mtree_mult1_18_s1;

    -- u0_m0_wo0_mtree_add0_9(ADD,184)@12 + 1
    u0_m0_wo0_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo0_mtree_mult1_18_q(30)) & u0_m0_wo0_mtree_mult1_18_q));
    u0_m0_wo0_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_19_q(31)) & u0_m0_wo0_mtree_mult1_19_q));
    u0_m0_wo0_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_9_a) + SIGNED(u0_m0_wo0_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_9_q <= u0_m0_wo0_mtree_add0_9_o(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr33(DELAY,52)@10
    u0_m0_wo0_wi0_r0_delayr33 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr32_q, xout => u0_m0_wo0_wi0_r0_delayr33_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_17(MULT,157)@10 + 2
    u0_m0_wo0_mtree_mult1_17_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo0_mtree_mult1_17_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr33_q);
    u0_m0_wo0_mtree_mult1_17_reset <= areset;
    u0_m0_wo0_mtree_mult1_17_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 16,
        lpm_widthp => 31,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_17_a0,
        datab => u0_m0_wo0_mtree_mult1_17_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_17_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_17_s1
    );
    u0_m0_wo0_mtree_mult1_17_q <= u0_m0_wo0_mtree_mult1_17_s1;

    -- u0_m0_wo0_wi0_r0_delayr34(DELAY,53)@10
    u0_m0_wo0_wi0_r0_delayr34 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr33_q, xout => u0_m0_wo0_wi0_r0_delayr34_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_16(MULT,158)@10 + 2
    u0_m0_wo0_mtree_mult1_16_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm16_q);
    u0_m0_wo0_mtree_mult1_16_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr34_q);
    u0_m0_wo0_mtree_mult1_16_reset <= areset;
    u0_m0_wo0_mtree_mult1_16_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 16,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_16_a0,
        datab => u0_m0_wo0_mtree_mult1_16_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_16_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_16_s1
    );
    u0_m0_wo0_mtree_mult1_16_q <= u0_m0_wo0_mtree_mult1_16_s1;

    -- u0_m0_wo0_mtree_add0_8(ADD,183)@12 + 1
    u0_m0_wo0_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => u0_m0_wo0_mtree_mult1_16_q(29)) & u0_m0_wo0_mtree_mult1_16_q));
    u0_m0_wo0_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_17_q(30)) & u0_m0_wo0_mtree_mult1_17_q));
    u0_m0_wo0_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_a) + SIGNED(u0_m0_wo0_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_q <= u0_m0_wo0_mtree_add0_8_o(31 downto 0);

    -- u0_m0_wo0_mtree_add1_4(ADD,204)@13 + 1
    u0_m0_wo0_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo0_mtree_add0_8_q(31)) & u0_m0_wo0_mtree_add0_8_q));
    u0_m0_wo0_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_9_q(32)) & u0_m0_wo0_mtree_add0_9_q));
    u0_m0_wo0_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_a) + SIGNED(u0_m0_wo0_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_q <= u0_m0_wo0_mtree_add1_4_o(33 downto 0);

    -- u0_m0_wo0_mtree_add2_2(ADD,215)@14 + 1
    u0_m0_wo0_mtree_add2_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add1_4_q(33)) & u0_m0_wo0_mtree_add1_4_q));
    u0_m0_wo0_mtree_add2_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add1_5_q(33)) & u0_m0_wo0_mtree_add1_5_q));
    u0_m0_wo0_mtree_add2_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_2_a) + SIGNED(u0_m0_wo0_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_2_q <= u0_m0_wo0_mtree_add2_2_o(34 downto 0);

    -- u0_m0_wo0_mtree_add3_1(ADD,220)@15 + 1
    u0_m0_wo0_mtree_add3_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => u0_m0_wo0_mtree_add2_2_q(34)) & u0_m0_wo0_mtree_add2_2_q));
    u0_m0_wo0_mtree_add3_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => u0_m0_wo0_mtree_add2_3_q(34)) & u0_m0_wo0_mtree_add2_3_q));
    u0_m0_wo0_mtree_add3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_1_a) + SIGNED(u0_m0_wo0_mtree_add3_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_1_q <= u0_m0_wo0_mtree_add3_1_o(35 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr35(DELAY,54)@10
    u0_m0_wo0_wi0_r0_delayr35 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr34_q, xout => u0_m0_wo0_wi0_r0_delayr35_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_15(MULT,159)@10 + 2
    u0_m0_wo0_mtree_mult1_15_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm15_q);
    u0_m0_wo0_mtree_mult1_15_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr35_q);
    u0_m0_wo0_mtree_mult1_15_reset <= areset;
    u0_m0_wo0_mtree_mult1_15_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 14,
        lpm_widthb => 16,
        lpm_widthp => 30,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_15_a0,
        datab => u0_m0_wo0_mtree_mult1_15_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_15_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_15_s1
    );
    u0_m0_wo0_mtree_mult1_15_q <= u0_m0_wo0_mtree_mult1_15_s1;

    -- u0_m0_wo0_wi0_r0_delayr36(DELAY,55)@10
    u0_m0_wo0_wi0_r0_delayr36 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr35_q, xout => u0_m0_wo0_wi0_r0_delayr36_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr36_q_11(DELAY,1096)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr36_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr36_q, xout => d_u0_m0_wo0_wi0_r0_delayr36_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_14_shift2(BITSHIFT,513)@11
    u0_m0_wo0_mtree_mult1_14_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr36_q_11_q & "00000000000";
    u0_m0_wo0_mtree_mult1_14_shift2_q <= u0_m0_wo0_mtree_mult1_14_shift2_qint(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_shift0(BITSHIFT,511)@10
    u0_m0_wo0_mtree_mult1_14_shift0_qint <= u0_m0_wo0_wi0_r0_delayr36_q & "00";
    u0_m0_wo0_mtree_mult1_14_shift0_q <= u0_m0_wo0_mtree_mult1_14_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_sub_1(SUB,512)@10 + 1
    u0_m0_wo0_mtree_mult1_14_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr36_q(15)) & u0_m0_wo0_wi0_r0_delayr36_q));
    u0_m0_wo0_mtree_mult1_14_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_14_shift0_q(17)) & u0_m0_wo0_mtree_mult1_14_shift0_q));
    u0_m0_wo0_mtree_mult1_14_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_14_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_sub_1_q <= u0_m0_wo0_mtree_mult1_14_sub_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_14_add_3(ADD,514)@11 + 1
    u0_m0_wo0_mtree_mult1_14_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 19 => u0_m0_wo0_mtree_mult1_14_sub_1_q(18)) & u0_m0_wo0_mtree_mult1_14_sub_1_q));
    u0_m0_wo0_mtree_mult1_14_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_14_shift2_q(26)) & u0_m0_wo0_mtree_mult1_14_shift2_q));
    u0_m0_wo0_mtree_mult1_14_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_14_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_14_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_14_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_14_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_14_add_3_q <= u0_m0_wo0_mtree_mult1_14_add_3_o(27 downto 0);

    -- u0_m0_wo0_mtree_add0_7(ADD,182)@12 + 1
    u0_m0_wo0_mtree_add0_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo0_mtree_mult1_14_add_3_q(27)) & u0_m0_wo0_mtree_mult1_14_add_3_q));
    u0_m0_wo0_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_15_q(29)) & u0_m0_wo0_mtree_mult1_15_q));
    u0_m0_wo0_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_7_a) + SIGNED(u0_m0_wo0_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_q <= u0_m0_wo0_mtree_add0_7_o(30 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr37(DELAY,56)@10
    u0_m0_wo0_wi0_r0_delayr37 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr36_q, xout => u0_m0_wo0_wi0_r0_delayr37_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr37_q_12(DELAY,1097)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr37_q_12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr37_q, xout => d_u0_m0_wo0_wi0_r0_delayr37_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_13_shift0(BITSHIFT,515)@12
    u0_m0_wo0_mtree_mult1_13_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr37_q_12_q & "0000000";
    u0_m0_wo0_mtree_mult1_13_shift0_q <= u0_m0_wo0_mtree_mult1_13_shift0_qint(22 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr38(DELAY,57)@10
    u0_m0_wo0_wi0_r0_delayr38 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr37_q, xout => u0_m0_wo0_wi0_r0_delayr38_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_12(MULT,162)@10 + 2
    u0_m0_wo0_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_q);
    u0_m0_wo0_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr38_q);
    u0_m0_wo0_mtree_mult1_12_reset <= areset;
    u0_m0_wo0_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 12,
        lpm_widthb => 16,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_12_a0,
        datab => u0_m0_wo0_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_12_s1
    );
    u0_m0_wo0_mtree_mult1_12_q <= u0_m0_wo0_mtree_mult1_12_s1;

    -- u0_m0_wo0_mtree_add0_6(ADD,181)@12 + 1
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_12_q(27)) & u0_m0_wo0_mtree_mult1_12_q));
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 23 => u0_m0_wo0_mtree_mult1_13_shift0_q(22)) & u0_m0_wo0_mtree_mult1_13_shift0_q));
    u0_m0_wo0_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_3(ADD,203)@13 + 1
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo0_mtree_add0_6_q(28)) & u0_m0_wo0_mtree_add0_6_q));
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add0_7_q(30)) & u0_m0_wo0_mtree_add0_7_q));
    u0_m0_wo0_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(31 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift2(BITSHIFT,526)@10
    u0_m0_wo0_mtree_mult1_11_shift2_qint <= u0_m0_wo0_wi0_r0_delayr39_q & "00000";
    u0_m0_wo0_mtree_mult1_11_shift2_q <= u0_m0_wo0_mtree_mult1_11_shift2_qint(20 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr39(DELAY,58)@10
    u0_m0_wo0_wi0_r0_delayr39 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr38_q, xout => u0_m0_wo0_wi0_r0_delayr39_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_11_add_3(ADD,527)@10 + 1
    u0_m0_wo0_mtree_mult1_11_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr39_q(15)) & u0_m0_wo0_wi0_r0_delayr39_q));
    u0_m0_wo0_mtree_mult1_11_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_11_shift2_q(20)) & u0_m0_wo0_mtree_mult1_11_shift2_q));
    u0_m0_wo0_mtree_mult1_11_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_11_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_add_3_q <= u0_m0_wo0_mtree_mult1_11_add_3_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift4(BITSHIFT,528)@11
    u0_m0_wo0_mtree_mult1_11_shift4_qint <= u0_m0_wo0_mtree_mult1_11_add_3_q & "00000";
    u0_m0_wo0_mtree_mult1_11_shift4_q <= u0_m0_wo0_mtree_mult1_11_shift4_qint(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift0(BITSHIFT,524)@10
    u0_m0_wo0_mtree_mult1_11_shift0_qint <= u0_m0_wo0_wi0_r0_delayr39_q & "00";
    u0_m0_wo0_mtree_mult1_11_shift0_q <= u0_m0_wo0_mtree_mult1_11_shift0_qint(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_add_1(ADD,525)@10 + 1
    u0_m0_wo0_mtree_mult1_11_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr39_q(15)) & u0_m0_wo0_wi0_r0_delayr39_q));
    u0_m0_wo0_mtree_mult1_11_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_11_shift0_q(17)) & u0_m0_wo0_mtree_mult1_11_shift0_q));
    u0_m0_wo0_mtree_mult1_11_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_11_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_add_1_q <= u0_m0_wo0_mtree_mult1_11_add_1_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_sub_5(SUB,529)@11 + 1
    u0_m0_wo0_mtree_mult1_11_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 19 => u0_m0_wo0_mtree_mult1_11_add_1_q(18)) & u0_m0_wo0_mtree_mult1_11_add_1_q));
    u0_m0_wo0_mtree_mult1_11_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_11_shift4_q(26)) & u0_m0_wo0_mtree_mult1_11_shift4_q));
    u0_m0_wo0_mtree_mult1_11_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_sub_5_q <= u0_m0_wo0_mtree_mult1_11_sub_5_o(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift6(BITSHIFT,530)@12
    u0_m0_wo0_mtree_mult1_11_shift6_qint <= u0_m0_wo0_mtree_mult1_11_sub_5_q & "0";
    u0_m0_wo0_mtree_mult1_11_shift6_q <= u0_m0_wo0_mtree_mult1_11_shift6_qint(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_shift2(BITSHIFT,533)@10
    u0_m0_wo0_mtree_mult1_10_shift2_qint <= u0_m0_wo0_wi0_r0_delayr40_q & "00";
    u0_m0_wo0_mtree_mult1_10_shift2_q <= u0_m0_wo0_mtree_mult1_10_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr40(DELAY,59)@10
    u0_m0_wo0_wi0_r0_delayr40 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr39_q, xout => u0_m0_wo0_wi0_r0_delayr40_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_10_add_3(ADD,534)@10 + 1
    u0_m0_wo0_mtree_mult1_10_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr40_q(15)) & u0_m0_wo0_wi0_r0_delayr40_q));
    u0_m0_wo0_mtree_mult1_10_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_10_shift2_q(17)) & u0_m0_wo0_mtree_mult1_10_shift2_q));
    u0_m0_wo0_mtree_mult1_10_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_10_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_add_3_q <= u0_m0_wo0_mtree_mult1_10_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_shift4(BITSHIFT,535)@11
    u0_m0_wo0_mtree_mult1_10_shift4_qint <= u0_m0_wo0_mtree_mult1_10_add_3_q & "000000000";
    u0_m0_wo0_mtree_mult1_10_shift4_q <= u0_m0_wo0_mtree_mult1_10_shift4_qint(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_shift0(BITSHIFT,531)@10
    u0_m0_wo0_mtree_mult1_10_shift0_qint <= u0_m0_wo0_wi0_r0_delayr40_q & "00000";
    u0_m0_wo0_mtree_mult1_10_shift0_q <= u0_m0_wo0_mtree_mult1_10_shift0_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_sub_1(SUB,532)@10 + 1
    u0_m0_wo0_mtree_mult1_10_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_10_shift0_q(20)) & u0_m0_wo0_mtree_mult1_10_shift0_q));
    u0_m0_wo0_mtree_mult1_10_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr40_q(15)) & u0_m0_wo0_wi0_r0_delayr40_q));
    u0_m0_wo0_mtree_mult1_10_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_10_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_sub_1_q <= u0_m0_wo0_mtree_mult1_10_sub_1_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_sub_5(SUB,536)@11 + 1
    u0_m0_wo0_mtree_mult1_10_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_10_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_10_sub_1_q));
    u0_m0_wo0_mtree_mult1_10_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_10_shift4_q(27)) & u0_m0_wo0_mtree_mult1_10_shift4_q));
    u0_m0_wo0_mtree_mult1_10_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_10_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_sub_5_q <= u0_m0_wo0_mtree_mult1_10_sub_5_o(28 downto 0);

    -- u0_m0_wo0_mtree_add0_5(ADD,180)@12 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_10_sub_5_q(28)) & u0_m0_wo0_mtree_mult1_10_sub_5_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_11_shift6_q(28)) & u0_m0_wo0_mtree_mult1_11_shift6_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(29 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr41(DELAY,60)@10
    u0_m0_wo0_wi0_r0_delayr41 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr40_q, xout => u0_m0_wo0_wi0_r0_delayr41_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_9(MULT,165)@10 + 2
    u0_m0_wo0_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo0_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr41_q);
    u0_m0_wo0_mtree_mult1_9_reset <= areset;
    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_9_a0,
        datab => u0_m0_wo0_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

    -- u0_m0_wo0_wi0_r0_delayr42(DELAY,61)@10
    u0_m0_wo0_wi0_r0_delayr42 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr41_q, xout => u0_m0_wo0_wi0_r0_delayr42_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_8(MULT,166)@10 + 2
    u0_m0_wo0_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_q);
    u0_m0_wo0_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr42_q);
    u0_m0_wo0_mtree_mult1_8_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_8_a0,
        datab => u0_m0_wo0_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

    -- u0_m0_wo0_mtree_add0_4(ADD,179)@12 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_8_q(28)) & u0_m0_wo0_mtree_mult1_8_q));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_9_q(28)) & u0_m0_wo0_mtree_mult1_9_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(29 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,202)@13 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_4_q(29)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_5_q(29)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(30 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,214)@14 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo0_mtree_add1_2_q(30)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_add1_3_q(31)) & u0_m0_wo0_mtree_add1_3_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(32 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr43(DELAY,62)@10
    u0_m0_wo0_wi0_r0_delayr43 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr42_q, xout => u0_m0_wo0_wi0_r0_delayr43_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_7(MULT,167)@10 + 2
    u0_m0_wo0_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q);
    u0_m0_wo0_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr43_q);
    u0_m0_wo0_mtree_mult1_7_reset <= areset;
    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 13,
        lpm_widthb => 16,
        lpm_widthp => 29,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_7_a0,
        datab => u0_m0_wo0_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

    -- u0_m0_wo0_mtree_mult1_6_shift2(BITSHIFT,565)@10
    u0_m0_wo0_mtree_mult1_6_shift2_qint <= u0_m0_wo0_wi0_r0_delayr44_q & "000";
    u0_m0_wo0_mtree_mult1_6_shift2_q <= u0_m0_wo0_mtree_mult1_6_shift2_qint(18 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr44(DELAY,63)@10
    u0_m0_wo0_wi0_r0_delayr44 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr43_q, xout => u0_m0_wo0_wi0_r0_delayr44_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_6_sub_3(SUB,566)@10 + 1
    u0_m0_wo0_mtree_mult1_6_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr44_q(15)) & u0_m0_wo0_wi0_r0_delayr44_q));
    u0_m0_wo0_mtree_mult1_6_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_6_shift2_q(18)) & u0_m0_wo0_mtree_mult1_6_shift2_q));
    u0_m0_wo0_mtree_mult1_6_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_6_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_sub_3_q <= u0_m0_wo0_mtree_mult1_6_sub_3_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift4(BITSHIFT,567)@11
    u0_m0_wo0_mtree_mult1_6_shift4_qint <= u0_m0_wo0_mtree_mult1_6_sub_3_q & "000000";
    u0_m0_wo0_mtree_mult1_6_shift4_q <= u0_m0_wo0_mtree_mult1_6_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift0(BITSHIFT,563)@10
    u0_m0_wo0_mtree_mult1_6_shift0_qint <= u0_m0_wo0_wi0_r0_delayr44_q & "0000";
    u0_m0_wo0_mtree_mult1_6_shift0_q <= u0_m0_wo0_mtree_mult1_6_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_add_1(ADD,564)@10 + 1
    u0_m0_wo0_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr44_q(15)) & u0_m0_wo0_wi0_r0_delayr44_q));
    u0_m0_wo0_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_6_shift0_q(19)) & u0_m0_wo0_mtree_mult1_6_shift0_q));
    u0_m0_wo0_mtree_mult1_6_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_1_q <= u0_m0_wo0_mtree_mult1_6_add_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_add_5(ADD,568)@11 + 1
    u0_m0_wo0_mtree_mult1_6_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_6_add_1_q(20)) & u0_m0_wo0_mtree_mult1_6_add_1_q));
    u0_m0_wo0_mtree_mult1_6_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_6_shift4_q(25)) & u0_m0_wo0_mtree_mult1_6_shift4_q));
    u0_m0_wo0_mtree_mult1_6_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_5_q <= u0_m0_wo0_mtree_mult1_6_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_shift6(BITSHIFT,569)@12
    u0_m0_wo0_mtree_mult1_6_shift6_qint <= u0_m0_wo0_mtree_mult1_6_add_5_q & "00";
    u0_m0_wo0_mtree_mult1_6_shift6_q <= u0_m0_wo0_mtree_mult1_6_shift6_qint(28 downto 0);

    -- u0_m0_wo0_mtree_add0_3(ADD,178)@12 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_6_shift6_q(28)) & u0_m0_wo0_mtree_mult1_6_shift6_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_7_q(28)) & u0_m0_wo0_mtree_mult1_7_q));
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(29 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift2(BITSHIFT,572)@10
    u0_m0_wo0_mtree_mult1_5_shift2_qint <= u0_m0_wo0_wi0_r0_delayr45_q & "00";
    u0_m0_wo0_mtree_mult1_5_shift2_q <= u0_m0_wo0_mtree_mult1_5_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr45(DELAY,64)@10
    u0_m0_wo0_wi0_r0_delayr45 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr44_q, xout => u0_m0_wo0_wi0_r0_delayr45_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_5_add_3(ADD,573)@10 + 1
    u0_m0_wo0_mtree_mult1_5_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr45_q(15)) & u0_m0_wo0_wi0_r0_delayr45_q));
    u0_m0_wo0_mtree_mult1_5_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_5_shift2_q(17)) & u0_m0_wo0_mtree_mult1_5_shift2_q));
    u0_m0_wo0_mtree_mult1_5_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_5_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_add_3_q <= u0_m0_wo0_mtree_mult1_5_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift4(BITSHIFT,574)@11
    u0_m0_wo0_mtree_mult1_5_shift4_qint <= u0_m0_wo0_mtree_mult1_5_add_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_5_shift4_q <= u0_m0_wo0_mtree_mult1_5_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift0(BITSHIFT,570)@10
    u0_m0_wo0_mtree_mult1_5_shift0_qint <= u0_m0_wo0_wi0_r0_delayr45_q & "0000";
    u0_m0_wo0_mtree_mult1_5_shift0_q <= u0_m0_wo0_mtree_mult1_5_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_1(SUB,571)@10 + 1
    u0_m0_wo0_mtree_mult1_5_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr45_q(15)) & u0_m0_wo0_wi0_r0_delayr45_q));
    u0_m0_wo0_mtree_mult1_5_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_5_shift0_q(19)) & u0_m0_wo0_mtree_mult1_5_shift0_q));
    u0_m0_wo0_mtree_mult1_5_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_1_q <= u0_m0_wo0_mtree_mult1_5_sub_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_5(SUB,575)@11 + 1
    u0_m0_wo0_mtree_mult1_5_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_5_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_5_sub_1_q));
    u0_m0_wo0_mtree_mult1_5_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_5_shift4_q(25)) & u0_m0_wo0_mtree_mult1_5_shift4_q));
    u0_m0_wo0_mtree_mult1_5_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_5_q <= u0_m0_wo0_mtree_mult1_5_sub_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift6(BITSHIFT,576)@12
    u0_m0_wo0_mtree_mult1_5_shift6_qint <= u0_m0_wo0_mtree_mult1_5_sub_5_q & "0";
    u0_m0_wo0_mtree_mult1_5_shift6_q <= u0_m0_wo0_mtree_mult1_5_shift6_qint(27 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr46(DELAY,65)@10
    u0_m0_wo0_wi0_r0_delayr46 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr45_q, xout => u0_m0_wo0_wi0_r0_delayr46_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_4(MULT,170)@10 + 2
    u0_m0_wo0_mtree_mult1_4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr46_q);
    u0_m0_wo0_mtree_mult1_4_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 11,
        lpm_widthb => 16,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_4_a0,
        datab => u0_m0_wo0_mtree_mult1_4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_4_s1
    );
    u0_m0_wo0_mtree_mult1_4_q <= u0_m0_wo0_mtree_mult1_4_s1;

    -- u0_m0_wo0_mtree_add0_2(ADD,177)@12 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo0_mtree_mult1_4_q(26)) & u0_m0_wo0_mtree_mult1_4_q));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_5_shift6_q(27)) & u0_m0_wo0_mtree_mult1_5_shift6_q));
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,201)@13 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_add0_2_q(28)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_3_q(29)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(30 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift2(BITSHIFT,587)@10
    u0_m0_wo0_mtree_mult1_3_shift2_qint <= u0_m0_wo0_wi0_r0_delayr47_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift2_q <= u0_m0_wo0_mtree_mult1_3_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr47(DELAY,66)@10
    u0_m0_wo0_wi0_r0_delayr47 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr46_q, xout => u0_m0_wo0_wi0_r0_delayr47_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_3_add_3(ADD,588)@10 + 1
    u0_m0_wo0_mtree_mult1_3_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr47_q(15)) & u0_m0_wo0_wi0_r0_delayr47_q));
    u0_m0_wo0_mtree_mult1_3_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_3_shift2_q(17)) & u0_m0_wo0_mtree_mult1_3_shift2_q));
    u0_m0_wo0_mtree_mult1_3_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_3_q <= u0_m0_wo0_mtree_mult1_3_add_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift4(BITSHIFT,589)@11
    u0_m0_wo0_mtree_mult1_3_shift4_qint <= u0_m0_wo0_mtree_mult1_3_add_3_q & "00000";
    u0_m0_wo0_mtree_mult1_3_shift4_q <= u0_m0_wo0_mtree_mult1_3_shift4_qint(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,585)@10
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= u0_m0_wo0_wi0_r0_delayr47_q & "000";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_1(SUB,586)@10 + 1
    u0_m0_wo0_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_mult1_3_shift0_q(18)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => u0_m0_wo0_wi0_r0_delayr47_q(15)) & u0_m0_wo0_wi0_r0_delayr47_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_1_q <= u0_m0_wo0_mtree_mult1_3_sub_1_o(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_5(SUB,590)@11 + 1
    u0_m0_wo0_mtree_mult1_3_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => u0_m0_wo0_mtree_mult1_3_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_3_sub_1_q));
    u0_m0_wo0_mtree_mult1_3_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_3_shift4_q(23)) & u0_m0_wo0_mtree_mult1_3_shift4_q));
    u0_m0_wo0_mtree_mult1_3_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_5_q <= u0_m0_wo0_mtree_mult1_3_sub_5_o(24 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift6(BITSHIFT,591)@12
    u0_m0_wo0_mtree_mult1_3_shift6_qint <= u0_m0_wo0_mtree_mult1_3_sub_5_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift6_q <= u0_m0_wo0_mtree_mult1_3_shift6_qint(26 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift2(BITSHIFT,594)@10
    u0_m0_wo0_mtree_mult1_2_shift2_qint <= u0_m0_wo0_wi0_r0_delayr48_q & "00";
    u0_m0_wo0_mtree_mult1_2_shift2_q <= u0_m0_wo0_mtree_mult1_2_shift2_qint(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr48(DELAY,67)@10
    u0_m0_wo0_wi0_r0_delayr48 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr47_q, xout => u0_m0_wo0_wi0_r0_delayr48_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_2_sub_3(SUB,595)@10 + 1
    u0_m0_wo0_mtree_mult1_2_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_wi0_r0_delayr48_q(15)) & u0_m0_wo0_wi0_r0_delayr48_q));
    u0_m0_wo0_mtree_mult1_2_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_mult1_2_shift2_q(17)) & u0_m0_wo0_mtree_mult1_2_shift2_q));
    u0_m0_wo0_mtree_mult1_2_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_2_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_sub_3_q <= u0_m0_wo0_mtree_mult1_2_sub_3_o(18 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift4(BITSHIFT,596)@11
    u0_m0_wo0_mtree_mult1_2_shift4_qint <= u0_m0_wo0_mtree_mult1_2_sub_3_q & "0000000";
    u0_m0_wo0_mtree_mult1_2_shift4_q <= u0_m0_wo0_mtree_mult1_2_shift4_qint(25 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_shift0(BITSHIFT,592)@10
    u0_m0_wo0_mtree_mult1_2_shift0_qint <= u0_m0_wo0_wi0_r0_delayr48_q & "0000";
    u0_m0_wo0_mtree_mult1_2_shift0_q <= u0_m0_wo0_mtree_mult1_2_shift0_qint(19 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_add_1(ADD,593)@10 + 1
    u0_m0_wo0_mtree_mult1_2_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => u0_m0_wo0_wi0_r0_delayr48_q(15)) & u0_m0_wo0_wi0_r0_delayr48_q));
    u0_m0_wo0_mtree_mult1_2_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_mult1_2_shift0_q(19)) & u0_m0_wo0_mtree_mult1_2_shift0_q));
    u0_m0_wo0_mtree_mult1_2_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_add_1_q <= u0_m0_wo0_mtree_mult1_2_add_1_o(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_add_5(ADD,597)@11 + 1
    u0_m0_wo0_mtree_mult1_2_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 21 => u0_m0_wo0_mtree_mult1_2_add_1_q(20)) & u0_m0_wo0_mtree_mult1_2_add_1_q));
    u0_m0_wo0_mtree_mult1_2_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_mult1_2_shift4_q(25)) & u0_m0_wo0_mtree_mult1_2_shift4_q));
    u0_m0_wo0_mtree_mult1_2_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_add_5_q <= u0_m0_wo0_mtree_mult1_2_add_5_o(26 downto 0);

    -- u0_m0_wo0_mtree_add0_1(ADD,176)@12 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_2_add_5_q(26)) & u0_m0_wo0_mtree_mult1_2_add_5_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_3_shift6_q(26)) & u0_m0_wo0_mtree_mult1_3_shift6_q));
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(27 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr49(DELAY,68)@10
    u0_m0_wo0_wi0_r0_delayr49 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr48_q, xout => u0_m0_wo0_wi0_r0_delayr49_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr49_q_11(DELAY,1098)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr49_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr49_q, xout => d_u0_m0_wo0_wi0_r0_delayr49_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,600)@11
    u0_m0_wo0_mtree_mult1_1_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr49_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,598)@10
    u0_m0_wo0_mtree_mult1_1_shift0_qint <= u0_m0_wo0_wi0_r0_delayr49_q & "00000";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_sub_1(SUB,599)@10 + 1
    u0_m0_wo0_mtree_mult1_1_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_1_shift0_q(20)) & u0_m0_wo0_mtree_mult1_1_shift0_q));
    u0_m0_wo0_mtree_mult1_1_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr49_q(15)) & u0_m0_wo0_wi0_r0_delayr49_q));
    u0_m0_wo0_mtree_mult1_1_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_sub_1_q <= u0_m0_wo0_mtree_mult1_1_sub_1_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_sub_3(SUB,601)@11 + 1
    u0_m0_wo0_mtree_mult1_1_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo0_mtree_mult1_1_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_1_sub_1_q));
    u0_m0_wo0_mtree_mult1_1_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_1_shift2_q(22)) & u0_m0_wo0_mtree_mult1_1_shift2_q));
    u0_m0_wo0_mtree_mult1_1_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_1_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_sub_3_q <= u0_m0_wo0_mtree_mult1_1_sub_3_o(23 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift4(BITSHIFT,602)@12
    u0_m0_wo0_mtree_mult1_1_shift4_qint <= u0_m0_wo0_mtree_mult1_1_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_1_shift4_q <= u0_m0_wo0_mtree_mult1_1_shift4_qint(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr50(DELAY,69)@10
    u0_m0_wo0_wi0_r0_delayr50 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr49_q, xout => u0_m0_wo0_wi0_r0_delayr50_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr50_q_11(DELAY,1099)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr50_q_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr50_q, xout => d_u0_m0_wo0_wi0_r0_delayr50_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_shift2(BITSHIFT,605)@11
    u0_m0_wo0_mtree_mult1_0_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr50_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_0_shift2_q <= u0_m0_wo0_mtree_mult1_0_shift2_qint(22 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,603)@10
    u0_m0_wo0_mtree_mult1_0_shift0_qint <= u0_m0_wo0_wi0_r0_delayr50_q & "00000";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_qint(20 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_sub_1(SUB,604)@10 + 1
    u0_m0_wo0_mtree_mult1_0_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_mult1_0_shift0_q(20)) & u0_m0_wo0_mtree_mult1_0_shift0_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_wi0_r0_delayr50_q(15)) & u0_m0_wo0_wi0_r0_delayr50_q));
    u0_m0_wo0_mtree_mult1_0_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_sub_1_q <= u0_m0_wo0_mtree_mult1_0_sub_1_o(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_sub_3(SUB,606)@11 + 1
    u0_m0_wo0_mtree_mult1_0_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => u0_m0_wo0_mtree_mult1_0_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_0_sub_1_q));
    u0_m0_wo0_mtree_mult1_0_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_mult1_0_shift2_q(22)) & u0_m0_wo0_mtree_mult1_0_shift2_q));
    u0_m0_wo0_mtree_mult1_0_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_0_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_sub_3_q <= u0_m0_wo0_mtree_mult1_0_sub_3_o(23 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,175)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => u0_m0_wo0_mtree_mult1_0_sub_3_q(23)) & u0_m0_wo0_mtree_mult1_0_sub_3_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_1_shift4_q(24)) & u0_m0_wo0_mtree_mult1_1_shift4_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(25 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,200)@13 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo0_mtree_add0_0_q(25)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add0_1_q(27)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(28 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,213)@14 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo0_mtree_add1_0_q(28)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add1_1_q(30)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(31 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,219)@15 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo0_mtree_add2_0_q(31)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add2_1_q(32)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(33 downto 0);

    -- u0_m0_wo0_mtree_add4_0(ADD,222)@16 + 1
    u0_m0_wo0_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 34 => u0_m0_wo0_mtree_add3_0_q(33)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => u0_m0_wo0_mtree_add3_1_q(35)) & u0_m0_wo0_mtree_add3_1_q));
    u0_m0_wo0_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_a) + SIGNED(u0_m0_wo0_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_q <= u0_m0_wo0_mtree_add4_0_o(36 downto 0);

    -- u0_m0_wo0_mtree_add5_0(ADD,224)@17 + 1
    u0_m0_wo0_mtree_add5_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => u0_m0_wo0_mtree_add4_0_q(36)) & u0_m0_wo0_mtree_add4_0_q));
    u0_m0_wo0_mtree_add5_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 36 => u0_m0_wo0_mtree_add4_1_q(35)) & u0_m0_wo0_mtree_add4_1_q));
    u0_m0_wo0_mtree_add5_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add5_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add5_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add5_0_a) + SIGNED(u0_m0_wo0_mtree_add5_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add5_0_q <= u0_m0_wo0_mtree_add5_0_o(37 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_17(DELAY,1087)@10 + 7
    d_u0_m0_wo0_compute_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,225)@17 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_17_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,230)@18 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add5_0_q;

END normal;
