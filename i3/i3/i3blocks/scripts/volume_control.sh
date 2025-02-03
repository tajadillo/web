
#!/bin/bash

# Comando para aumentar el volumen
if [ "$1" == "increase" ]; then
    pamixer --increase 5
# Comando para disminuir el volumen
elif [ "$1" == "decrease" ]; then
    pamixer --decrease 5
# Comando para alternar el mute
elif [ "$1" == "toggle" ]; then
    pamixer --toggle-mute
fi
