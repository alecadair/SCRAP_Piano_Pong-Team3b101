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
static const char *ng0 = "C:/Users/u0725062/Desktop/NEWPROJECTFINAL/latestversion/alu_reg_mem_pc/vga_timing.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {0U, 0U};



static void Cont_46_0(char *t0)
{
    char t5[8];
    char t20[8];
    char t28[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    int t52;
    int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;

LAB0:    t1 = (t0 + 4736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t4 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t6) != 0)
        goto LAB6;

LAB7:    t13 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB8;

LAB9:    memcpy(t28, t5, 8);

LAB10:    t60 = (t0 + 5664);
    t61 = (t60 + 56U);
    t62 = *((char **)t61);
    t63 = (t62 + 56U);
    t64 = *((char **)t63);
    memset(t64, 0, 8);
    t65 = 1U;
    t66 = t65;
    t67 = (t28 + 4);
    t68 = *((unsigned int *)t28);
    t65 = (t65 & t68);
    t69 = *((unsigned int *)t67);
    t66 = (t66 & t69);
    t70 = (t64 + 4);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t71 | t65);
    t72 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t72 | t66);
    xsi_driver_vfirst_trans(t60, 0, 0);
    t73 = (t0 + 5552);
    *((int *)t73) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB6:    t12 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 3496);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t20, 0, 8);
    t21 = (t19 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t19);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t21) != 0)
        goto LAB13;

LAB14:    t29 = *((unsigned int *)t5);
    t30 = *((unsigned int *)t20);
    t31 = (t29 & t30);
    *((unsigned int *)t28) = t31;
    t32 = (t5 + 4);
    t33 = (t20 + 4);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t32);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t38 = *((unsigned int *)t34);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB10;

LAB11:    *((unsigned int *)t20) = 1;
    goto LAB14;

LAB13:    t27 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB14;

LAB15:    t40 = *((unsigned int *)t28);
    t41 = *((unsigned int *)t34);
    *((unsigned int *)t28) = (t40 | t41);
    t42 = (t5 + 4);
    t43 = (t20 + 4);
    t44 = *((unsigned int *)t5);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t47 = (~(t46));
    t48 = *((unsigned int *)t20);
    t49 = (~(t48));
    t50 = *((unsigned int *)t43);
    t51 = (~(t50));
    t52 = (t45 & t47);
    t53 = (t49 & t51);
    t54 = (~(t52));
    t55 = (~(t53));
    t56 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t56 & t54);
    t57 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t57 & t55);
    t58 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t58 & t54);
    t59 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t59 & t55);
    goto LAB17;

}

static void Always_48_1(char *t0)
{
    char t10[8];
    char t12[8];
    char t14[8];
    char t15[8];
    char t28[8];
    char t33[8];
    char t36[8];
    char t44[8];
    char t87[8];
    char t89[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t34;
    char *t35;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    int t68;
    int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t88;

LAB0:    t1 = (t0 + 4984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 5568);
    *((int *)t2) = 1;
    t3 = (t0 + 5016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(48, ng0);

LAB5:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 3656);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t7 = (t0 + 608);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t8, 32, t9, 32);
    t7 = (t0 + 744);
    t11 = *((char **)t7);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_add(t12, 32, t10, 32, t11, 32);
    t7 = (t0 + 880);
    t13 = *((char **)t7);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t12, 32, t13, 32);
    memset(t15, 0, 8);
    t7 = (t6 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB7;

LAB6:    t16 = (t14 + 4);
    if (*((unsigned int *)t16) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) < *((unsigned int *)t14))
        goto LAB8;

LAB9:    t18 = (t15 + 4);
    t19 = *((unsigned int *)t18);
    t20 = (~(t19));
    t21 = *((unsigned int *)t15);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(52, ng0);

LAB15:    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1016);
    t6 = *((char **)t5);
    t5 = (t0 + 1152);
    t7 = *((char **)t5);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t6, 32, t7, 32);
    t5 = (t0 + 1288);
    t8 = *((char **)t5);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_add(t12, 32, t10, 32, t8, 32);
    t5 = (t0 + 1424);
    t9 = *((char **)t5);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t12, 32, t9, 32);
    memset(t15, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB17;

LAB16:    t11 = (t14 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB17;

LAB20:    if (*((unsigned int *)t4) < *((unsigned int *)t14))
        goto LAB18;

LAB19:    t16 = (t15 + 4);
    t19 = *((unsigned int *)t16);
    t20 = (~(t19));
    t21 = *((unsigned int *)t15);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(57, ng0);

LAB25:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);

LAB23:
LAB13:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 880);
    t6 = *((char **)t5);
    t5 = (t0 + 744);
    t7 = *((char **)t5);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t6, 32, t7, 32);
    memset(t12, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB27;

LAB26:    t8 = (t10 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB27;

LAB30:    if (*((unsigned int *)t4) < *((unsigned int *)t10))
        goto LAB29;

LAB28:    *((unsigned int *)t12) = 1;

LAB29:    memset(t14, 0, 8);
    t11 = (t12 + 4);
    t19 = *((unsigned int *)t11);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t11) != 0)
        goto LAB33;

