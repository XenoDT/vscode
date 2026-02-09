#!/bin/bash
set -m
while true;do
    echo "1. Fecha en el futuro"
    echo "2. Listar errores"
    echo "3. Menu secundario"
    echo "4. Salir"
    
    read -r -p "Introduce una opcion: " opt

    if [ "$opt" -eq 1 ]; then
     SEGUNDOS=""

        read -r -p "Introduce un número de segundos (entero positivo): " SEGUNDOS

        DIA_SIS=$(date +%d)
        MES_SIS=$(date +%m)
        ANIO_SIS=$(date +%Y)
        HORA_SIS=$(date +%H)
        MIN_SIS=$(date +%M)
        SEC_SIS=$(date +%S)

        SEC_F=$((SEC_SIS + SEGUNDOS))
        MIN_F="$MIN"
        HORA_F="$HORA"

        while (( SEC_F >= 60 )); do
          SEC_F=$((SEC_F - 60))
          MIN_F=$((MIN_F + 1))
        done

        while (( MIN_F >= 60 )); do
          MIN_F=$((MIN_F - 60))
          HORA_F=$((HORA_F + 1))
        done

        while (( HORA_F >= 24 )); do
          HORA_F=$((HORA_F - 24))
        done


        echo "Hora actual : " + $HORA_SIS:$MIN_SIS
        echo "Hora futura : " + $HORA_F:$MIN_F
    elif [ "$opt" -eq 2 ]; then
        while true; do
        read -r -p "Introduce una ruta: " RUTA

        find "$RUTA" -type f -name "*.log" > lista_logs.txt
        ESTADO=$?

        if (( ESTADO != 0 )); then
            echo "Error: ruta no válida o sin permisos."
            continue
        fi

        break
        done

        TOTAL=0
        while IFS= read -r ARCHIVO; do
        CONTAR=$(grep -c "ERROR" "$ARCHIVO")
        grep -Hn "ERROR" "$ARCHIVO"
        TOTAL=$((TOTAL + CONTAR))
        done < lista_logs.txt

        echo "Total de líneas con ERROR: $TOTAL"
    elif [ "$opt" -eq 3 ]; then
        set -m

        while [! $opt -eq 0 ]; do
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
            # exit
            ;;
        esac
        done
    else
    exit
    fi
done