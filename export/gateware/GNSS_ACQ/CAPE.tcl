# Creating SmartDesign "CAPE"
set sd_name {CAPE}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GNSS_PLL_LOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GNSS_PRN_CLKx4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_3_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_4_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_5_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_7_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_9_PAD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_10_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_11_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_12_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_13_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_14_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_15_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_6_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_8_PAD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN42} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_14} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_16} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN12} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN15} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN23} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN25} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN27} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN30} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN41} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OE} -port_direction {IN} -port_range {[27:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {IN} -port_range {[27:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_IN} -port_direction {OUT} -port_range {[27:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {INT} -port_direction {OUT} -port_range {[39:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_SLAVE_SLAVE_PADDR" \
"PSELx:APB_SLAVE_SLAVE_PSEL" \
"PENABLE:APB_SLAVE_SLAVE_PENABLE" \
"PWRITE:APB_SLAVE_SLAVE_PWRITE" \
"PRDATA:APB_SLAVE_SLAVE_PRDATA" \
"PWDATA:APB_SLAVE_SLAVE_PWDATA" \
"PREADY:APB_SLAVE_SLAVE_PREADY" \
"PSLVERR:APB_SLAVE_SLAVE_PSLVERR" } 

sd_create_pin_slices -sd_name ${sd_name} -pin_name {INT} -pin_slices {[15:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {INT} -pin_slices {[36:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {INT} -pin_slices {[39:37]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {INT[39:37]} -value {GND}
# Add ACQ_MOD_GPIO_IN_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {ACQ_MOD_GPIO_IN} -instance_name {ACQ_MOD_GPIO_IN_0}



# Add Acquisition_Core_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Acquisition_Core} -instance_name {Acquisition_Core_0}



# Add APB_Blinky2_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_Blinky2} -instance_name {APB_Blinky2_0}



# Add APB_Blinky_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_Blinky} -instance_name {APB_Blinky_0}



# Add APB_BUS_CONVERTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {APB_BUS_CONVERTER} -instance_name {APB_BUS_CONVERTER_0}



# Add blinky_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {blinky} -instance_name {blinky_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {blinky_0:gpio_out} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {blinky_0:gpio_enable} -value {GND}



# Add CAPE_DEFAULT_GPIOS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_DEFAULT_GPIOS} -instance_name {CAPE_DEFAULT_GPIOS}



# Add CoreAPB3_CAPE_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_CAPE} -instance_name {CoreAPB3_CAPE_0}



# Add GNSS_MAX2771_signal_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {GNSS_MAX2771_signal} -instance_name {GNSS_MAX2771_signal_0}



# Add GPIO_13_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_13_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_13_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_13_BIBUF:Y}



# Add GPIO_19_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_19_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_19_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_19_BIBUF:Y}



# Add P8_GPIO_UPPER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {P8_GPIO_UPPER} -instance_name {P8_GPIO_UPPER_0}



# Add P9_14_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {P9_14_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_14_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {P9_14_BIBUF:Y}



# Add P9_16_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {P9_16_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {P9_16_BIBUF:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {P9_16_BIBUF:Y}



# Add P9_GPIO_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {P9_GPIO} -instance_name {P9_GPIO_0}



# Add PWM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PWM_0:PWM_1}



# Add PWM_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_1}



# Add PWM_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_2}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACQ_MOD_GPIO_IN_0:MOD_GPIO_ACQ_CLK" "Acquisition_Core_0:MAX_INPUT_CLK" "blinky_0:BUTTON_LED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Blinky2_0:LED_OUT" "blinky_0:LED_APB2_VHD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Blinky2_0:PCLK" "APB_Blinky_0:PCLK" "Acquisition_Core_0:CLK" "GNSS_MAX2771_signal_0:PCLK" "P8_GPIO_UPPER_0:PCLK" "P9_GPIO_0:PCLK" "PCLK" "PWM_0:PCLK" "PWM_1:PCLK" "PWM_2:PCLK" "blinky_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Blinky2_0:PRESETN" "APB_Blinky_0:PRESETN" "Acquisition_Core_0:NRST" "GNSS_MAX2771_signal_0:PRESETN" "P8_GPIO_UPPER_0:PRESETN" "P9_GPIO_0:PRESETN" "PRESETN" "PWM_0:PRESETN" "PWM_1:PRESETN" "PWM_2:PRESETN" "blinky_0:resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Blinky_0:LED_OUT" "blinky_0:LED_APB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:CA_CLKx4" "GNSS_MAX2771_signal_0:OCLK" "GNSS_PRN_CLKx4" "P8_GPIO_UPPER_0:OCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:PLL_LOCK" "GNSS_PLL_LOCK" "P8_GPIO_UPPER_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:VALID_OUT" "blinky_0:GNSS_PRN_VALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_10_PAD" "P8_GPIO_UPPER_0:GPIO_10_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_11_PAD" "P8_GPIO_UPPER_0:GPIO_11_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_12_PAD" "P8_GPIO_UPPER_0:GPIO_12_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_13_BIBUF:D" "PWM_2:PWM_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_13_PAD" "P8_GPIO_UPPER_0:GPIO_13_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_14_PAD" "P8_GPIO_UPPER_0:GPIO_14_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_15_PAD" "P8_GPIO_UPPER_0:GPIO_15_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_19_BIBUF:D" "PWM_2:PWM_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_1_PAD" "P8_GPIO_UPPER_0:GPIO_1_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_PAD" "P8_GPIO_UPPER_0:GPIO_2_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_3_PAD" "P8_GPIO_UPPER_0:GPIO_3_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_4_PAD" "P8_GPIO_UPPER_0:GPIO_4_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_5_PAD" "P8_GPIO_UPPER_0:GPIO_5_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_6_PAD" "P8_GPIO_UPPER_0:GPIO_6_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_7_PAD" "P8_GPIO_UPPER_0:GPIO_7_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_8_PAD" "P8_GPIO_UPPER_0:GPIO_8_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_9_PAD" "P8_GPIO_UPPER_0:GPIO_9_PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_14" "P9_14_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_14_BIBUF:D" "PWM_1:PWM_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_16" "P9_16_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_16_BIBUF:D" "PWM_1:PWM_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_10_PAD" "P9_PIN23" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_12_PAD" "P9_PIN25" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_14_PAD" "P9_PIN27" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_17_PAD" "P9_PIN30" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_19_PAD" "P9_PIN41" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_1_PAD" "P9_PIN12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:GPIO_4_PAD" "P9_PIN15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_PIN42" "PWM_0:PWM_0" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACQ_MOD_GPIO_IN_0:GPIO_IN" "CAPE_DEFAULT_GPIOS:GPIO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACQ_MOD_GPIO_IN_0:MOD_GPIO_ACQ_I" "Acquisition_Core_0:MAX_INPUT_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACQ_MOD_GPIO_IN_0:MOD_GPIO_ACQ_Q" "Acquisition_Core_0:MAX_INPUT_Q" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACQ_MOD_GPIO_IN_0:MOD_GPIO_IN" "GPIO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_OE" "blinky_0:modified_gpio_enable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_OUT" "blinky_0:modified_gpio" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:I_OUT" "blinky_0:GNSS_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GNSS_MAX2771_signal_0:Q_OUT" "blinky_0:GNSS_Q" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT[15:0]" "P8_GPIO_UPPER_0:INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT[36:16]" "P9_GPIO_0:INT" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_BUS_CONVERTER_0:APB_MASTER" "CoreAPB3_CAPE_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_BUS_CONVERTER_0:APB_SLAVE" "APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Blinky2_0:BIF_1" "CoreAPB3_CAPE_0:APBmslave6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Blinky_0:BIF_1" "CoreAPB3_CAPE_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Acquisition_Core_0:BIF_1" "CoreAPB3_CAPE_0:APBmslave8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave0" "PWM_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave1" "P8_GPIO_UPPER_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave2" "P9_GPIO_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave4" "PWM_1:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave5" "PWM_2:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave7" "GNSS_MAX2771_signal_0:BIF_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave9" "P8_GPIO_UPPER_0:BIF_1" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "CAPE"
generate_component -component_name ${sd_name}
