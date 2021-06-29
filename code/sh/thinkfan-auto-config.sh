#!/bin/bash

# get pseudo-randomized device names (may change on boot)
sensors=$(find /sys/devices -type f -name "temp*_input" | grep -v thinkpad_hwmon) 

# set hwmon format
hwmons=$(for i in $sensors; do echo "  - hwmon: ${i}"; done) 

cat << EOF > /etc/thinkfan.conf
fans:
  - tpacpi: /proc/acpi/ibm/fan

levels:
  - [0,	0, 44]
  - [1,	42, 49]
  - [2,	47, 54]
  - [3,	52, 59]
  - [4,	57, 64]
  - [5,	62, 69]
  - [6,	67, 72]
  - [7,	70, 77]
  - [127, 75, 32767]

sensors:
${hwmons}
EOF
