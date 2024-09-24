#!/bin/bash
######################################################################
#Copyright (C) 2018  Kris Occhipinti
#https://filmsbykris.com

#TEMPORIZADOR BÁSICO con ALARMA

#Este programa es software libre: puedes redistribuirlo y/o modificarlo
#bajo los términos de la Licencia Pública General GNU publicada por
#la Free Software Foundation, ya sea la versión 3 de la Licencia, o
#(a su elección) cualquier versión posterior.

#Este programa se distribuye con la esperanza de que sea útil.
#pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de
#COMERCIABILIDAD o IDONEIDAD PARA UN FIN DETERMINADO.  Ver el
#Licencia pública general #GNU para más detalles.

#Deberías haber recibido una copia de la Licencia Pública General GNU
#junto con este programa.  En caso contrario, consulte <http://www.gnu.org/licenses/>.
######################################################################

if [ $# -lt 1 ]
then
  echo "Time needed"
  echo "Useage: $0 <seconds>"
  echo "Example: $0 60"
  exit 0
fi

alarm="$HOME/.alarm.wav"
time="$1"
start=$SECONDS
s=1

function main(){
  echo "Welcome..."
  while [ $s -gt 0 ]
  do
    s="$((time - (SECONDS - start)))"
    echo -ne "\r                   \r"
    echo -ne "\r$s seconds left"
    sleep 1
  done

  echo -e "\nTimes Up"

  if [ -f "$alarm" ]
  then
    play "$alarm" 2>/dev/null
  else
    for i in `seq 1 3`
    do
      play -n -c1 synth sin %-12 sin %-9 sin %-5 sin %-2 fade h 0.1 1 0.1 2>/dev/null
    done
  fi
  exit 0
}

main
