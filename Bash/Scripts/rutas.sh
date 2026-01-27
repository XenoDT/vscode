#!/bin/bash
while true; do
    read -r -p "Introduce una ruta: " ruta
    find "$ruta" -type f -name "*.log" > lista_log.txt
    if((ESTADO != 0)); then
        echo "error"
        continue
    find
    break
done

total=0