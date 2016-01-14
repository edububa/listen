#!/bin/bash -x

source conf/*

if [ $# -eq 0 ]
then
    exit 0
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    echo  "listen.sh: Uso: <<./listen.sh [arg1 [arg2]]>>
listen.sh: <<Script que reproduce los audios adecuados>>"
    exit 0
fi

if [ "$1" = "options" ]
then
    cat Audios_index.txt
    exit 0
fi

if [ $# -eq 1 ]
then
    if [ true ]
       then
 	   for var in $1
	   do
	       echo "Reprduciendo $var"
	       afplay $SRC/$var
	   done
    fi
fi
		      
		      
if [ $# -eq 2 ]
then
    if [ -e $SRC/$2 ]
    then
	echo "Reprduciendo $SRC/$2 "
	afplay $SRC/$2 
    fi
fi
