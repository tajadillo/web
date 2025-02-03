
#!/bin/bash
if ping -c 1 8.8.8.8 &> /dev/null; then
    echo "NET: ✅"
else
    echo "NET: ❌"
fi
