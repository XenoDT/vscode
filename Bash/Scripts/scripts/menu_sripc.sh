#!/bin/bash
set -m

while true; do
  echo "1) Lanzar sleep en primer plano"
  echo "2) Lanzar sleep en segundo plano"
  echo "3) Listar trabajos (BG/STOP)"
  echo "4) Traer el trabajo actual al primer plano (fg)"
  echo "5) Reanudar el trabajo actual en segundo plano (bg)"
  echo "6) Ejecutar un comando con nice"
  echo "7) Terminar un proceso por PID (kill)"
  echo "8) Terminar procesos por nombre (killall)"
  echo "0) Salir"

  read -r -p "Opción: " opt

  case "$opt" in
    1)
      read -r -p "Segundos para sleep: " n
      sleep "$n"
      ;;

    2)
      read -r -p "Segundos para sleep: " n
      sleep "$n" &
      echo "PID: $!"
      ;;

    3)
      jobs -l
      ;;

    4)
      fg "%+"
      ;;

    5)
      bg "%+"
      ;;

    6)
      read -r -p "Valor nice: " prio
      read -r -p "Comando: " cmd
      nice -n "$prio" bash -c "$cmd"
      ;;

    7)
      ps -u "$USER" -o pid,ni,stat,cmd
      read -r -p "PID: " pid
      kill -TERM "$pid"
      ;;

    8)
      ps -u "$USER" -o pid,ni,stat,cmd
      read -r -p "Nombre proceso: " name
      killall "$name"
      ;;

    0)
      exit 0
      ;;
  esac
done
