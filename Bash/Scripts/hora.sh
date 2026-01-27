#!/bin/bash

read -p "Introduce un número de segundos: " sec

hora_s=$(date +%H)
min_s=$(date +%M)
sec_s=$(date +%S)

sec_F=$((sec_s + sec))
min_f=$min_s
hora_F=$hora_s

while (( sec_F >= 60 )); do
    sec_F=$((sec_F - 60))
    min_f=$((min_f + 1))
done

while (( min_f >= 60 )); do
    min_f=$((min_f - 60))
    hora_F=$((hora_F + 1))
done

while (( hora_F >= 24 )); do
    hora_F=$((hora_F - 24))
done

echo "Hora futura: $hora_F:$min_f:$sec_F"
