
#!/bin/bash
battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
echo "BAT: $battery% ($status)"
