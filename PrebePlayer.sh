#!/bin/bash
function cambioruta(){
	read nruta
	cd "$nruta"
}
printf "\033c" #limpiamos pantalla

while [ "$menu" != "5" ];do
ConfirmInstall=$(dpkg --get-selections | grep -w mpg123 | grep -w install)
if [ "$ConfirmInstall" = "" ]; then
	echo -e "\n mpg123 no esta instalado. Deseas instalarlo? (si/no)\n"
    read respuesta
    if [ "$respuesta" == "si" ];then
    	sudo apt install mpg123
		echo -e "\n\e[32m..::mpg123 instalado::..\e[0m\n"
	elif [ "$respuesta" == "no" ];then
    	echo -e "\n\e[32m..::Adios::..\e[0m\n"
    else
    	echo -e "respuesta no valida"
	fi
else
    	echo -e "\E[1;34m   _|_|_|                        _|                "
 	echo -e "\E[1;34m   _|    _|  _|  _|_|    _|_|    _|_|_|      _|_|  "
 	echo -e "\E[1;34m   _|_|_|    _|_|      _|_|_|_|  _|    _|  _|_|_|_|"
 	echo -e "\E[1;34m   _|        _|        _|        _|    _|  _|      "
 	echo -e "\E[1;34m   _|        _|          _|_|_|  _|_|_|      _|_|_|"
 	echo -e "\n"
 	echo -e "\E[1;34m   _|_|_|    _|                                        "
 	echo -e "\E[1;34m   _|    _|  _|    _|_|_|  _|    _|    _|_|    _|  _|_|"
 	echo -e "\E[1;34m   _|_|_|    _|  _|    _|  _|    _|  _|_|_|_|  _|_|    "
 	echo -e "\E[1;34m   _|        _|  _|    _|  _|    _|  _|        _|      "
 	echo -e "\E[1;34m   _|        _|    _|_|_|    _|_|_|    _|_|_|  _|      "
 	echo -e "\E[1;34m                                 _|                    "
 	echo -e "\E[1;34m                             _|_|                      "
 	echo -e "\t\e[32m..::Menú::..\e[0m\n"
	echo -e "\t\e[32m1)\e[0m Comenzar a reproducir canciones"
	echo -e "\t\e[32m2)\e[0m Seleccionar y reproducir canción"
	echo -e "\t\e[32m3)\e[0m Listar opciones del reproductor"
	echo -e "\t\e[32m4)\e[0m Cambiar de carpeta"
	echo -e "\t\e[32m5)\e[0m Salir\n"
	echo -e "\t\e[32m..::Carpeta::..\e[0m`pwd` \n"
	read menu
	  
	case $menu in
		1)
			mpg123 *mp3
		 	clear
		;;
		2)
			echo -e "\n\e[32m..::Nombra la cancion que quieres escuchar::..\e[0m(cancion.mp3)"
            		read esta
            		mpg123 $esta
			clear
		;;
		3) 
			echo -e "\n\e[32m..::Opciones de reproducción::..\e[0m\n\n\e[32m[s]\e[0m Pausa\n\e[32m[f]\e[0m Siguiente\n\e[32m[d]\e[0m Anterior\n\e[32m[b]\e[0m Repetir\n\e[32m[.]\e[0m Adelante\n\e[32m[,]\e[0m Atrás\n\e[32m[+]\e[0m Volumen Arriba\n\e[32m[-]\e[0m Volumen Abajo\n\e[32m[q]\e[0m Quitar reproducción\n\e[32m[h]\e[0m Más opciones mpg123\n"
			echo -e "\E[1;32m	\nPresione una tecla para continuar..."
			read
			clear
		;;
		4) 
			echo -e "\n\e[32m..::Introduzca Nueva Ruta::..\e[0m\n" 
			cambioruta 
		  	printf "\033c"
		  	clear
		;;
		5)
			echo -e "\n\e[32m..::Vuelve Pronto::..\e[0m\n"
		;;
		*)
			echo -e "\n\e[32m..::Opcion no valida::..\e[0m\n"
		  	read
		  	clear
		;;
	esac
  fi
done
