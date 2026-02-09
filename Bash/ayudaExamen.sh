#!/bin/bash
# ============================================================
# CHULETA DE LINUX Y BASH PARA EXAMEN
# PARTE 1 - ULTRA COMENTADA
#
# ESTE ARCHIVO NO ES PARA EJECUTARLO ENTERO.
# ES PARA LEERLO Y ESTUDIAR.
#
# Todo lo que empieza por # es un comentario (no se ejecuta).
# ============================================================


# ============================================================
# 1. COMANDOS BÁSICOS DEL SISTEMA
# ============================================================

# clear
# Sirve para limpiar la pantalla de la terminal.
clear

# date
# Sirve para mostrar la fecha y la hora actual.
date

# Mostrar fecha con formato:
# %d = día, %m = mes, %Y = año
date +"%d/%m/%Y"

# Mostrar solo hora:
# %H = hora, %M = minutos, %S = segundos
date +"%H:%M:%S"

# exit
# Sirve para salir de un script o de una terminal.
# 0 significa que todo fue bien, 1 significa error.
# exit 0
# exit 1

# history
# Muestra los comandos que has escrito antes.
history

# -c borra el historial
history -c

# Podemos buscar en el historial con grep
history | grep ls

# logout
# Cierra sesión (solo funciona en terminal real)
# logout

# reboot
# Reinicia el ordenador (necesita permisos de administrador)
# reboot

# shutdown
# Apaga o reinicia el sistema
# -h = apagar
# -r = reiniciar
# now = ahora
# shutdown -h now
# shutdown -r now
# shutdown -r +5   # reinicia en 5 minutos

# uname
# Muestra información del sistema
uname
uname -a   # toda la información
uname -r   # versión del kernel

# who
# Muestra los usuarios conectados
who

# whoami
# Muestra tu nombre de usuario
whoami

# man
# Abre el manual de un comando
man ls
man grep

# apropos
# Busca comandos por palabra clave
apropos copy
apropos user


# ============================================================
# 2. ARCHIVOS Y DIRECTORIOS
# ============================================================

# pwd
# Muestra en qué carpeta estás ahora mismo
pwd

# cd
# Cambia de directorio
cd /
cd /tmp
cd ~      # ~ significa tu carpeta personal (home)

# ls
# Lista archivos y carpetas
ls
ls -l     # formato largo (permisos, tamaño, fecha)
ls -a     # incluye ocultos
ls -la    # largo + ocultos
ls -R     # recursivo (subcarpetas)

# mkdir
# Crea una carpeta
mkdir carpeta

# -p crea varias carpetas si no existen
mkdir -p dir1/dir2/dir3

# rmdir
# Borra carpeta vacía
rmdir carpeta

# touch
# Crea archivo vacío
touch fichero.txt
touch a.txt b.txt

# cp
# Copia archivos o carpetas
cp fichero.txt copia.txt

# -i pregunta antes de sobrescribir
cp -i fichero.txt copia.txt

# -r copia carpetas
cp -r dir1 dir2

# mv
# Mueve o renombra archivos
mv copia.txt nuevo.txt
mv archivo.txt /tmp/

# rm
# Borra archivos o carpetas
rm fichero.txt
rm -i fichero.txt      # pregunta
rm -r carpeta         # borra carpeta
rm -rf carpeta        # forzado (PELIGRO)

# stat
# Muestra información detallada de un archivo
stat fichero.txt

# ln
# Crea enlaces
ln fichero.txt duro.txt      # enlace duro
ln -s fichero.txt simbolico.txt  # enlace simbólico

# find
# Busca archivos
find /tmp -name "*.txt"   # por nombre
find / -type d           # solo carpetas
find /home -user root    # por usuario
find . -size +1M         # por tamaño

# whereis
# Busca dónde está un comando
whereis ls
whereis bash


# ============================================================
# 3. COMANDOS DE TEXTO
# ============================================================

# echo
# Muestra texto por pantalla
echo "Hola mundo"
echo -n "Sin salto de línea"
echo -e "Linea1\nLinea2"

# cat
# Muestra el contenido de un archivo
cat fichero.txt
cat a.txt b.txt

