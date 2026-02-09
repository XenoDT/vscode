#!/bin/env bash

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
