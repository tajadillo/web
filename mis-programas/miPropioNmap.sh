#/bin/bash
#el comando para conocer cual es mi ip publica es "curl ifconfig.io"

if [ $1 ]; then
    ip=$1
    for i in {1..1000}
    do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$i" && echo "Puerto $i: Abierto"
    done
else
    echo "Modo de uso: ./miPropioNmap.sh"
fi

