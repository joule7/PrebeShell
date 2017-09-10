#!/bin/bash

trap 'salir' 2 20

salir()
{
	echo -e "\nNo sirve"
}

printf "\033c"

intentos=0

while [ "$intentos" != 3 ]; do
	echo -e "\nUsuario:"
	read usuario  
	echo -e "\nContrasena:"
	read -s contrasena

	cont=`sudo -S grep -c "$usuario" /etc/shadow`
	con=`echo "$contrasena" | sudo -S grep -r "$usuario" /etc/shadow`

	if [ $cont -ne 0 ];then

		ban=`grep mkpasswd /usr/bin/mkpasswd`
		if [ $ban != "Coincidencia en el archivo binario /usr/bin/mkpasswd" ];then
			echo "$contrasena" | sudo -S  apt-get install whois
		fi
	
		read -r -a arshdw <<< "$con"  
		tencript="sha-512"
		co=`mkpasswd --method=$tencript --salt=${arshdw[2]} $contrasena`
		c=":"
		contra=$usuario$c$co	

		if [[ $con == *$contra* ]];then 

		printf "\033c"
		echo -e -n "[31mPREBESHELL[00m"
		printf "\033c"

		while [ "$comando"  != 'salir' ];do 
		echo  -e -n "$usuario$PWD-->"
		read  comando
		case "$comando" in
		
		ayuda)
		;;
		cls)
		;;
		infosis)
		;;
		arbol)
		;;
		fecha)
		;;
		hora)
		;;
		busca)
		;;
		Juego1)
		;;
		Juego2)
		;;
		creditos)
		;;
		prebeplayer)
		;;
        salir)
            exit 1
        ;;
		*)
			echo -e "\n$comando: no se reconoce la orden\n"
		;;
		esac
		
		done
	else
	echo -e "\nUsuario o contraseña incorrectos"
	let intentos=$intentos+1 
	fi
	
	else
	echo -e "\nUsuario o contraseña incorrectos" 
	let intentos=$intentos+1
	fi
done
