#!/bin/bash

# Instalar el archivo en /usr/local/bin y renombrarlo como "actualiceNotify"
# Comando para actualizar la polyban
# polybar-msg cmd restart

# Colores
COLOR_GREEN="#00FF00"  # Verde para el texto
COLOR_RED="#FF0000"    # Rojo brillante para el texto
COLOR_BG="#1E1E2E"     # Color de fondo (oscuro)
COLOR_GRAY="#808080"   # Color de texto para la alerta


# Archivo temporal para controlar notificaciones
NOTIFY_FILE="/tmp/debian_updates_notified"
ICON_UPDATE_AVAILABLE="/ruta/al/icono/actualizacion.png"  # Ruta al ícono cuando hay actualizaciones
ICON_NO_UPDATES="/ruta/al/icono/sin_actualizaciones.png"  # Ruta al ícono cuando no hay actualizaciones

# Comprobar actualizaciones
UPDATES=$(apt list --upgradable 2>/dev/null | grep -c "upgradable")

if [ "$UPDATES" -gt 0 ]; then
    # Hay actualizaciones disponibles
    echo "%{F$COLOR_GRAY}%{B$COLOR_RED} $UPDATES actualizaciones disponibles%{F-}%{B-}"

    # Enviar notificación si no se ha enviado antes
    if [ ! -f "$NOTIFY_FILE" ]; then
        notify-send -i "$ICON_UPDATE_AVAILABLE" "Actualizaciones disponibles" "Hay $UPDATES paquetes para actualizar"
        touch "$NOTIFY_FILE"
    fi
else
    # No hay actualizaciones
    echo "%{F$COLOR_GRAY}%{B$COLOR_BG} Sistema actualizado%{F-}%{B-}"

    # Eliminar el archivo temporal si no hay actualizaciones
    [ -f "$NOTIFY_FILE" ] && rm "$NOTIFY_FILE"
fi





# Alternativa numero dos al codigo
# Comprobar actualizaciones
#UPDATES=$(apt list --upgradable 2>/dev/null | grep -c "upgradable")

#if [ "$UPDATES" -gt 0 ]; then
    # Hay actualizaciones disponibles
    #echo "%{F$COLOR_GRAY}%{B$COLOR_RED} $UPDATES actualizaciones disponibles%{F-}%{B-}"
#else
    # No hay actualizaciones
    #echo "%{F$COLOR_GRAY}%{B$COLOR_BG} Sistema actualizado%{F-}%{B-}"
#fi

