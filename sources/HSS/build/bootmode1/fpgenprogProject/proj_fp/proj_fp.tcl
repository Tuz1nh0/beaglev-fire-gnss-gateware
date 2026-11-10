open_project -project {/home/renato/Documents/gateware_Blinky/sources/HSS/build/bootmode1/fpgenprogProject/proj_fp/proj_fp.pro} -connect_programmers {FALSE}
load_programming_data -name {target} -header {/home/renato/Documents/gateware_Blinky/sources/HSS/build/bootmode1/fpgenprogProject/target.hdr} -envm {/home/renato/Documents/gateware_Blinky/sources/HSS/build/bootmode1/fpgenprogProject/envm.efc} -spm {/home/renato/Documents/gateware_Blinky/sources/HSS/build/bootmode1/fpgenprogProject/target.spm} -dca {/home/renato/Documents/gateware_Blinky/sources/HSS/build/bootmode1/fpgenprogProject/target.dca}
export_single_ppd -name {target} -file {/home/renato/Documents/gateware_Blinky/sources/HSS/build/bootmode1/fpgenprogProject/proj_fp/target.ppd}
save_project
close_project
