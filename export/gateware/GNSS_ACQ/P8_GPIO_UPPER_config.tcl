# Creating SmartDesign "P8_GPIO_UPPER"
set sd_name {P8_GPIO_UPPER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_bif_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_bif_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_bif_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIF_1_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIF_1_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIF_1_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_3_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_4_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_5_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_7_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_9_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {OCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_bif_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_bif_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIF_1_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIF_1_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_10_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_11_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_12_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_13_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_14_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_15_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_6_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_8_PAD} -port_direction {OUT} -port_is_pad {1}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_bif_PADDR} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_bif_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BIF_1_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BIF_1_PWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_bif_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BIF_1_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {INT} -port_direction {OUT} -port_range {[15:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_bif} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_bif_PADDR" \
"PSELx:APB_bif_PSEL" \
"PENABLE:APB_bif_PENABLE" \
"PWRITE:APB_bif_PWRITE" \
"PRDATA:APB_bif_PRDATA" \
"PWDATA:APB_bif_PWDATA" \
"PREADY:APB_bif_PREADY" \
"PSLVERR:APB_bif_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {BIF_1} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:BIF_1_PADDR" \
"PSELx:BIF_1_PSEL" \
"PENABLE:BIF_1_PENABLE" \
"PWRITE:BIF_1_PWRITE" \
"PRDATA:BIF_1_PRDATA" \
"PWDATA:BIF_1_PWDATA" \
"PREADY:BIF_1_PREADY" \
"PSLVERR:BIF_1_PSLVERR" } 

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {INT} -value {GND}
# Add Acquisition_Core_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Acquisition_Core} -instance_name {Acquisition_Core_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Acquisition_Core_0:MAX_INPUT_I} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Acquisition_Core_0:MAX_INPUT_I} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Acquisition_Core_0:MAX_INPUT_Q} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Acquisition_Core_0:MAX_INPUT_Q} -pin_slices {[1:1]}



# Add GNSS_MAX2771_signal_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {GNSS_MAX2771_signal} -instance_name {GNSS_MAX2771_signal_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GNSS_MAX2771_signal_0:I_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GNSS_MAX2771_signal_0:I_OUT} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GNSS_MAX2771_signal_0:Q_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GNSS_MAX2771_signal_0:Q_OUT} -pin_slices {[1:1]}



# Add INBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_0}



# Add INBUF_0_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_0_0}



# Add INBUF_0_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_0_1}



# Add INBUF_0_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_0_2}



# Add INBUF_0_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_0_3}



# Add INBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_1}



# Add INBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF} -instance_name {INBUF_2}



# Add OUTBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_0}



# Add OUTBUF_0_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_0_0}



# Add OUTBUF_0_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_0_1}



# Add OUTBUF_0_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_0_2}



# Add OUTBUF_0_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_0_3}



# Add OUTBUF_0_4 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_0_4}



# Add OUTBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_1}



# Add OUTBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OUTBUF} -instance_name {OUTBUF_2}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:CA_CLKx4" "GNSS_MAX2771_signal_0:OCLK" "OCLK" "OUTBUF_0_4:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:CLK" "GNSS_MAX2771_signal_0:PCLK" "PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:MAX_INPUT_CLK" "INBUF_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:MAX_INPUT_I[0:0]" "INBUF_0_2:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:MAX_INPUT_I[1:1]" "INBUF_0_3:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:MAX_INPUT_Q[0:0]" "INBUF_0_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:MAX_INPUT_Q[1:1]" "INBUF_0_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:NRST" "GNSS_MAX2771_signal_0:PRESETN" "PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:I_OUT[0:0]" "OUTBUF_0_0:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:I_OUT[1:1]" "OUTBUF_0_1:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:PLL_LOCK" "PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:Q_OUT[0:0]" "OUTBUF_0_2:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:Q_OUT[1:1]" "OUTBUF_0_3:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:VALID_OUT" "OUTBUF_0:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_10_PAD" "OUTBUF_0_1:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_11_PAD" "OUTBUF_1:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_12_PAD" "OUTBUF_0_2:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_13_PAD" "OUTBUF_2:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_14_PAD" "OUTBUF_0_3:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_15_PAD" "OUTBUF_0_4:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_1_PAD" "INBUF_0:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_PAD" "INBUF_1:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_3_PAD" "INBUF_0_3:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_4_PAD" "INBUF_2:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_5_PAD" "INBUF_0_2:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_6_PAD" "OUTBUF_0:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_7_PAD" "INBUF_0_1:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_8_PAD" "OUTBUF_0_0:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_9_PAD" "INBUF_0_0:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INBUF_1:Y" "OUTBUF_1:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INBUF_2:Y" "OUTBUF_2:D" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_bif" "GNSS_MAX2771_signal_0:BIF_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:BIF_1" "BIF_1" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "P8_GPIO_UPPER"
generate_component -component_name ${sd_name}
