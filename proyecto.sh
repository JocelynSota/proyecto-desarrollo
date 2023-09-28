#!/bin/bash

arg=$1

help(){
    echo "Debe especificar uno de los siguientes parametros"
    echo "-a"
    echo "  Mostrar informacion de las metodologias agiles"
    echo " -t"
    echo "  Mostrar informaciòn de las metodologias tradicionales"
}

menu_agil(){
    echo "Bienvenido a la guia rapida de Agile, para continuar seleccione un tema:"
    echo "1. SCRUM"
    echo "2. X.P"
    echo "3. Kanban"
    echo "4. Crystal"
    read -p "Su selecion: " seleccion
    case $seleccion in
        1) tema= "SCRUM";;
        2) tema="X.P";;
        3) tema="Kanban";;
        4) tema="Crystal";;
        *)
            menu_agil
            return;;
    esac
    menu_seccion
}

menu_tradicional(){
    echo "Bienvenido a la guia rapida de Metodologias Tradicionales, para continuar seleccione un tema:"
    echo "1. Cascada"
    echo "2. Espiral"
    echo "3. Model V"
    read -p "Su selecion: " seleccion
    case $seleccion in
        1) tema= "Cascada";;
        2) tema="Espiral";;
        3) tema="Modelo V";;

        *)
            menu_tradicional
            return;;
    esac
    menu_seccion
}


if [ "$#" -ne 1 ]; then
    help
    exit
fi

if [ "$arg" = "-a" ]; then
    menu_agil
elif [ "$arg" = "-t" ]; then
    menu_tradicional
else
    help
    exit
fi

