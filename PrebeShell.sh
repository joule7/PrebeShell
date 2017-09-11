#!/bin/bash
# Programa PrebeShell.sh
#Autores EduardoGueva & joule7

#Impedimos salir con Ctrl-z y Ctrl-c
trap 'salir' 2 20
trap 'salir' SIGTSTP

salir()
{
	echo -e "\nNo sirve tal accion, escriba: salir -> termina el programa"
	echo -e "\nEn su defecto ayuda -> para ver los comandos"
}
printf "\033c"

#Contador para los intentos
intentos=0

while [ "$intentos" != 3 ]; do
	echo -e "\nBienvenido $USER!!! estas en la ..::PrebeShell::.."
	echo -e "\nfavor de ingresar:"
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
			printf "\033c"#Despues del ingreso borramos la pantalla
		#Lectura y accion de Comandos
		while [ "$comando"  != 'salir' ];do
		#Definicion de nuestro prompt
		echo  -e -n "\e[32m..::PREBESHELL::..\e[00m$usuario$PWD-->" #pwd nos muestra la ruta en que el usuario esta actualmente
		read  comando #Nuestra variable comparativa
		if [ "$comando" == "arbol" ];then
			echo -e "\n\e[32m..::Árbol::..\e[0m\n"
			tree
		elif [ "$comando" == "ayuda" ];then
			echo -e "\n\e[32m..::Información de Comandos::..\e[0m\n"
			echo -e "\e[32minfosis:\e[0m Presenta la información del sistema"
			echo -e "\e[32mfecha:\e[0m Muestra la fecha actual"
			echo -e "\e[32mhora:\e[0m Muestra la hora actual"
			echo -e "\e[32mbuscar:\e[0m Busca un archivo escribir: archivo directorio"
			echo -e "\e[32marbol:\e[0m Presenta una simulación del comando tree"
			echo -e "\e[32mPrebePlayer:\e[0m Reproductor PrebePlayer"
			echo -e "\e[32mGH:\e[0m Guitar Hero (juego)"
			echo -e "\e[32mjuego2:\e[0m Juego 2"
			echo -e "\e[32mcreditos:\e[0m Nombre de los programadores"
			echo -e "\e[32mcls:\e[0m limpia la pantalla\n"
		elif [ "$comando" == "infosis" ];then
			echo -e "\n\e[32m..::Información del Sistema::..\e[0m\n"
			echo -n -e "\e[32mFabricante Equipo: \e[0m"
			sudo dmidecode -s system-manufacturer
			echo -n -e "\e[32mNombre del Producto: \e[0m"
			sudo dmidecode -s system-product-name
			echo -n -e "\e[32mEtiqueta de servicio: \e[0m"
			sudo dmidecode -s system-version
			echo -n -e "\e[32mNúmero de Serie del Equipo: \e[0m"
			sudo dmidecode -s system-serial-number
			echo -n -e "\e[32mFabricante procesador: \e[0m"
			sudo dmidecode -s processor-manufacturer
			echo -n -e "\e[32mArquitectura: \e[0m"
			uname -m
			echo -n -e "\e[32mDatos Procesador: \e[0m"
			grep 'model name' /proc/cpuinfo
			echo -n -e "\e[32mKernel: \e[0m"
			uname -o
			echo -n -e "\e[32mDistribución: \e[0m"
			lsb_release -idc
			echo -n -e "\e[32mUsuario Actual: \e[0m"
			whoami			
			echo -e "\e[32mCarcaterísticas Unidades Almacenamiento: \e[0m"
			df -h
		elif [ "$comando" == "fecha" ];then
			echo -e "\n\e[32m..::Fecha::..\e[0m"
			date "+%nHoy es: %Y-%m-%d%n"
		elif [ "$comando" == "hora" ];then
			echo -e "\n\e[32m..::Hora::..\e[0m"
			date "+%nLa hora es: %H:%M:%S%n"
		elif [ "$comando" == "buscar" ];then
			echo "funcion comando buscar en proceso"
		elif [ "$comando" == "GH" ];then
			cd /bin/bash ./GH.sh
		elif [ "$comando" == "juego2" ];then
			cd /bin/bash ./juego2.sh
		elif [ "$comando" == "PrebePlayer" ];then
			cd /bin/bash ./PrebePlayer.sh
		elif [ "$comando" == "creditos" ];then
			echo -e "\n\e[32m..::Créditos::..\e[0m\n"
			echo -e "Guevara López Eduardo"
			echo -e "Martínez Troncoso Julio César\n"
		elif [ "$comando" == "cls" ];then
			printf "\033c"
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
