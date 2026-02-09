#!/bin/bash
set -m

while true; do
    echo "1. Localizar utilidad y ver metadatos"
    echo "2. Comparar 2 utilidades y ordenar por mas reciente"
    echo "3. Crear directorio"
    echo "4. Borrar directorio"
    echo "5. Crear enlace de fichero"
    echo "6. Cambiar permisos y comprobar"
    echo "7. Ver metadatos de ruta"
    echo "0. Salir"

    read -rp "Introduce una opcion: " opt
    case $opt in 
        1) 
        read -rp "Introduce nombre de la utilidad " utl
        rt=$(find /usr/share/man/man1/$utl* -type f)
        stat $rt
        ;;
        2)
        #No se pq pero el grep hace cosas raras
        read -rp "Introduce nombre de la utilidad " utl
        read -rp "Introduce nombre de la segunda utilidad " utl2
        rt=$(find /usr/share/man/man1/$utl* -type f)
        stat $rt>ult.txt
        rt1=$(find /usr/share/man/man1/$utl2* -type f)
        stat $rt1>>ult.txt
        ls -l
        grep -i "modificacion" ult.txt  
        sort -m ult.txt 
        stat ult.txt
        ;;
        3)
        read -rp "Introduce la ruta que desea crear " ruta
        mkdir -p "$ruta"
        stat -f "$ruta"
        ;;
        4)
        read -rp "Introduce la ruta que desea crear " ruta
        rm -r "$ruta"
        stat -f "$ruta"
        ;;
        5)
        read -rp "Introduce la ruta del enlace que desea crear " ruta
        read -rp "Introduce la ruta donde el enlace se creara " ruta1
        read -rp "Introduce el tipo de enlace s o h " enl
        ln -"$enl"  "$ruta" "$ruta1" 
        ;;
        6)
        read -rp "Introduce la ruta del archivo que desea cambiar los permisos " ruta
        read -rp "Que permisos desea cambiar (formato numerico) " perms
        chmod "$perms" "$ruta"
        stat "$ruta"
        ;;
        7)
        read -rp "Introduce una ruta para mostrar " ruta
        stat -f "$ruta"
        ;;
        0)
        exit
        ;; 
    esac
done
/home/diurno/Documentos/VSCODE/vscode/Bash/Script.sh