#!/bin/bash

arg=$1

help() {
    echo "Debe especificar uno de los siguientes parámetros:"
    echo " -a"
    echo "    Mostrar información de las metodologías ágiles."
    echo " -t"
    echo "    Mostrar información de las metodologías tradicionales."
}

menu_agil() {
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
    echo " 1. SCRUM"
    echo " 2. X.P."
    echo " 3. Kanban"
    echo " 4. Crystal"
    read -p "Su selección: " seleccion
    case $seleccion in
        1) tema="SCRUM";;
        2) tema="X.P.";;
        3) tema="Kanban";;
        4) tema="Crystal";;
        *) 
           menu_agil
           return;;
    esac
    menu_seccion
}

menu_tradicional() {
    echo "Bienvenido a la guía rápida de Metodologías Tradicionales, para continuar seleccione un tema:"
    echo " 1. Cascada"
    echo " 2. Espiral"
    echo " 3. Modelo V"
    read -p "Su selección: " seleccion
    case $seleccion in
        1) tema="Cascada";;
        2) tema="Espiral";;
        3) tema="Modelo V";;
        *) 
           menu_tradicional
           return;;
    esac
    menu_seccion
}

menu_seccion() {
    while true
    do
        echo "Usted esta en la sección $tema, seleccione la opción que desea utilizar."
        echo " 1. Agregar información"
        echo " 2. Buscar"
        echo " 3. Eliminar información"
        echo " 4. Leer base de información"
        echo " 5. Cambiar de tema"
        echo " 6. Salir"
        read -p "Su selección: " seleccion
        case $seleccion in
            1) agregar;;
            2) buscar;;
            3) eliminar;;
            4) leer;;
            5) if [ "$arg" = "-a" ]; then
                menu_agil
            elif [ "$arg" = "-t" ]; then
                menu_tradicional
            fi;;
            6) exit;;
            *) 
            echo "Opción inválida."
            return;;
        esac
    done
}

agregar() {
    echo "Ingrese la información que desea agregar:"
    read -p "Concepto: " concepto
    read -p "Definición: " definicion
    echo "[$concepto] .- $definicion" >> $tema.inf
    echo "Información agregada con éxito."
}

buscar() {
    if [ ! -f $tema.inf ]; then
        echo "No existe información para el tema $tema."
        return
    fi
    echo "Ingrese la información que desea buscar:"
    read -p "Concepto: " concepto
    grep -i "\[$concepto\]" $tema.inf
}

eliminar() {
    if [ ! -f $tema.inf ]; then
        echo "No existe información para el tema $tema."
        return
    fi
    echo "Ingrese la información que desea eliminar:"
    read -p "Concepto: " concepto
    sed -i "/\[$concepto\]/d" $tema.inf
    echo "Información eliminada con éxito."
}

leer() {
    if [ ! -f $tema.inf ]; then
        echo "No existe información para el tema $tema."
        return
    fi
    cat $tema.inf
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