LAB34:    t16 = (t14 + 4);
    t30 = *((unsigned int *)t14);
    t31 = *((unsigned int *)t16);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB35;

LAB36:    memcpy(t44, t14, 8);

LAB37:    t76 = (t44 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (~(t77));
    t79 = *((unsigned int *)t44);
    t80 = (t79 & t78);
    t81 = (t80 != 0);
    if (t81 > 0)
        goto LAB50;

LAB51:    xsi_set_current_line(67, ng0);

LAB54:    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3336);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB52:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1424);
    t6 = *((char **)t5);
    t5 = (t0 + 1288);
    t7 = *((char **)t5);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t6, 32, t7, 32);
    memset(t12, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB56;

LAB55:    t8 = (t10 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB56;

LAB59:    if (*((unsigned int *)t4) < *((unsigned int *)t10))
        goto LAB58;

LAB57:    *((unsigned int *)t12) = 1;

LAB58:    memset(t14, 0, 8);
    t11 = (t12 + 4);
    t19 = *((unsigned int *)t11);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t11) != 0)
        goto LAB62;

LAB63:    t16 = (t14 + 4);
    t30 = *((unsigned int *)t14);
    t31 = *((unsigned int *)t16);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB64;

LAB65:    memcpy(t44, t14, 8);

LAB66:    t76 = (t44 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (~(t77));
    t79 = *((unsigned int *)t44);
    t80 = (t79 & t78);
    t81 = (t80 != 0);
    if (t81 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(77, ng0);

LAB83:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3176);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB81:    goto LAB2;

LAB7:    t17 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t15) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(49, ng0);

LAB14:    xsi_set_current_line(50, ng0);
    t24 = (t0 + 3656);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng1)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_add(t28, 32, t26, 11, t27, 32);
    t29 = (t0 + 3656);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 11, 0LL);
    goto LAB13;

LAB17:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB19;

LAB18:    *((unsigned int *)t15) = 1;
    goto LAB19;

LAB21:    xsi_set_current_line(54, ng0);

LAB24:    xsi_set_current_line(55, ng0);
    t17 = (t0 + 3816);
    t18 = (t17 + 56U);
    t24 = *((char **)t18);
    t25 = ((char*)((ng1)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_add(t28, 32, t24, 11, t25, 32);
    t26 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t26, t28, 0, 0, 11, 0LL);
    goto LAB23;

LAB27:    t9 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB29;

LAB31:    *((unsigned int *)t14) = 1;
    goto LAB34;

LAB33:    t13 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB34;

LAB35:    t17 = (t0 + 3656);
    t18 = (t17 + 56U);
    t24 = *((char **)t18);
    t25 = (t0 + 880);
    t26 = *((char **)t25);
    t25 = (t0 + 744);
    t27 = *((char **)t25);
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t26, 32, t27, 32);
    t25 = (t0 + 472);
    t29 = *((char **)t25);
    memset(t28, 0, 8);
    xsi_vlog_unsigned_add(t28, 32, t15, 32, t29, 32);
    memset(t33, 0, 8);
    t25 = (t24 + 4);
    if (*((unsigned int *)t25) != 0)
        goto LAB39;

LAB38:    t34 = (t28 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB39;

LAB42:    if (*((unsigned int *)t24) < *((unsigned int *)t28))
        goto LAB40;

LAB41:    memset(t36, 0, 8);
    t37 = (t33 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t33);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t37) != 0)
        goto LAB45;

LAB46:    t45 = *((unsigned int *)t14);
    t46 = *((unsigned int *)t36);
    t47 = (t45 & t46);
    *((unsigned int *)t44) = t47;
    t48 = (t14 + 4);
    t49 = (t36 + 4);
    t50 = (t44 + 4);
    t51 = *((unsigned int *)t48);
    t52 = *((unsigned int *)t49);
    t53 = (t51 | t52);
    *((unsigned int *)t50) = t53;
    t54 = *((unsigned int *)t50);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB47;

LAB48:
LAB49:    goto LAB37;

LAB39:    t35 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB41;

LAB40:    *((unsigned int *)t33) = 1;
    goto LAB41;

LAB43:    *((unsigned int *)t36) = 1;
    goto LAB46;

LAB45:    t43 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB46;

