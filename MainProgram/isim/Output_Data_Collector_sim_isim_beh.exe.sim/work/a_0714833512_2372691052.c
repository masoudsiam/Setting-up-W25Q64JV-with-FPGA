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
static const char *ng0 = "M:/github/fpga/W25Q64JV/MainProgram/Output_Data_Collector_sim.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0714833512_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3400);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 4432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3400);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0714833512_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    char *t7;
    unsigned char t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 3840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 7660);
    *((int *)t2) = 1;
    t3 = (t0 + 7664);
    *((int *)t3) = 10;
    t4 = 1;
    t5 = 10;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 4496);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 7668);
    t6 = (t0 + 4560);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 64U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 7732);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 6U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(77, ng0);

LAB15:    t2 = (t0 + 4176);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB5:    xsi_set_current_line(71, ng0);

LAB10:    t6 = (t0 + 4160);
    *((int *)t6) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 7660);
    t4 = *((int *)t2);
    t3 = (t0 + 7664);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB12:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 7660);
    *((int *)t6) = t4;
    goto LAB4;

LAB8:    t9 = (t0 + 4160);
    *((int *)t9) = 0;
    goto LAB6;

LAB9:    t7 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t7, 0U, 0U);
    if (t8 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB13:    t6 = (t0 + 4176);
    *((int *)t6) = 0;
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 4688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(79, ng0);

LAB19:    t2 = (t0 + 4192);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB14:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB13;
    else
        goto LAB15;

LAB16:    goto LAB14;

LAB17:    t6 = (t0 + 4192);
    *((int *)t6) = 0;
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 4688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 7738);
    *((int *)t2) = 1;
    t3 = (t0 + 7742);
    *((int *)t3) = 100;
    t4 = 1;
    t5 = 100;

LAB21:    if (t4 <= t5)
        goto LAB22;

LAB24:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(85, ng0);

LAB32:    t2 = (t0 + 4224);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB18:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB17;
    else
        goto LAB19;

LAB20:    goto LAB18;

LAB22:    xsi_set_current_line(82, ng0);

LAB27:    t6 = (t0 + 4208);
    *((int *)t6) = 1;
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB23:    t2 = (t0 + 7738);
    t4 = *((int *)t2);
    t3 = (t0 + 7742);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB24;

LAB29:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 7738);
    *((int *)t6) = t4;
    goto LAB21;

LAB25:    t9 = (t0 + 4208);
    *((int *)t9) = 0;
    goto LAB23;

LAB26:    t7 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t7, 0U, 0U);
    if (t8 == 1)
        goto LAB25;
    else
        goto LAB27;

LAB28:    goto LAB26;

LAB30:    t6 = (t0 + 4224);
    *((int *)t6) = 0;
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 7746);
    *((int *)t2) = 1;
    t3 = (t0 + 7750);
    *((int *)t3) = 100;
    t4 = 1;
    t5 = 100;

LAB34:    if (t4 <= t5)
        goto LAB35;

LAB37:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(91, ng0);

LAB45:    t2 = (t0 + 4256);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB46;
    goto LAB1;

LAB31:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB30;
    else
        goto LAB32;

LAB33:    goto LAB31;

LAB35:    xsi_set_current_line(88, ng0);

LAB40:    t6 = (t0 + 4240);
    *((int *)t6) = 1;
    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB36:    t2 = (t0 + 7746);
    t4 = *((int *)t2);
    t3 = (t0 + 7750);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB37;

LAB42:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 7746);
    *((int *)t6) = t4;
    goto LAB34;

LAB38:    t9 = (t0 + 4240);
    *((int *)t9) = 0;
    goto LAB36;

LAB39:    t7 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t7, 0U, 0U);
    if (t8 == 1)
        goto LAB38;
    else
        goto LAB40;

LAB41:    goto LAB39;

LAB43:    t6 = (t0 + 4256);
    *((int *)t6) = 0;
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 7754);
    *((int *)t2) = 1;
    t3 = (t0 + 7758);
    *((int *)t3) = 10;
    t4 = 1;
    t5 = 10;

