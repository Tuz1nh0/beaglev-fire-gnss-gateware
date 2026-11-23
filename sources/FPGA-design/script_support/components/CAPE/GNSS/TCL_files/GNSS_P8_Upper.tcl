# Exporting core GNSS_P8_Upper to TCL
# Exporting Create HDL core command for module GNSS_P8_Upper
create_hdl_core -file {hdl/GNSS_P8_Upper.vhd} -module {GNSS_P8_Upper} -library {work} -package {}
# Exporting BIF information of  HDL core command for module GNSS_P8_Upper
hdl_core_add_bif -hdl_core_name {GNSS_P8_Upper} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {\
"PADDR:PADDR" \
"PENABLE:PENABLE" \
"PWRITE:PWRITE" \
"PRDATA:PRDATA" \
"PWDATA:PWDATA" \
"PREADY:PREADY" \
"PSLVERR:PSLVERR" \
"PSELx:PSEL" }
