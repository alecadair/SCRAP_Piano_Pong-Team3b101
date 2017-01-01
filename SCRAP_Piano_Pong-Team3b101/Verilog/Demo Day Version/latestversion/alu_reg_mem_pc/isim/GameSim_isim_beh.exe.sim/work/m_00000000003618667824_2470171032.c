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
static const char *ng0 = "C:/Users/u0725062/Desktop/NEWPROJECTFINAL/latestversion/alu_reg_mem_pc/VGA_Module.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {7, 0};
static unsigned int ng4[] = {6U, 0U};
static int ng5[] = {6, 0};
static unsigned int ng6[] = {0U, 0U};
static unsigned int ng7[] = {142U, 0U};
static unsigned int ng8[] = {16383U, 0U};



static void Cont_48_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 5568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6976);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Cont_49_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 5816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7040);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Always_51_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 6064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 6880);
    *((int *)t2) = 1;
    t3 = (t0 + 6096);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 4648);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 8, 0LL);
    goto LAB2;

}

static void Always_55_3(char *t0)
{
    char t8[8];
    char t15[8];
    char t38[8];
    char t44[8];
    char t68[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    int t75;
    int t76;
    int t77;
    int t78;
    int t79;
    int t80;
    int t81;
    int t82;

LAB0:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 6896);
    *((int *)t2) = 1;
    t3 = (t0 + 6344);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 4648);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t8 + 4);
    t4 = (t3 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (t9 >> 0);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    *((unsigned int *)t2) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    t6 = (t8 + 4);
    t7 = (t5 + 4);
    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t5);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t6);
    t20 = *((unsigned int *)t7);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t6);
    t24 = *((unsigned int *)t7);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB7;

LAB6:    if (t25 != 0)
        goto LAB8;

LAB9:    t29 = (t15 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t15);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(71, ng0);

LAB40:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 4648);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB12:    goto LAB2;

LAB7:    *((unsigned int *)t15) = 1;
    goto LAB9;

LAB8:    t28 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(57, ng0);

LAB13:    xsi_set_current_line(58, ng0);
    t35 = (t0 + 4488);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t39 = (t0 + 4488);
    t40 = (t39 + 72U);
    t41 = *((char **)t40);
    t42 = ((char*)((ng2)));
    xsi_vlog_generic_get_index_select_value(t38, 32, t37, t41, 2, t42, 32, 1);
    t43 = ((char*)((ng1)));
    memset(t44, 0, 8);
    t45 = (t38 + 4);
    t46 = (t43 + 4);
    t47 = *((unsigned int *)t38);
    t48 = *((unsigned int *)t43);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t45);
    t51 = *((unsigned int *)t46);
    t52 = (t50 ^ t51);
    t53 = (t49 | t52);
    t54 = *((unsigned int *)t45);
    t55 = *((unsigned int *)t46);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t53 & t57);
    if (t58 != 0)
        goto LAB17;

LAB14:    if (t56 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t44) = 1;

LAB17:    t60 = (t44 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t44);
    t64 = (t63 & t62);
    t65 = (t64 != 0);
    if (t65 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(63, ng0);

LAB31:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_rshift(t8, 8, t4, 8, t5, 32);
    t6 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 8, 0LL);

LAB20:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t6);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t16 = (t11 | t14);
    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t7);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB35;

LAB32:    if (t19 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t8) = 1;

LAB35:    t29 = (t8 + 4);
    t22 = *((unsigned int *)t29);
    t23 = (~(t22));
    t24 = *((unsigned int *)t8);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB36;

LAB37:
LAB38:    goto LAB12;

LAB16:    t59 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(58, ng0);

LAB21:    xsi_set_current_line(59, ng0);
    t66 = ((char*)((ng1)));
    t67 = (t0 + 4648);
    t69 = (t0 + 4648);
    t70 = (t69 + 72U);
    t71 = *((char **)t70);
    t72 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t68, t71, 2, t72, 32, 1);
    t73 = (t68 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (!(t74));
    if (t75 == 1)
        goto LAB22;

LAB23:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t6);
    t13 = (t12 >> 1);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t7 = (t0 + 4648);
    t28 = (t0 + 4648);
    t29 = (t28 + 72U);
    t35 = *((char **)t29);
    t36 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t15, t35, 2, t36, 32, 1);
    t37 = (t15 + 4);
    t16 = *((unsigned int *)t37);
    t75 = (!(t16));
    if (t75 == 1)
        goto LAB24;

LAB25:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 2);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 2);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 63U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 63U);
    t7 = ((char*)((ng4)));
    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t7);
    t18 = (t16 ^ t17);
    *((unsigned int *)t15) = t18;
    t28 = (t8 + 4);
    t29 = (t7 + 4);
    t35 = (t15 + 4);
    t19 = *((unsigned int *)t28);
    t20 = *((unsigned int *)t29);
    t21 = (t19 | t20);
    *((unsigned int *)t35) = t21;
    t22 = *((unsigned int *)t35);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB26;

LAB27:
LAB28:    t36 = (t0 + 4648);
    t37 = (t0 + 4648);
    t39 = (t37 + 72U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng5)));
    t42 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t38, t44, t68, ((int*)(t40)), 2, t41, 32, 1, t42, 32, 1);
    t43 = (t38 + 4);
    t26 = *((unsigned int *)t43);
    t75 = (!(t26));
    t45 = (t44 + 4);
    t27 = *((unsigned int *)t45);
    t76 = (!(t27));
    t77 = (t75 && t76);
    t46 = (t68 + 4);
    t30 = *((unsigned int *)t46);
    t78 = (!(t30));
    t79 = (t77 && t78);
    if (t79 == 1)
        goto LAB29;

LAB30:    goto LAB20;

LAB22:    xsi_vlogvar_wait_assign_value(t67, t66, 0, *((unsigned int *)t68), 1, 0LL);
    goto LAB23;

LAB24:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t15), 1, 0LL);
    goto LAB25;

LAB26:    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t35);
    *((unsigned int *)t15) = (t24 | t25);
    goto LAB28;

LAB29:    t31 = *((unsigned int *)t68);
    t80 = (t31 + 0);
    t32 = *((unsigned int *)t38);
    t33 = *((unsigned int *)t44);
    t81 = (t32 - t33);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t36, t15, t80, *((unsigned int *)t44), t82, 0LL);
    goto LAB30;

LAB34:    t28 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB35;

LAB36:    xsi_set_current_line(66, ng0);

LAB39:    xsi_set_current_line(67, ng0);
    t35 = ((char*)((ng7)));
    t36 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t36, t35, 0, 0, 8, 0LL);
    goto LAB38;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 6560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng8)));
    t3 = (t0 + 7104);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 16383U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 13);

LAB1:    return;
}


extern void work_m_00000000003618667824_2470171032_init()
{
	static char *pe[] = {(void *)Cont_48_0,(void *)Cont_49_1,(void *)Always_51_2,(void *)Always_55_3,(void *)implSig1_execute};
	xsi_register_didat("work_m_00000000003618667824_2470171032", "isim/GameSim_isim_beh.exe.sim/work/m_00000000003618667824_2470171032.didat");
	xsi_register_executes(pe);
}
