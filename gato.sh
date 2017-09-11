#!/bin/bash

jug=0
ban=0
sal=0
tco=0
op=0
posv=(0 0 0 0 0 0 0 0 0)
pos=(" " " " " " " " " " " " " " " " " ")
filcol=(0 0 0 0 0 0 0 0)
gan=0

function impTab1()
{
	echo -e "\t\t" '             '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" '  0 | 1 | 2  ' 
	echo -e "\t\t" ' ___|___|___ '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" '  3 | 4 | 5  '
	echo -e "\t\t" ' ___|___|___ '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" '  6 | 7 | 8  '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" '             '
}

function impTab()
{
	echo -e "\t\t" '             '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" "  ${pos[0]} | ${pos[1]} | ${pos[2]}  "
	echo -e "\t\t" ' ___|___|___ '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" "  ${pos[3]} | ${pos[4]} | ${pos[5]}  "
	echo -e "\t\t" ' ___|___|___ '
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" "  ${pos[6]} | ${pos[7]} | ${pos[8]}  "
	echo -e "\t\t" '    |   |    '
	echo -e "\t\t" '             '
}

function nomJug()
{
	echo -e "\nDame el nombre del jugador 1:"
	read jug1
	echo -e "\nDame el nombre del jugador 2:"
	read jug2
}

function impPort()
{
		echo -e "\e[1;32m \n\n\n\t\t P R O T E C O   presenta:   \n"
		echo -e "\e[1;36m\t\t"
		echo -e "\t\t" '  ____     _   _____  ___  '
		echo -e "\t\t" ' / ___|   / \ |_   _|/ _ \ '
		echo -e "\t\t" '| |  _   / _ \  | | | | | |'
		echo -e "\t\t" '| |_| | / ___ \ | | | |_| |'
		echo -e "\t\t" ' \____//_/   \_\|_|  \___/ '
		echo -e "\t\t" '                           '
		echo -e "\t\t" ' P R E B E   E D I T I O N'
		echo -e "\e[1;32m\n\n\t\t    Selecciona una opción \e[0;33m\e[1;33m:\e[1;37m\n\n\t\t      1) Jugar\n\t\t      2) Salir\e[0m"
			read op

}

function juego()
{

printf "\033c"
nomJug
printf "\033c"

echo -e "\nEste es el tablero y las posiciones"
impTab1

echo -e '\n\nPresione una tecla para continuar'
read -n1 -t6
printf "\033c"

while [ $gan -eq 0  ];do
	if [ $jug -eq 0 ];then
		while [ $tco -eq 0 ];do
			printf "\033c"
			impTab
			sleep 1
			printf "\033c"
			echo -e "\nEs turno de $jug1, en que posicion quieres tirar\n"
			read turno
				if [ "${posv[$turno]}" == 0 ];then
					let posv[$turno]=${posv[$turno]}+1
					pos[$turno]='x'
					tco=1
				else
					echo -e "\nPosicion no valida"
				fi
		done
		tco=0
		let jug=$jug+1
		gana
	elif [ $jug -eq 1 ];then
		while [ $tco -eq 0 ];do
			printf "\033c"
			impTab
			sleep 1
			printf "\033c"
			echo -e "\nEs turno de $jug2, en que posicion quieres tirar\n"
			read turno
				if [ "${posv[$turno]}" == 0 ];then
					let posv[$turno]=${posv[$turno]}-1
					pos[$turno]='o'
					tco=1
				else
					echo -e "\nPosicion no valida"
				fi
		done
		tco=0
		let jug=$jug-1
		gana
	fi

done

	op=0	
printf "\033c"
ganador

}

function gana()
{
	let filcol[0]=${posv[0]}+${posv[1]}+${posv[2]}
	let filcol[1]=${posv[3]}+${posv[4]}+${posv[5]}
	let filcol[2]=${posv[6]}+${posv[7]}+${posv[8]}
	let filcol[3]=${posv[0]}+${posv[3]}+${posv[6]}
	let filcol[4]=${posv[1]}+${posv[4]}+${posv[7]}
	let filcol[5]=${posv[2]}+${posv[5]}+${posv[8]}
	let filcol[6]=${posv[0]}+${posv[4]}+${posv[8]}
	let filcol[7]=${posv[2]}+${posv[4]}+${posv[6]}

	for n in {0..7};do
		if [ "${filcol[n]}" == -3 ];then
			gan=1
		elif [ "${filcol[n]}" == 3 ];then
			gan=1
		fi
	done
}

function ganador()
{
 echo -n -e "\nFELICIDADES"
 if [ $jug -eq 0 ];then
 	echo -n -e "\nHa ganado $jug2"
 	echo -e '\n\nPresione una tecla para continuar'
	read -n1 -t6
	printf "\033c"
 elif [ $jug -eq 1 ];then
	echo -n -e "\nHa ganado $jug1"
	echo -e '\n\nPresione una tecla para continuar'
	read -n1 -t6
	printf "\033c"
 fi
}

function reinic()
{
posv=(0 0 0 0 0 0 0 0 0)
pos=(" " " " " " " " " " " " " " " " " ")
filcol=(0 0 0 0 0 0 0 0)
gan=0

}

while [ "$sal" == 0 ];do

	case $op in
	0) impPort
	;;
	1) reinic 
	juego
	;;
	2) sal=1
	;;
	esac 
	
done
