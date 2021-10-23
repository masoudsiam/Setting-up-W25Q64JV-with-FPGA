/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "M:/github/fpga/W25Q64JV/MainProgram/Output_Data_Collector.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919437128_1035706684(char *, char *, char *, char *, int );


static void work_a_3180080529_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 6496);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 6624);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(44, ng0);
    t1 = xsi_get_transient_memory(64U);
    memset(t1, 0, 64U);
    t2 = t1;
    memset(t2, (unsigned char)2, 64U);
    t5 = (t0 + 6688);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 64U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(45, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 6752);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 6816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(47, ng0);
    t1 = xsi_get_transient_memory(6U);
    memset(t1, 0, 6U);
    t2 = t1;
    memset(t2, (unsigned char)2, 6U);
    t5 = (t0 + 6880);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 6U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2632U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t2 = (t0 + 6624);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    *((unsigned char *)t13) = t12;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 6688);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 64U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 6752);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6816);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 6880);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 6U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

}

static void work_a_3180080529_3212880686_p_1(char *t0)
{
    char t16[16];
    char t17[16];
    char t22[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    char *t23;
    int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB6, &&LAB7};

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6944);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 7008);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 64U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 7072);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 7136);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 6U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 7200);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 7264);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 6512);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(66, ng0);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t8 = *((unsigned char *)t5);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB2;

LAB4:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 6944);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11140U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 0);
    if (t3 != 0)
        goto LAB11;

LAB13:
LAB12:    goto LAB2;

LAB5:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 7200);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = (64 - 1);
    t13 = (63 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t4 = (t0 + 7072);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = (64 - 9);
    t13 = (63 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t4 = (t0 + 11444);
    t7 = ((IEEE_P_2592010699) + 4024);
    t10 = (t17 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 55;
    t11 = (t10 + 4U);
    *((int *)t11) = 0;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t20 = (0 - 55);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t21;
    t11 = (t22 + 0U);
    t18 = (t11 + 0U);
    *((int *)t18) = 0;
    t18 = (t11 + 4U);
    *((int *)t18) = 7;
    t18 = (t11 + 8U);
    *((int *)t18) = 1;
    t24 = (7 - 0);
    t21 = (t24 * 1);
    t21 = (t21 + 1);
    t18 = (t11 + 12U);
    *((unsigned int *)t18) = t21;
    t6 = xsi_base_array_concat(t6, t16, t7, (char)97, t1, t17, (char)97, t4, t22, (char)101);
    t21 = (56U + 8U);
    t3 = (64U != t21);
    if (t3 == 1)
        goto LAB18;

LAB19:    t18 = (t0 + 7008);
    t19 = (t18 + 56U);
    t23 = *((char **)t19);
    t25 = (t23 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t6, 64U);
    xsi_driver_first_trans_fast(t18);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11140U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 7);
    if (t3 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 6944);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11140U);
    t4 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t16, t2, t1, 8);
    t5 = (t16 + 12U);
    t13 = *((unsigned int *)t5);
    t14 = (1U * t13);
    t3 = (6U != t14);
    if (t3 == 1)
        goto LAB23;

LAB24:    t6 = (t0 + 7136);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t18 = *((char **)t11);
    memcpy(t18, t4, 6U);
    xsi_driver_first_trans_fast(t6);

LAB21:    goto LAB2;

LAB6:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t8 = (t3 == (unsigned char)3);
    if (t8 != 0)
        goto LAB25;

LAB27:
LAB26:    goto LAB2;

LAB7:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 6944);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 7264);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(67, ng0);
    t4 = (t0 + 6944);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 7008);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 64U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(69, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t4 = (t0 + 7072);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 7136);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 6U);
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