LAB47:    t56 = *((unsigned int *)t44);
    t57 = *((unsigned int *)t50);
    *((unsigned int *)t44) = (t56 | t57);
    t58 = (t14 + 4);
    t59 = (t36 + 4);
    t60 = *((unsigned int *)t14);
    t61 = (~(t60));
    t62 = *((unsigned int *)t58);
    t63 = (~(t62));
    t64 = *((unsigned int *)t36);
    t65 = (~(t64));
    t66 = *((unsigned int *)t59);
    t67 = (~(t66));
    t68 = (t61 & t63);
    t69 = (t65 & t67);
    t70 = (~(t68));
    t71 = (~(t69));
    t72 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t72 & t70);
    t73 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t73 & t71);
    t74 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t74 & t70);
    t75 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t75 & t71);
    goto LAB49;

LAB50:    xsi_set_current_line(63, ng0);

LAB53:    xsi_set_current_line(64, ng0);
    t82 = (t0 + 3656);
    t83 = (t82 + 56U);
    t84 = *((char **)t83);
    t85 = (t0 + 880);
    t86 = *((char **)t85);
    memset(t87, 0, 8);
    xsi_vlog_unsigned_minus(t87, 32, t84, 11, t86, 32);
    t85 = (t0 + 744);
    t88 = *((char **)t85);
    memset(t89, 0, 8);
    xsi_vlog_unsigned_minus(t89, 32, t87, 32, t88, 32);
    t85 = (t0 + 3016);
    xsi_vlogvar_wait_assign_value(t85, t89, 0, 0, 10, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3336);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB52;

LAB56:    t9 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB58;

LAB60:    *((unsigned int *)t14) = 1;
    goto LAB63;

LAB62:    t13 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB63;

LAB64:    t17 = (t0 + 3816);
    t18 = (t17 + 56U);
    t24 = *((char **)t18);
    t25 = (t0 + 1424);
    t26 = *((char **)t25);
    t25 = (t0 + 1288);
    t27 = *((char **)t25);
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t26, 32, t27, 32);
    t25 = (t0 + 1016);
    t29 = *((char **)t25);
    memset(t28, 0, 8);
    xsi_vlog_unsigned_add(t28, 32, t15, 32, t29, 32);
    memset(t33, 0, 8);
    t25 = (t24 + 4);
    if (*((unsigned int *)t25) != 0)
        goto LAB68;

LAB67:    t34 = (t28 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB68;

LAB71:    if (*((unsigned int *)t24) < *((unsigned int *)t28))
        goto LAB69;

LAB70:    memset(t36, 0, 8);
    t37 = (t33 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t33);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t37) != 0)
        goto LAB74;

LAB75:    t45 = *((unsigned int *)t14);
    t46 = *((unsigned int *)t36);
    t47 = (t45 & t46);
    *((unsigned int *)t44) = t47;
    t48 = (t14 + 4);
    t49 = (t36 + 4);
    t50 = (t44 + 4);
    t51 = *((unsigned int *)t48);
    t52 = *((unsigned int *)t49);
    t53 = (t51 | t52);
    *((unsigned int *)t50) = t53;
    t54 = *((unsigned int *)t50);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB76;

LAB77:
LAB78:    goto LAB66;

LAB68:    t35 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB70;

LAB69:    *((unsigned int *)t33) = 1;
    goto LAB70;

LAB72:    *((unsigned int *)t36) = 1;
    goto LAB75;

LAB74:    t43 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB75;

LAB76:    t56 = *((unsigned int *)t44);
    t57 = *((unsigned int *)t50);
    *((unsigned int *)t44) = (t56 | t57);
    t58 = (t14 + 4);
    t59 = (t36 + 4);
    t60 = *((unsigned int *)t14);
    t61 = (~(t60));
    t62 = *((unsigned int *)t58);
    t63 = (~(t62));
    t64 = *((unsigned int *)t36);
    t65 = (~(t64));
    t66 = *((unsigned int *)t59);
    t67 = (~(t66));
    t68 = (t61 & t63);
    t69 = (t65 & t67);
    t70 = (~(t68));
    t71 = (~(t69));
    t72 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t72 & t70);
    t73 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t73 & t71);
    t74 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t74 & t70);
    t75 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t75 & t71);
    goto LAB78;

LAB79:    xsi_set_current_line(73, ng0);

LAB82:    xsi_set_current_line(74, ng0);
    t82 = (t0 + 3816);
    t83 = (t82 + 56U);
    t84 = *((char **)t83);
    t85 = (t0 + 1424);
    t86 = *((char **)t85);
    memset(t87, 0, 8);
    xsi_vlog_unsigned_minus(t87, 32, t84, 11, t86, 32);
    t85 = (t0 + 1288);
    t88 = *((char **)t85);
    memset(t89, 0, 8);
    xsi_vlog_unsigned_minus(t89, 32, t87, 32, t88, 32);
    t85 = (t0 + 3176);
    xsi_vlogvar_wait_assign_value(t85, t89, 0, 0, 10, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB81;

}

