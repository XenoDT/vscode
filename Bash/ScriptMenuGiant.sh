#!/bin/bash

pause() {
    read -rp "Presiona ENTER para continuar..."
}

menu_principal() {
    clear
    echo "========= MENU PRINCIPAL ========="
    echo "1) Iniciales"
    echo "2) Archivos y Directorios"
    echo "3) Archivos de Texto"
    echo "4) Permisos"
    echo "5) Administración de Procesos"
    echo "6) Compresión y Seguridad"
    echo "7) Programación de Tareas"
    echo "8) Ayuda (Opciones y Descripción)"
    echo "0) Salir"
    echo "=================================="
    read -rp "Selecciona una opción: " op
}

menu_iniciales() {
    clear
    echo "--- Iniciales ---"
    echo "1) date"
    echo "2) lshw"
    echo "3) whoami"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) date ;;
        2) sudo lshw ;;
        3) whoami ;;
    esac
    pause
}

menu_arch_dir() {
    clear
    echo "--- Archivos y Directorios ---"
    echo "1) find"
    echo "2) ln"
    echo "3) mkdir"
    echo "4) rm"
    echo "5) stat"
    echo "6) whereis"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) read -rp "Comando find: " c; eval "find $c" ;;
        2) read -rp "Comando ln: " c; eval "ln $c" ;;
        3) read -rp "Nombre del directorio: " d; mkdir "$d" ;;
        4) read -rp "Archivo/dir a eliminar: " f; rm -ri "$f" ;;
        5) read -rp "Archivo: " f; stat "$f" ;;
        6) read -rp "Comando: " c; whereis "$c" ;;
    esac
    pause
}

menu_texto() {
    clear
    echo "--- Archivos de Texto ---"
    echo "1) grep"
    echo "2) head"
    echo "3) sort"
    echo "4) tail"
    echo "5) wc"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) read -rp "grep: " c; eval "grep $c" ;;
        2) read -rp "head: " c; eval "head $c" ;;
        3) read -rp "sort: " c; eval "sort $c" ;;
        4) read -rp "tail: " c; eval "tail $c" ;;
        5) read -rp "wc: " c; eval "wc $c" ;;
    esac
    pause
}

menu_permisos() {
    clear
    echo "--- Permisos ---"
    echo "1) chmod"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) read -rp "chmod: " c; eval "chmod $c" ;;
    esac
    pause
}

menu_procesos() {
    clear
    echo "--- Administración de Procesos ---"
    echo "1) bg"
    echo "2) fg"
    echo "3) jobs"
    echo "4) kill"
    echo "5) nice"
    echo "6) pstree"
    echo "7) renice"
    echo "8) sleep"
    echo "9) Ejecutar en segundo plano (&)"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) bg ;;
        2) fg ;;
        3) jobs ;;
        4) read -rp "PID: " p; kill "$p" ;;
        5) read -rp "nice: " c; eval "nice $c" ;;
        6) pstree ;;
        7) read -rp "renice: " c; eval "renice $c" ;;
        8) read -rp "Segundos: " s; sleep "$s" ;;
        9) read -rp "Comando: " c; eval "$c &" ;;
    esac
    pause
}

menu_compresion() {
    clear
    echo "--- Compresión ---"
    echo "1) bunzip2"
    echo "2) bzip2"
    echo "3) gzip"
    echo "4) tar"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) read -rp "Archivo: " f; bunzip2 "$f" ;;
        2) read -rp "Archivo: " f; bzip2 "$f" ;;
        3) read -rp "Archivo: " f; gzip "$f" ;;
        4) read -rp "tar: " c; eval "tar $c" ;;
    esac
    pause
}

menu_tareas() {
    clear
    echo "--- Programación de Tareas ---"
    echo "1) crontab"
    echo "2) at"
    echo "3) atq"
    echo "4) atrm"
    echo "0) Volver"
    read -rp "Opción: " op

    case $op in
        1) crontab -e ;;
        2) read -rp "Hora (HH:MM): " h; at "$h" ;;
        3) atq ;;
        4) read -rp "ID tarea: " i; atrm "$i" ;;
    esac
    pause
}

ayuda() {
    clear
    echo "=== DESCRIPCIÓN DE COMANDOS ==="
    echo "date        → Muestra o ajusta fecha y hora"
    echo "lshw        → Información detallada del hardware"
    echo "whoami      → Usuario actual"
    echo "find        → Búsqueda de archivos"
    echo "ln          → Enlaces duros o simbólicos"
    echo "grep        → Buscar texto"
    echo "chmod       → Cambiar permisos"
    echo "kill        → Enviar señales a procesos"
    echo "tar/gzip    → Compresión de archivos"
    echo "crontab/at  → Programación de tareas"
    echo
    echo "Opciones comunes incluidas:"
    echo "-r -i -f -n -c -v -u -p -x -z -j -e -l"
    pause
}

while true; do
    menu_principal
    case $op in
        1) menu_iniciales ;;
        2) menu_arch_dir ;;
        3) menu_texto ;;
        4) menu_permisos ;;
        5) menu_procesos ;;
        6) menu_compresion ;;
        7) menu_tareas ;;
        8) ayuda ;;
        0) exit ;;
    esac
done
