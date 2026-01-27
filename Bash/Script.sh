#!bin/bash

read -p "introduce un numero, este seran los segundos" sec;
 
 dia_s=$(date +%d)
 mes_s=$(date +%m)
 agno_s=$(date +%Y)
 hora_s=$(date +%H)
 min_S=$(date +%M)
 sec_s=$(date +%S)
 
 sec_F=$((sec_s + sec))
 min_f=$min
 hora_F=$hora

 while (( sec_F >= 60)); do
    sec_F=$((sec_F - 60))
    min_f=$((min_f + 1))
 done

while ((min_f >= 60)); do
    min_f=$((min_f - 60))
    hora_F=$((hora_F + 1))
 done

while ((hora_F >= 24)); do
    hora_F=$((hora_F - 24))
 done
 echo $hora_F $min_f $sec_F