LAB47:    if (t4 <= t5)
        goto LAB48;

LAB50:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 7762);
    t6 = (t0 + 4560);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 64U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 7826);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 6U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(99, ng0);

LAB58:    t2 = (t0 + 4288);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB44:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB43;
    else
        goto LAB45;

LAB46:    goto LAB44;

LAB48:    xsi_set_current_line(94, ng0);

LAB53:    t6 = (t0 + 4272);
    *((int *)t6) = 1;
    *((char **)t1) = &&LAB54;
    goto LAB1;

LAB49:    t2 = (t0 + 7754);
    t4 = *((int *)t2);
    t3 = (t0 + 7758);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB50;

LAB55:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 7754);
    *((int *)t6) = t4;
    goto LAB47;

LAB51:    t9 = (t0 + 4272);
    *((int *)t9) = 0;
    goto LAB49;

LAB52:    t7 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t7, 0U, 0U);
    if (t8 == 1)
        goto LAB51;
    else
        goto LAB53;

LAB54:    goto LAB52;

LAB56:    t6 = (t0 + 4288);
    *((int *)t6) = 0;
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 4688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(101, ng0);

LAB62:    t2 = (t0 + 4304);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB57:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB56;
    else
        goto LAB58;

LAB59:    goto LAB57;

LAB60:    t6 = (t0 + 4304);
    *((int *)t6) = 0;
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 7832);
    *((int *)t2) = 1;
    t3 = (t0 + 7836);
    *((int *)t3) = 100;
    t4 = 1;
    t5 = 100;

LAB64:    if (t4 <= t5)
        goto LAB65;

LAB67:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);

LAB75:    t2 = (t0 + 4336);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB76;
    goto LAB1;

LAB61:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB60;
    else
        goto LAB62;

LAB63:    goto LAB61;

LAB65:    xsi_set_current_line(104, ng0);

LAB70:    t6 = (t0 + 4320);
    *((int *)t6) = 1;
    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB66:    t2 = (t0 + 7832);
    t4 = *((int *)t2);
    t3 = (t0 + 7836);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB67;

LAB72:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 7832);
    *((int *)t6) = t4;
    goto LAB64;

LAB68:    t9 = (t0 + 4320);
    *((int *)t9) = 0;
    goto LAB66;

LAB69:    t7 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t7, 0U, 0U);
    if (t8 == 1)
        goto LAB68;
    else
        goto LAB70;

LAB71:    goto LAB69;

LAB73:    t6 = (t0 + 4336);
    *((int *)t6) = 0;
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 7840);
    *((int *)t2) = 1;
    t3 = (t0 + 7844);
    *((int *)t3) = 100;
    t4 = 1;
    t5 = 100;

LAB77:    if (t4 <= t5)
        goto LAB78;

LAB80:    goto LAB2;

LAB74:    t3 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t8 == 1)
        goto LAB73;
    else
        goto LAB75;

LAB76:    goto LAB74;

LAB78:    xsi_set_current_line(110, ng0);

LAB83:    t6 = (t0 + 4352);
    *((int *)t6) = 1;
    *((char **)t1) = &&LAB84;
    goto LAB1;

LAB79:    t2 = (t0 + 7840);
    t4 = *((int *)t2);
    t3 = (t0 + 7844);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB80;

LAB85:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 7840);
    *((int *)t6) = t4;
    goto LAB77;

LAB81:    t9 = (t0 + 4352);
    *((int *)t9) = 0;
    goto LAB79;

LAB82:    t7 = (t0 + 992U);
    t8 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t7, 0U, 0U);
    if (t8 == 1)
        goto LAB81;
    else
        goto LAB83;

LAB84:    goto LAB82;

}


extern void work_a_0714833512_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0714833512_2372691052_p_0,(void *)work_a_0714833512_2372691052_p_1};
	xsi_register_didat("work_a_0714833512_2372691052", "isim/Output_Data_Collector_sim_isim_beh.exe.sim/work/a_0714833512_2372691052.didat");
	xsi_register_executes(pe);
}
