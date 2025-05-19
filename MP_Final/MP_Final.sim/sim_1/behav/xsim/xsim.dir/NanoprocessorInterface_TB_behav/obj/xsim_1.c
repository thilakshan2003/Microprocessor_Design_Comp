/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_138(char*, char *);
extern void execute_139(char*, char *);
extern void execute_137(char*, char *);
extern void execute_133(char*, char *);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_54(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_59(char*, char *);
extern void execute_61(char*, char *);
extern void execute_63(char*, char *);
extern void execute_68(char*, char *);
extern void execute_70(char*, char *);
extern void execute_86(char*, char *);
extern void execute_90(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_132(char*, char *);
extern void execute_135(char*, char *);
extern void execute_136(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_8(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[31] = {(funcp)execute_138, (funcp)execute_139, (funcp)execute_137, (funcp)execute_133, (funcp)execute_23, (funcp)execute_24, (funcp)execute_33, (funcp)execute_34, (funcp)execute_28, (funcp)execute_29, (funcp)execute_54, (funcp)execute_56, (funcp)execute_57, (funcp)execute_59, (funcp)execute_61, (funcp)execute_63, (funcp)execute_68, (funcp)execute_70, (funcp)execute_86, (funcp)execute_90, (funcp)execute_91, (funcp)execute_92, (funcp)execute_93, (funcp)execute_130, (funcp)execute_131, (funcp)execute_132, (funcp)execute_135, (funcp)execute_136, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_8};
const int NumRelocateId= 31;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/NanoprocessorInterface_TB_behav/xsim.reloc",  (void **)funcTab, 31);
	iki_vhdl_file_variable_register(dp + 18712);
	iki_vhdl_file_variable_register(dp + 18768);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/NanoprocessorInterface_TB_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/NanoprocessorInterface_TB_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern int xsim_argc_copy ;
extern char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/NanoprocessorInterface_TB_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/NanoprocessorInterface_TB_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/NanoprocessorInterface_TB_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
