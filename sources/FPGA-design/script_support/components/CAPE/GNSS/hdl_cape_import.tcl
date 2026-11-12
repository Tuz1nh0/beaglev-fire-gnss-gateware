#Importing and Linking all the HDL source files used in the CAPE design

foreach file [glob -nocomplain -type f [file join $current_dir "script_support" "components" "CAPE" $cape_option "HDL" "Counters" "*.vhd"]] {
    import_files -convert_EDN_to_HDL 0 -library {work} -hdl_source $file
}

foreach file [glob -nocomplain -type f [file join $current_dir "script_support" "components" "CAPE" $cape_option "HDL" "Common" "L1_Code_Generator" "*.vhd"]] {
    import_files -convert_EDN_to_HDL 0 -library {work} -hdl_source $file
}

foreach file [glob -nocomplain -type f [file join $current_dir "script_support" "components" "CAPE" $cape_option "HDL" "Counters" "Clock_Control" "*.vhd"]] {
    import_files -convert_EDN_to_HDL 0 -library {work} -hdl_source $file
}

foreach file [glob -nocomplain -type f [file join $current_dir "script_support" "components" "CAPE" $cape_option "HDL" "Counters" "Input_Chain" "*.vhd"]] {
    import_files -convert_EDN_to_HDL 0 -library {work} -hdl_source $file
}

foreach file [glob -nocomplain -type f [file join $current_dir "script_support" "components" "CAPE" $cape_option "HDL" "Counters" "L1_Code_Generator" "*.vhd"]] {
    import_files -convert_EDN_to_HDL 0 -library {work} -hdl_source $file
}