static void Always_83_2(char *t0)
{
    char t8[8];
    char t12[8];
    char t29[8];
    char t32[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;

LAB0:    t1 = (t0 + 5232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 5584);
    *((int *)t2) = 1;
    t3 = (t0 + 5264);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(83, ng0);

LAB5:    xsi_set_current_line(84, ng0);
    t4 = (t0 + 3656);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) < *((unsigned int *)t7))
        goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;

LAB9:    memset(t12, 0, 8);
    t13 = (t8 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t13) != 0)
        goto LAB13;

LAB14:    t20 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB15;

LAB16:    memcpy(t40, t12, 8);

LAB17:    t72 = (t40 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(87, ng0);

LAB34:    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2696);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB32:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB36;

LAB35:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB36;

LAB39:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB38;

LAB37:    *((unsigned int *)t8) = 1;

LAB38:    memset(t12, 0, 8);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t10) != 0)
        goto LAB42;

LAB43:    t13 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB44;

LAB45:    memcpy(t40, t12, 8);

LAB46:    t54 = (t40 + 4);
    t73 = *((unsigned int *)t54);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(94, ng0);

LAB63:    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2856);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB61:    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB11:    *((unsigned int *)t12) = 1;
    goto LAB14;

LAB13:    t19 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB14;

LAB15:    t24 = (t0 + 3656);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t0 + 880);
    t28 = *((char **)t27);
    memset(t29, 0, 8);
    t27 = (t26 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB19;

LAB18:    t30 = (t28 + 4);
    if (*((unsigned int *)t30) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t26) < *((unsigned int *)t28))
        goto LAB20;

LAB21:    memset(t32, 0, 8);
    t33 = (t29 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t33) != 0)
        goto LAB25;

LAB26:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t44 = (t12 + 4);
    t45 = (t32 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t44);
    t48 = *((unsigned int *)t45);
    t49 = (t47 | t48);
    *((unsigned int *)t46) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB27;

LAB28:
LAB29:    goto LAB17;

LAB19:    t31 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB21;

LAB20:    *((unsigned int *)t29) = 1;
    goto LAB21;

LAB23:    *((unsigned int *)t32) = 1;
    goto LAB26;

LAB25:    t39 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB26;

LAB27:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t40) = (t52 | t53);
    t54 = (t12 + 4);
    t55 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t55);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB29;

LAB30:    xsi_set_current_line(84, ng0);

LAB33:    xsi_set_current_line(85, ng0);
    t78 = ((char*)((ng2)));
    t79 = (t0 + 2696);
    xsi_vlogvar_wait_assign_value(t79, t78, 0, 0, 1, 0LL);
    goto LAB32;

LAB36:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB38;

LAB40:    *((unsigned int *)t12) = 1;
    goto LAB43;

LAB42:    t11 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB43;

LAB44:    t19 = (t0 + 3816);
    t20 = (t19 + 56U);
    t24 = *((char **)t20);
    t25 = (t0 + 1424);
    t26 = *((char **)t25);
    memset(t29, 0, 8);
    t25 = (t24 + 4);
    if (*((unsigned int *)t25) != 0)
        goto LAB48;

LAB47:    t27 = (t26 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB48;

LAB51:    if (*((unsigned int *)t24) < *((unsigned int *)t26))
        goto LAB49;

LAB50:    memset(t32, 0, 8);
    t30 = (t29 + 4);
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t30) != 0)
        goto LAB54;

LAB55:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t33 = (t12 + 4);
    t39 = (t32 + 4);
    t44 = (t40 + 4);
    t47 = *((unsigned int *)t33);
    t48 = *((unsigned int *)t39);
    t49 = (t47 | t48);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t44);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB56;

LAB57:
LAB58:    goto LAB46;

LAB48:    t28 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB50;

LAB49:    *((unsigned int *)t29) = 1;
    goto LAB50;

LAB52:    *((unsigned int *)t32) = 1;
    goto LAB55;

LAB54:    t31 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB55;

LAB56:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t44);
    *((unsigned int *)t40) = (t52 | t53);
    t45 = (t12 + 4);
    t46 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t46);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t68 & t66);
    t69 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB58;

LAB59:    xsi_set_current_line(91, ng0);

LAB62:    xsi_set_current_line(92, ng0);
    t55 = ((char*)((ng2)));
    t72 = (t0 + 2856);
    xsi_vlogvar_wait_assign_value(t72, t55, 0, 0, 1, 0LL);
    goto LAB61;

}


extern void work_m_00000000002021606410_3218638664_init()
{
	static char *pe[] = {(void *)Cont_46_0,(void *)Always_48_1,(void *)Always_83_2};
	xsi_register_didat("work_m_00000000002021606410_3218638664", "isim/GameSim_isim_beh.exe.sim/work/m_00000000002021606410_3218638664.didat");
	xsi_register_executes(pe);
}