LAB11:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 11412);
    t6 = (t0 + 2792U);
    t7 = *((char **)t6);
    t12 = (64 - 33);
    t13 = (63 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t6 = (t7 + t15);
    t11 = ((IEEE_P_2592010699) + 4024);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 31;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (31 - 0);
    t21 = (t20 * 1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t19 = (t22 + 0U);
    t23 = (t19 + 0U);
    *((int *)t23) = 31;
    t23 = (t19 + 4U);
    *((int *)t23) = 0;
    t23 = (t19 + 8U);
    *((int *)t23) = -1;
    t24 = (0 - 31);
    t21 = (t24 * -1);
    t21 = (t21 + 1);
    t23 = (t19 + 12U);
    *((unsigned int *)t23) = t21;
    t10 = xsi_base_array_concat(t10, t16, t11, (char)97, t4, t17, (char)97, t6, t22, (char)101);
    t21 = (32U + 32U);
    t8 = (64U != t21);
    if (t8 == 1)
        goto LAB14;

LAB15:    t23 = (t0 + 7008);
    t25 = (t23 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t10, 64U);
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11140U);
    t4 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t16, t2, t1, 31);
    t5 = (t16 + 12U);
    t13 = *((unsigned int *)t5);
    t14 = (1U * t13);
    t3 = (6U != t14);
    if (t3 == 1)
        goto LAB16;

LAB17:    t6 = (t0 + 7136);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t18 = *((char **)t11);
    memcpy(t18, t4, 6U);
    xsi_driver_first_trans_fast(t6);
    goto LAB12;

LAB14:    xsi_size_not_matching(64U, t21, 0);
    goto LAB15;

LAB16:    xsi_size_not_matching(6U, t14, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(64U, t21, 0);
    goto LAB19;

LAB20:    xsi_set_current_line(83, ng0);
    t4 = (t0 + 6944);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)4;
    xsi_driver_first_trans_fast(t4);
    goto LAB21;

LAB23:    xsi_size_not_matching(6U, t14, 0);
    goto LAB24;

LAB25:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 7200);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = (64 - 1);
    t13 = (63 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t4 = (t0 + 7072);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = (64 - 9);
    t13 = (63 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t4 = (t0 + 11452);
    t7 = ((IEEE_P_2592010699) + 4024);
    t10 = (t17 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 55;
    t11 = (t10 + 4U);
    *((int *)t11) = 0;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t20 = (0 - 55);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t21;
    t11 = (t22 + 0U);
    t18 = (t11 + 0U);
    *((int *)t18) = 0;
    t18 = (t11 + 4U);
    *((int *)t18) = 7;
    t18 = (t11 + 8U);
    *((int *)t18) = 1;
    t24 = (7 - 0);
    t21 = (t24 * 1);
    t21 = (t21 + 1);
    t18 = (t11 + 12U);
    *((unsigned int *)t18) = t21;
    t6 = xsi_base_array_concat(t6, t16, t7, (char)97, t1, t17, (char)97, t4, t22, (char)101);
    t21 = (56U + 8U);
    t3 = (64U != t21);
    if (t3 == 1)
        goto LAB28;

LAB29:    t18 = (t0 + 7008);
    t19 = (t18 + 56U);
    t23 = *((char **)t19);
    t25 = (t23 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t6, 64U);
    xsi_driver_first_trans_fast(t18);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11140U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 7);
    if (t3 != 0)
        goto LAB30;

LAB32:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11140U);
    t4 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t16, t2, t1, 8);
    t5 = (t16 + 12U);
    t13 = *((unsigned int *)t5);
    t14 = (1U * t13);
    t3 = (6U != t14);
    if (t3 == 1)
        goto LAB33;

LAB34:    t6 = (t0 + 7136);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t18 = *((char **)t11);
    memcpy(t18, t4, 6U);
    xsi_driver_first_trans_fast(t6);

LAB31:    goto LAB26;

LAB28:    xsi_size_not_matching(64U, t21, 0);
    goto LAB29;

LAB30:    xsi_set_current_line(94, ng0);
    t4 = (t0 + 6944);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)4;
    xsi_driver_first_trans_fast(t4);
    goto LAB31;

LAB33:    xsi_size_not_matching(6U, t14, 0);
    goto LAB34;

}

static void work_a_3180080529_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(105, ng0);

LAB3:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 7328);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 6528);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3180080529_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(106, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7392);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 6544);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3180080529_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3180080529_3212880686_p_0,(void *)work_a_3180080529_3212880686_p_1,(void *)work_a_3180080529_3212880686_p_2,(void *)work_a_3180080529_3212880686_p_3};
	xsi_register_didat("work_a_3180080529_3212880686", "isim/Output_Data_Collector_sim_isim_beh.exe.sim/work/a_3180080529_3212880686.didat");
	xsi_register_executes(pe);
}