# head
# Muestra primeras líneas
head fichero.txt
head -n 3 fichero.txt

# tail
# Muestra últimas líneas
tail fichero.txt
tail -n 5 fichero.txt
tail -f fichero.txt   # sigue cambios

# wc
# Cuenta cosas
wc fichero.txt        # líneas, palabras y bytes
wc -l fichero.txt     # solo líneas
wc -w fichero.txt     # solo palabras
wc -c fichero.txt     # solo bytes

# sort
# Ordena líneas
sort fichero.txt
sort -n numeros.txt   # numérico
sort -r fichero.txt   # inverso
sort -u fichero.txt   # sin repetidos

# grep
# Busca palabras dentro de archivos
grep "hola" fichero.txt
grep -i "hola" fichero.txt   # ignora mayúsculas
grep -n "hola" fichero.txt   # número de línea
grep -v "error" fichero.txt  # todo menos error

# combinaciones (pipes)
ps aux | grep root
ls -l | grep ".txt" | wc -l


# ============================================================
# 4. USUARIOS Y GRUPOS
# ============================================================

# id
# Muestra datos del usuario
id
id root

# passwd
# Cambia contraseña
# passwd usuario

# su
# Cambia de usuario
# su root
# su pepe

# sudo
# Ejecuta como administrador
# sudo ls
# sudo useradd juan

# useradd
# Crea usuario
# -m crea carpeta personal
# -s shell
# -g grupo
# useradd juan
# useradd -m juan
# useradd -m -s /bin/bash juan

# userdel
# Borra usuario
# userdel juan
# userdel -r juan

# groupadd
# Crea grupo
# groupadd clase

# groupdel
# Borra grupo
# groupdel clase

# chown
# Cambia dueño de archivo
chown root fichero.txt
chown usuario:grupo fichero.txt

# chgrp
# Cambia grupo
chgrp root fichero.txt


# ============================================================
# 5. PERMISOS
# ============================================================

# chmod numérico
# r=4 w=2 x=1
chmod 777 fichero.txt
chmod 755 fichero.txt
chmod 644 fichero.txt

# chmod simbólico
chmod u+x fichero.txt
chmod g-w fichero.txt
chmod o+r fichero.txt
chmod a-x fichero.txt

# umask
# Muestra máscara de permisos
umask
umask 022


# ============================================================
# 6. VARIABLES
# ============================================================

# Crear variable
VAR=hola
NUM=5
RUTA="/tmp"

# Usar variable
echo $VAR
echo $NUM
echo $RUTA

# env / printenv
env
printenv
printenv HOME

# export
# Hace variable global
export VAR

# unset
# Borra variable
unset VAR


# ============================================================
# 7. REDIRECCIONES Y OPERADORES
# ============================================================

# > sobrescribe archivo
echo "Linea1" > salida.txt

# >> añade
echo "Linea2" >> salida.txt

# < entrada
wc -l < salida.txt

# | pipe
ls -l | grep ".txt"

# && si el primero va bien
mkdir test && cd test

# || si falla
cd carpeta_inexistente || echo "Error al entrar"


# ============================================================
# 8. PROCESOS (PARTE 1)
# ============================================================

# ps
# Lista procesos
ps
ps aux
ps -ef

# top
# Monitor interactivo
top

# htop
# Versión mejorada
htop

# jobs
# Trabajos en segundo plano
jobs

# bg
# Mandar a segundo plano
bg %1

# fg
# Traer a primer plano
fg %1

# kill
# Mata proceso por PID
kill 1234
kill -9 1234
kill -15 1234

# killall
# Mata por nombre
killall bash
killall firefox

# nice
# Prioridad al lanzar proceso
nice -n 10 sleep 30

# renice
# Cambia prioridad
renice -n 5 -p 1234

# time
# Mide tiempo
time ls

# nohup
# Ejecuta aunque cierres sesión
nohup sleep 100 &

# sleep
# Pausa
sleep 5

# pstree
# Árbol de procesos
pstree
pstree -p


# ============================================================
# FIN PARTE 1
# ============================================================




