# Creating SmartDesign "APB_BLINKY_93FE8E69B5558EF1371"
set sd_name {APB_BLINKY_93FE8E69B5558EF1371}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_IRQn} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_INTn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DET} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART0_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_NXT} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_OCn} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USER_BUTTON} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CSI1_PWND} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_RSTN} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_W_DISABLE1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_W_DISABLE2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_42} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_RSTn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART0_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_RESETB} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIO_ENABLE} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_CSn} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MISO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MOSI} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_SCK} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_41} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDIO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CARD_CS} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {CA} -port_direction {OUT} -port_range {[5:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {EMMC_DATA} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {P8} -port_direction {INOUT} -port_range {[46:3]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {P9} -port_direction {INOUT} -port_range {[31:11]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {USB0_DATA} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}

sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[11:11]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[12:12]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[13:13]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[14:14]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[15:15]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[16:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[17:17]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[18:18]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[19:19]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[20:20]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[21:21]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[22:22]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[23:23]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[24:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[25:25]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[26:26]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[27:27]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[28:28]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[29:29]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[30:30]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {[31:31]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {M2_W_DISABLE1} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {M2_W_DISABLE2} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CSI1_PWND} -value {VCC}
# Add APU instance
sd_instantiate_component -sd_name ${sd_name} -component_name {APU} -instance_name {APU}



# Add BVF_RISCV_SUBSYSTEM instance
sd_instantiate_component -sd_name ${sd_name} -component_name {BVF_RISCV_SUBSYSTEM} -instance_name {BVF_RISCV_SUBSYSTEM}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M} -pin_slices {[47:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M} -pin_slices {[58:48]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M[58:48]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M} -pin_slices {[7:3]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M[7:3]} -value {GND}
sd_create_pin_group -sd_name ${sd_name} -group_name {USB_IN} -instance_name {BVF_RISCV_SUBSYSTEM} -pin_names {"USB_OCn" "USB_CLK" "USB_DIR" "USB_NXT" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_TXD}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_RXD} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_RTS}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_CTS} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CAN_0_TXBUS}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CAN_0_TX_EBL}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CAN_0_RXBUS} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CAN_1_TXBUS}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CAN_1_TX_EBL}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CAN_1_RXBUS} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_3_RXD} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_3_TXD}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MAC_1_MDI_F2M} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MAC_1_MDO_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MAC_1_MDC_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MAC_1_MDO_M2F}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:PCIE_INT} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:FIC_2_AXI4_TARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:FIC_0_AXI4_TARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CSI_APB_MTARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:HSI_APB_MTARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_APB_MTARGET}



# Add CAPE instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE} -instance_name {CAPE}



# Add CLOCKS_AND_RESETS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCKS_AND_RESETS} -instance_name {CLOCKS_AND_RESETS}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CLOCKS_AND_RESETS:FIC_1_FABRIC_RESET_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CLOCKS_AND_RESETS:FIC_2_FABRIC_RESET_N}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_CSn" "BVF_RISCV_SUBSYSTEM:ADC_CSn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_IRQn" "BVF_RISCV_SUBSYSTEM:ADC_IRQn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_MCLK" "CLOCKS_AND_RESETS:ADC_MCLK_4_915MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_MISO" "BVF_RISCV_SUBSYSTEM:ADC_MISO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_MOSI" "BVF_RISCV_SUBSYSTEM:ADC_MOSI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_SCK" "BVF_RISCV_SUBSYSTEM:ADC_SCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:ACLK" "BVF_RISCV_SUBSYSTEM:FIC_0_ACLK" "CLOCKS_AND_RESETS:FIC_0_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:ARESETN" "CLOCKS_AND_RESETS:FIC_0_FABRIC_RESET_N" "PHY_RSTn" "USB0_RESETB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:PCLK" "BVF_RISCV_SUBSYSTEM:FIC_3_PCLK" "CAPE:PCLK" "CLOCKS_AND_RESETS:FIC_3_PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:PRESETN" "BVF_RISCV_SUBSYSTEM:PRESETN" "CAPE:PRESETN" "CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CK" "CK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CKE" "CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CK_N" "CK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CS" "CS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:EMMC_CLK" "EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:EMMC_CMD" "EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:EMMC_RSTN" "EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:EMMC_STRB" "EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:FIC_1_ACLK" "CLOCKS_AND_RESETS:FIC_1_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:FIC_2_ACLK" "CLOCKS_AND_RESETS:FIC_2_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C0_SCL" "P9[19:19]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C0_SDA" "P9[20:20]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_2_RXD" "P9[26:26]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_2_TXD" "P9[24:24]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_4_RXD" "P9[11:11]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_4_TXD" "P9[13:13]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_DLL_LOCKS" "CLOCKS_AND_RESETS:MSS_DLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_RESET_N_M2F" "CLOCKS_AND_RESETS:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:PHY_INTn" "PHY_INTn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:PHY_MDC" "PHY_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:PHY_MDIO" "PHY_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SD_CARD_CS" "SD_CARD_CS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SD_DET" "SD_DET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_TX0_P" "SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SGMII_TX1_P" "SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_CLK" "P9[22:22]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_DI" "P9[21:21]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_DO" "P9[18:18]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_SS1" "P9[17:17]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_1_CLK" "P9[31:31]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_1_DI" "P9[29:29]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_1_SS1" "P9[28:28]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:UART0_RXD" "UART0_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:UART0_TXD" "UART0_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_CLK" "USB0_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DIR" "USB0_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_NXT" "USB0_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_OCn" "USB0_OCn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_STP" "USB0_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USER_BUTTON" "USER_BUTTON" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:VIO_ENABLE" "VIO_ENABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GNSS_PLL_LOCK" "CLOCKS_AND_RESETS:GNSS_PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GNSS_RCOSC_160MHZ_GL" "CLOCKS_AND_RESETS:GNSS_OUT0_FABCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_14" "P9[14:14]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_16" "P9[16:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN12" "P9[12:12]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN15" "P9[15:15]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN23" "P9[23:23]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN25" "P9[25:25]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN27" "P9[27:27]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN30" "P9[30:30]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN41" "P9_41" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN42" "P9_42" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:BVF_GPIO_IN" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:BVF_GPIO_OE" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:BVF_GPIO_OUT" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:CAPE_GPIO_IN" "CAPE:GPIO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:CAPE_GPIO_OE" "CAPE:GPIO_OE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:CAPE_GPIO_OUT" "CAPE:GPIO_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CA" "CA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:DM" "DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:DQS_N" "DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:EMMC_DATA" "EMMC_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M[47:8]" "CAPE:INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA" "USB0_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P8" "P8" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:APB_SLAVE" "BVF_RISCV_SUBSYSTEM:APU_APB_MTARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APU:AXI4mmaster0" "BVF_RISCV_SUBSYSTEM:FIC_0_AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CAPE_APB_MTARGET" "CAPE:APB_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "APB_BLINKY_93FE8E69B5558EF1371"
generate_component -component_name ${sd_name}
