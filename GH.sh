#!/bin/bash

tecla=77
punt=0
vel=3
ban=0
sal=0
op=0

function imprimeTeclas()
{
	sleep .2
	case "$tecla" in
	
	0)
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t\e[0;36mQ\e[0;33m\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	;;
	1)
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t\e[0;36mW\e[0;33m\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	;;
	2)
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t\e[0;36mE\e[0;33m\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	;;
	3)
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t\e[0;36mR\e[0;33m\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	;;
	4)
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t\e[0;36mT\e[0;33m\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	;;
	5)
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t\e[0;36mY\e[0;33m'
	echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
	;;
	
	esac
}

function selectDif()
{
	while [ $ban -eq 0 ];do
	echo -e -n "\033[36m\nSELECCIONA DIFICULTAD\033[00m"
	echo -e -n "\033[36m\n1)FACIL\033[00m"
	echo -e -n "\033[36m\n2)MEDIO\033[00m"
	echo -e -n "\033[36m\n3)DIFICIL\n\033[00m"
	read dif
	
		case $dif in
		1)
		vel=2
		ban=1
		;;
		2)
		vel=1.5
		ban=1
		;;
		3)
		vel=1
		ban=1
		;;
		*)
		echo -e "\nOpcion no valida"
		;;
		esac
	done
}

function impPort()
{
			echo -e "\e[1;32m \n\n\n\t\t P R O T E C O   presenta:   \n"
			echo -e "\e[1;36m\t\t"
			echo -e "\t\t" '  ____       _ _               _   _                '
			echo -e "\t\t" ' / ___|_   _(_) |_ __ _ _ __  | | | | ___ _ __ ___  '
			echo -e "\t\t" '| |  _| | | | | __/ _` |  __| | |_| |/ _ \  __/ _ \ '
			echo -e "\t\t" '| |_| | |_| | | || (_| | |    |  _  |  __/ | | (_) |'
			echo -e "\t\t" ' \____|\__,_|_|\__\__,_|_|    |_| |_|\___|_|  \___/ '
			echo -e "\t\t" '                                                    '
			echo -e "\t\t" '             P R E B E   E D I T I O N'
			echo -e "\e[1;32m\n\n\t\t    Selecciona una opción \e[0;33m\e[1;33m:\e[1;37m\n\n\t\t\t      1) Jugar\n\t\t\t      2) Instrucciones\n\t\t\t      3) Salir\e[0m"
			read op

}

function juego()
{

printf "\033c"

	selectDif

	printf "\033c"
	
	echo -e "PREPARATE PARA JUGAR EN: 3"
	sleep .8
	printf "\033c"
	echo -e "PREPARATE PARA JUGAR EN: 2"
	sleep .8
	printf "\033c"
	echo -e "PREPARATE PARA JUGAR EN: 1"
	sleep .8
	printf "\033c"

	for n in {1..30};do

	tecla=$(($RANDOM%6))

	imprimeTeclas

		case "$tecla" in
			0) if read -s -n1 -t$vel tp;then
				if [ $tp == 'q' ];then
				let punt=$punt+1
				fi
			else
				echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
			fi
				;;
			1) if read -s -n1 -t$vel tp;then
				if [ $tp == 'w' ];then
				let punt=$punt+1
				fi
			else
				echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
			fi
				;;
			2) if read -s -n1 -t$vel tp;then
				if [ $tp == 'e' ];then
				let punt=$punt+1
				fi
			else
				echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
			fi
				;;
			3) if read -s -n1 -t$vel tp;then
				if [ $tp == 'r' ];then
				let punt=$punt+1
				fi
			else
				echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
			fi
				;;
			4) if read -s -n1 -t$vel tp;then
				if [ $tp == 't' ];then
				let punt=$punt+1
				fi
			else
				echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
			fi
				;;
			5) if read -s -n1 -t$vel tp;then
				if [ $tp == 'y' ];then
				let punt=$punt+1
				fi
			else
				echo -e '\e[0;33m\t\t\t|\t|\t|\t|\t|\t|'
			fi
				;;
				
			esac
	done
	op=0	
printf "\033c"
echo -e "\n\e[0;33mTu puntuación es: $punt"
echo -e '\n\n\e[0;33mPresione una tecla para continuar'
read -n1 -t6
printf "\033c"

}

function instruc()
{
			clear
			op=0
			echo -e "\e[1;35m\n\t\t\tI N S T R U C C I O N E S\n\n"
			echo -e "\e[1;34mEn la pantalla iran apareciendo las teclas que tienes que presionar, estas "
			echo -e "teclas seran 'q' 'w' 'e' 'r' 't' 'y', tu objetivo es presionarlas rapidamente"
			echo -e "antes de que se te acabe el tiempo y aparezca la siguiente tecla a presionar."
			echo -e "\e[1;35m\n\t\tPresiona 'enter' para volver\e[0m"
			read

}

function reinic()
{
tecla=77
punt=0
vel=3
ban=0
sal=0
op=0
}

while [ "$sal" == 0 ];do

	case $op in
	0) impPort
	;;
	1) reinic
	juego
	;;
	2) instruc
	;;
	3) sal=1
	;;
	esac 
	
done
