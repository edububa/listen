#!/bin/bash

source conf/*

if [ $# -eq 0 ]
then
    exit 0
fi

if [ $# -gt 2 ]
then
    echo "listen.sh: Error(listen.sh [arg1 [arg2]), uso incorrecto del mandato. \"Success\"
listen.sh+ <<se han introducido $# cuando se esperaba 1 o 2 argumentos>>" 1>&2
    exit 64
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    echo  "listen.sh: Uso: <<./listen.sh [arg1 [arg2]]>>
listen.sh: <<Script que reproduce los audios adecuados>>"
    exit 0
fi

if [ "$1" = "list" ]
then
    cat Audios_index.txt
    exit 0
fi

if [ $# -eq 1 ]
then
    for song in $U5; do
	echo "Reproduciendo $song de $1"
	afplay $song
    done
fi
		      
		      
if [ $# -eq 2 ]
then
    if [ -e $SRC/$2 ]
    then
	echo "Reprduciendo $SRC/$2"
	afplay $SRC/$2 
    fi
fi

exit
