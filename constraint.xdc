# System Configurations
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Allow non-dedicated clock routing for pin V2
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]

# I/O Pin Assignments
set_property -dict {PACKAGE_PIN K1  IOSTANDARD LVCMOS33} [get_ports {clk}]
set_property -dict {PACKAGE_PIN K2  IOSTANDARD LVCMOS33} [get_ports {rst}]
set_property -dict {PACKAGE_PIN L1  IOSTANDARD LVCMOS33} [get_ports {x}]
set_property -dict {PACKAGE_PIN A4  IOSTANDARD LVCMOS33} [get_ports {y}]
