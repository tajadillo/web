
#!/bin/bash
ram=$(free -m | awk '/Mem:/ {printf "%d/%d MB (%.2f%%)", $3, $2, $3/$2 * 100}')
echo "RAM: $ram"
