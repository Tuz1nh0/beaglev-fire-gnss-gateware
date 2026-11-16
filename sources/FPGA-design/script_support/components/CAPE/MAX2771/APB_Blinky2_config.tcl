# Exporting core APB_Blinky2 to TCL
# Exporting Create HDL core command for module APB_Blinky2
create_hdl_core -file {hdl/APB_Blinky2.vhd} -module {APB_Blinky2} -library {work} -package {}
# Exporting BIF information of  HDL core command for module APB_Blinky2
hdl_core_add_bif -hdl_core_name {APB_Blinky2} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {\
"PADDR:PADDR" \
"PENABLE:PENABLE" \
"PWRITE:PWRITE" \
"PRDATA:PRDATA" \
"PWDATA:PWDATA" \
"PREADY:PREADY" \
"PSLVERR:PSLVERR" \
"PSELx:PSEL" }
