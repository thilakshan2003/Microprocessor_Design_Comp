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
extern void execute_126(char*, char *);
extern void execute_125(char*, char *);
extern void execute_15(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_45(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_53(char*, char *);
extern void execute_55(char*, char *);
extern void execute_57(char*, char *);
extern void execute_60(char*, char *);
extern void execute_62(char*, char *);
extern void execute_78(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_122(char*, char *);
extern void execute_123(char*, char *);
extern void execute_124(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_5(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[26] = {(funcp)execute_126, (funcp)execute_125, (funcp)execute_15, (funcp)execute_24, (funcp)execute_25, (funcp)execute_19, (funcp)execute_20, (funcp)execute_45, (funcp)execute_50, (funcp)execute_51, (funcp)execute_53, (funcp)execute_55, (funcp)execute_57, (funcp)execute_60, (funcp)execute_62, (funcp)execute_78, (funcp)execute_82, (funcp)execute_83, (funcp)execute_84, (funcp)execute_85, (funcp)execute_122, (funcp)execute_123, (funcp)execute_124, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_5};
const int NumRelocateId= 26;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Nanoprocessor_TB_behav/xsim.reloc",  (void **)funcTab, 26);
	iki_vhdl_file_variable_register(dp + 18168);
	iki_vhdl_file_variable_register(dp + 18224);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Nanoprocessor_TB_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Nanoprocessor_TB_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/Nanoprocessor_TB_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Nanoprocessor_TB_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Nanoprocessor_TB_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
