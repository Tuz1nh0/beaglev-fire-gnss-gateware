# Exporting core GNSS_MAX2771_signal to TCL
# Exporting Create HDL core command for module GNSS_MAX2771_signal
create_hdl_core -file {hdl/GNSS_MAX2771_signal.vhd} -module {GNSS_MAX2771_signal} -library {work} -package {}
# Exporting BIF information of  HDL core command for module GNSS_MAX2771_signal
hdl_core_add_bif -hdl_core_name {GNSS_MAX2771_signal} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {\
"PADDR:PADDR" \
"PENABLE:PENABLE" \
"PWRITE:PWRITE" \
"PRDATA:PRDATA" \
"PWDATA:PWDATA" \
"PREADY:PREADY" \
"PSLVERR:PSLVERR" \
"PSELx:PSEL" }
