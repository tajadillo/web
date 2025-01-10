#!/bin/bash

# https://github.com/ray-pH/polybar-cava
# Configura el nivel de batería bajo
LOW_BATTERY_LEVEL=25

while true; do
    # Obtén el porcentaje de batería actual
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Verifica si la batería está descargándose y por debajo del nivel configurado
    if acpi -b | grep -qi "discharging" && [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_LEVEL" ]; then
        # Enviar notificación con Dunst
        notify-send "Batería Baja" "Tu batería está en ${BATTERY_LEVEL}%. Conecta el cargador." --urgency=critical --icon=battery-caution

        # Reproducir sonido de alerta
        paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga

        # Esperar un tiempo antes de notificar nuevamente
        sleep 300  # 5 minutos
    fi

    # Esperar antes de verificar nuevamente
    sleep 60  # Verificar cada minuto
done