#!/bin/bash
# ============================================================
# CHULETA DE LINUX Y BASH PARA EXAMEN
# PARTE 2 - ULTRA COMENTADA
#
# Incluye:
#  - Servicios (systemctl)
#  - Compresión y copias (tar, gzip, zip…)
#  - Tareas programadas (cron, at)
#  - Condicionales (if)
#  - Bucles (for, while, until)
#  - case
#  - Funciones
#  - test y comprobaciones
#  - Operadores lógicos
# ============================================================


# ============================================================
# 1. SERVICIOS (SYSTEMCTL)
# ============================================================

# systemctl controla servicios (ssh, apache, mysql…)

# Ver estado de un servicio
systemctl status ssh

# Iniciar servicio
systemctl start ssh

# Parar servicio
systemctl stop ssh

# Reiniciar servicio
systemctl restart ssh

# Activar servicio al arrancar
systemctl enable ssh

# Desactivar en arranque
systemctl disable ssh

# Ver todos los servicios
systemctl list-units --type=service


# ============================================================
# 2. COMPRESIÓN Y COPIAS DE SEGURIDAD
# ============================================================

# gzip -> comprime archivo (borra original)
gzip fichero.txt

# gunzip -> descomprime
gunzip fichero.txt.gz

# gzip -k -> conserva original
gzip -k fichero.txt

# bzip2 -> comprime
bzip2 fichero.txt

# bunzip2 -> descomprime
bunzip2 fichero.txt.bz2

# zip -> comprime
zip copia.zip fichero.txt

# zip varios archivos
zip varios.zip a.txt b.txt c.txt

# unzip -> descomprime zip
unzip copia.zip

# tar -> empaqueta carpetas/archivos

# Crear tar
tar -cvf copia.tar carpeta

# Extraer tar
tar -xvf copia.tar

# tar + gzip
tar -czvf copia.tar.gz carpeta
tar -xzvf copia.tar.gz

# tar + bzip2
tar -cjvf copia.tar.bz2 carpeta
tar -xjvf copia.tar.bz2

# Ver contenido sin extraer
tar -tvf copia.tar


# ============================================================
# 3. TAREAS PROGRAMADAS
# ============================================================

# crontab -> tareas repetitivas

# Editar tareas
# crontab -e

# Ver tareas
crontab -l

# Borrar tareas
crontab -r

# Formato:
# minuto hora dia mes dia_semana comando
# 0 8 * * * /ruta/script.sh

# at -> tarea una sola vez

# at 12:00
# comando
# CTRL+D

# atq -> ver tareas
atq

# atrm -> borrar tarea
atrm 1


# ============================================================
# 4. CONDICIONALES (IF)
# ============================================================

# if sirve para tomar decisiones

# Ejemplo básico
NUM=5

if [ $NUM -gt 3 ]; then
  echo "Es mayor que 3"
fi

# if con else
if [ $NUM -eq 3 ]; then
  echo "Es igual a 3"
else
  echo "No es igual a 3"
fi

# if con elif
if [ $NUM -gt 10 ]; then
  echo "Mayor que 10"
elif [ $NUM -gt 5 ]; then
  echo "Mayor que 5"
else
  echo "5 o menor"
fi

# Comprobar archivo
if [ -f fichero.txt ]; then
  echo "Existe"
else
  echo "No existe"
fi

# Comprobar carpeta
if [ -d carpeta ]; then
  echo "Es directorio"
fi

# Comprobar variable vacía
if [ -z "$VAR" ]; then
  echo "Está vacía"
fi


# ============================================================
# 5. TEST (COMPROBACIONES)
# ============================================================

# test es lo mismo que [ ]

test -f fichero.txt
[ -d carpeta ]
[ $NUM -eq 5 ]
[ "$VAR" = "hola" ]


# ============================================================
# 6. OPERADORES LÓGICOS
# ============================================================

# && -> AND (y)
# || -> OR (o)

[ $NUM -gt 3 ] && echo "Mayor que 3"
[ $NUM -lt 3 ] || echo "No es menor que 3"

