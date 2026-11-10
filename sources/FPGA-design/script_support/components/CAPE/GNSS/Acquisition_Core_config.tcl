# Exporting core Acquisition_Core to TCL
# Exporting Create HDL core command for module Acquisition_Core
create_hdl_core -file {/home/renato/Documents/ro-instrument/Implementacao_teste_GNSS/hdl/Acquisition_Core.vhd} -module {Acquisition_Core} -library {work} -package {}
# Exporting BIF information of  HDL core command for module Acquisition_Core
hdl_core_add_bif -hdl_core_name {Acquisition_Core} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {\
"PADDR:PADDR" \
"PENABLE:PENABLE" \
"PWRITE:PWRITE" \
"PRDATA:PRDATA" \
"PWDATA:PWDATA" \
"PREADY:PREADY" \
"PSLVERR:PSLVERR" \
"PSELx:PSEL" }
