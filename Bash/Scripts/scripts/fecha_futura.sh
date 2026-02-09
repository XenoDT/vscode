#!/bin/bash

SEGUNDOS=""

read -r -p "Introduce un número de segundos (entero positivo): " SEGUNDOS

DIA_SIS=$(date +%d)
MES_SIS=$(date +%m)
ANIO_SIS=$(date +%Y)
HORA_SIS=$(date +%H)
MIN_SIS=$(date +%M)
SEC_SIS=$(date +%S)

SEC_F=$((SEC_SIS + SEGUNDOS))
MIN_F=$MIN
HORA_F=$HORA

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


echo "Hora actual : "
echo "Hora futura : "