# Dentro de if
if [ $NUM -gt 3 ] && [ $NUM -lt 10 ]; then
  echo "Entre 3 y 10"
fi


# ============================================================
# 7. BUCLE FOR
# ============================================================

# Repite un número de veces

for i in 1 2 3 4 5
do
  echo "Número $i"
done

# Rango
for i in {1..10}
do
  echo $i
done

# Usando variables
for fichero in *.txt
do
  echo "Archivo: $fichero"
done


# ============================================================
# 8. BUCLE WHILE
# ============================================================

X=1

while [ $X -le 5 ]
do
  echo "WHILE $X"
  X=$((X+1))
done


# ============================================================
# 9. BUCLE UNTIL
# ============================================================

Y=1

until [ $Y -gt 5 ]
do
  echo "UNTIL $Y"
  Y=$((Y+1))
done


# ============================================================
# 10. CASE (MENÚ)
# ============================================================

echo "1) Copiar"
echo "2) Borrar"
read OPCION

case $OPCION in
  1)
    echo "Elegiste copiar"
    ;;
  2)
    echo "Elegiste borrar"
    ;;
  *)
    echo "Opción incorrecta"
    ;;
esac


# ============================================================
# 11. FUNCIONES
# ============================================================

# Definir función
saludar(){
  echo "Hola desde función"
}

# Llamar función
saludar

# Función con parámetros
suma(){
  echo $(($1 + $2))
}

suma 3 5


# ============================================================
# 12. ENTRADA DE USUARIO
# ============================================================

# read -> leer por teclado
read NOMBRE
echo "Hola $NOMBRE"

read -p "Introduce edad: " EDAD
echo "Tu edad es $EDAD"


# ============================================================
# 13. RECORDATORIOS IMPORTANTES
# ============================================================

# 1) Los scripts empiezan por: #!/bin/bash
# 2) Para ejecutar:
#    chmod +x script.sh
#    ./script.sh
# 3) Los espacios IMPORTAN en if y test
#    [ $A -eq 3 ]  BIEN
#    [$A -eq 3]    MAL
# 4) Las variables llevan $
# 5) No se ponen espacios en VAR=valor
# 6) > sobrescribe, >> añade
# 7) | conecta comandos
# 8) && depende del anterior
# ============================================================


# ============================================================
# FIN PARTE 2
# ============================================================




#!/bin/bash
# ============================================================
# CHULETA DE LINUX Y BASH PARA EXAMEN
# PARTE 3 - ULTRA COMENTADA
#
# Incluye:
#  - Combinaciones reales de comandos
#  - Ejercicios tipo examen
#  - Errores comunes
#  - find avanzado
#  - grep avanzado
#  - tar avanzado
#  - gestión de errores
#  - scripts completos simples
# ============================================================


# ============================================================
# 1. COMBINACIONES REALES (PIPE + REDIRECCIONES)
# ============================================================

# Contar cuántos archivos .txt hay
ls | grep ".txt" | wc -l

# Ver procesos del usuario root
ps aux | grep root

# Guardar resultado en archivo
ls -l /etc | grep conf > lista_conf.txt

# Añadir más líneas al archivo
ls -l /bin >> lista_conf.txt

# Usar entrada estándar
wc -l < lista_conf.txt

# Buscar palabra en varios archivos
grep "error" *.log

# Buscar sin distinguir mayúsculas
grep -i "error" *.log

# Buscar y mostrar número de línea
grep -n "error" *.log

# Buscar lo contrario
grep -v "ok" *.log


# ============================================================
# 2. FIND AVANZADO (MUY DE EXAMEN)
# ============================================================

# Buscar por nombre
find /home -name "fichero.txt"

# Buscar por extensión
find /home -name "*.txt"

# Buscar por tamaño
find /home -size +1M
find /home -size -500k

# Buscar por tipo
find /home -type f   # archivos
find /home -type d   # carpetas

# Buscar por usuario
find /home -user root

# Buscar por permisos
find /home -perm 777

# Ejecutar comando sobre lo encontrado
find /tmp -name "*.txt" -exec rm {} \;

# Contar resultados
find /etc -name "*.conf" | wc -l


