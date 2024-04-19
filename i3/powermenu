    #! /bin/sh
    #insertar en /usr/local/bin/


chosen=$(printf " Apagar\n Reiniciar\n Bloquear\n Hibernar\n󰗼 Cerrar Sesión" | rofi -dmenu -i)

case "$chosen" in
    " Apagar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Bloquear" ) i3lock-fancy;;
    " Hibernar" ) systemctl suspend-then-hibernate;;
    "󰗼 Cerrar Sesión") i3-msg exit ;;
    *) exit 1 ;;
esac
