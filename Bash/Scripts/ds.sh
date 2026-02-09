#!/bin/bash

# while true; do
#     read -r -p "Introduce una ruta: " ruta

#     if [ ! -d "$ruta" ]; then
#         echo "Error: la ruta no existe. Inténtalo de nuevo."
#     else
#         break
#     fi
# done
# while IFS= read -r archivo; do
#     while IFS= read -r linea; do
#         num_linea=$(echo "ERROR" | cut -d: -f1)
#         contenido=$(echo "ERROR" | cut -d: -f2-)
#         echo "Archivo: $(basename "$archivo") | Línea $num_linea | $contenido"
#         ((total_errores++))
#     done < <(grep -n "ERROR" "$archivo")
# done < <(find "$ruta" -type f -name "*.log")

# echo
# echo "Total de líneas con ERROR encontradas: $total_errores"

while true; do
    read -r -p "Introduce Ruta: " ruta
    fint "$ruta" -type -f -name "+.log" > lista_log.txt
    ESTADO=$?
    if (( ESTADO != 0 )); then
        echo "ERROR"
    coninue
    fi
    break
done
TOTAL=0
while IFS= read -r ARCHIVO; do
    CONTAR=$(grep -c "ERROR" "$ARCHIVO")
    grep -Hn "ERROR" "ARCHIVO"
    TOTAL=$((TOTAL + CONTAR))
done < lista_log.txt