# ============================================================
# 3. TAR AVANZADO
# ============================================================

# Crear copia con fecha
tar -czvf backup_$(date +"%Y%m%d").tar.gz /home

# Ver contenido sin extraer
tar -tvf backup.tar.gz

# Extraer en carpeta concreta
tar -xzvf backup.tar.gz -C /tmp


# ============================================================
# 4. GESTIÓN DE ERRORES
# ============================================================

# Ver si un comando ha ido bien
ls /tmp
echo $?    # 0 = bien, otro = error

# Usar con if
if ls /carpeta_inexistente; then
  echo "Existe"
else
  echo "No existe"
fi

# Redirigir errores
ls /noexiste 2> errores.txt

# Redirigir salida y errores
ls /etc > salida.txt 2> errores.txt

# Redirigir todo
ls /etc &> todo.txt


# ============================================================
# 5. SCRIPTS COMPLETOS SIMPLES
# ============================================================

# Script que crea carpeta si no existe
if [ ! -d copia ]; then
  mkdir copia
  echo "Carpeta creada"
fi

# Script que copia todos los .txt
for f in *.txt
do
  cp "$f" copia/
done

# Script que pregunta nombre y saluda
read -p "Tu nombre: " NOMBRE
echo "Hola $NOMBRE"

# Script que cuenta archivos
NUM=$(ls | wc -l)
echo "Hay $NUM archivos"


# ============================================================
# 6. CASE TIPO MENÚ REAL
# ============================================================

echo "1) Listar archivos"
echo "2) Ver fecha"
echo "3) Ver usuario"
read OPC

case $OPC in
  1) ls ;;
  2) date ;;
  3) whoami ;;
  *) echo "Opción incorrecta" ;;
esac


# ============================================================
# 7. ERRORES COMUNES (MUY DE EXAMEN)
# ============================================================

# MAL:
# VAR = 5
# BIEN:
VAR=5

# MAL:
# if[$VAR -eq 5]
# BIEN:
if [ $VAR -eq 5 ]; then
  echo "OK"
fi

# MAL:
# for i in {1..5}
# echo $i
# BIEN:
for i in {1..5}
do
  echo $i
done


# ============================================================
# 8. COMANDOS DE RED
# ============================================================

# ip a -> ver IP
ip a

# ping -> comprobar conexión
ping -c 4 google.com

# hostname -> nombre equipo
hostname

# hostnamectl -> cambiar nombre
hostnamectl set-hostname PC1

# ss -> sockets
ss -tuln


# ============================================================
# 9. DISCO Y SISTEMA
# ============================================================

# df -> espacio en disco
df -h

# du -> tamaño de carpetas
du -h
du -sh /home

# mount -> dispositivos montados
mount

# lsblk -> discos
lsblk

# free -> memoria RAM
free -h

# uptime -> tiempo encendido
uptime


# ============================================================
# 10. EJERCICIOS TÍPICOS DE EXAMEN
# ============================================================

# 1) Cuenta archivos .txt
ls *.txt | wc -l

# 2) Busca palabra "root" en passwd
grep root /etc/passwd

# 3) Muestra solo usuarios
cut -d: -f1 /etc/passwd

# 4) Ordena usuarios
cut -d: -f1 /etc/passwd | sort

# 5) Cuenta usuarios
cut -d: -f1 /etc/passwd | wc -l

# 6) Ver procesos de un usuario
ps aux | grep usuario

# 7) Borra todos los .log
rm *.log

# 8) Copia carpeta completa
cp -r /home /backup

# 9) Comprime carpeta
tar -czvf copia.tar.gz carpeta

# 10) Programa tarea diaria
# crontab -e
# 0 9 * * * /ruta/script.sh


# ============================================================
# RECORDATORIOS FINALES
# ============================================================

# TODO empieza por:
# #!/bin/bash

# Comentarios empiezan por #

# Permisos:
# r=4 w=2 x=1

# Redirecciones:
# >   sobrescribe
# >>  añade
# <   entrada
# |   pipe

# Operadores:
# &&  AND
# ||  OR

# ============================================================
# FIN PARTE 3
# ============================================================
	
