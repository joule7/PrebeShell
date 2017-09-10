#!/bin/bash
# Programa PrebeShell.sh
#Autores EduardoGueva & joule7

#Impedimos salir con Ctrl-z y Ctrl-c
trap 'salir' 2 20
trap 'salir' SIGTSTP

salir()
{
	echo -e "\nNo sirve tal accion, escriba: salir"
}
printf "\033c"

#Contador para los intentos
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
		#Lectura y accion de Comandos
		while [ "$comando"  != 'salir' ];do 
		echo  -e -n "$usuario$PWD-->" #pwd nos muestra la ruta en que el usuario esta actualmente
		read  comando #Nuestra variable comparativa
		if [ "$comando" == "arbol" ];then
			#
		elif [ "$comando" == "ayuda" ];then
			#
		elif [ "$comando" == "infosis" ];then
			#
		elif [ "$comando" == "fecha" ];then
			#
		elif [ "$comando" == "hora" ];then
			#
		elif [ "$comando" == "buscar" ];then
			#
		elif [ "$comando" == "juego1" ];then
			#
		elif [ "$comando" == "juego2" ];then
			#
		elif [ "$comando" == "prebeplayer" ];then
			#
		elif [ "$comando" == "creditos" ];then
			#
		elif [ "$comando" == "cls" ];then
			#
		elif [ "$comando" == "salir" ];then
			exit 1
		else
			$comando
		fi
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
