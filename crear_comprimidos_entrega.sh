#!/bin/bash

FECHA=$(date +%Y%m%d)
# DIRECTORIOS_ORIGEN="${@:2}"
DIRECTORIOS_ORIGEN="/root /etc /opt /var /www_dir /backup_dir"
DIRECTORIO_DESTINO="/git/computacion-aplicada-tp"


# Chequea que el directorio de destino exista.

check_destino(){
	if [ ! -d "$DIRECTORIO_DESTINO" ]; then
		echo "El directorio de destino: '$DIRECTORIO_DESTINO' NO EXISTE!!. "
		exit 1
	else
		echo "El directorio de destino: '$DIRECTORIO_DESTINO)' existe."
	fi
}


# Chequea que los directorios de origen existan y crea los comprimidos de cada directorio
# de origen.

check_origen(){
	for DIRECTORIO in $DIRECTORIOS_ORIGEN; do
		if [ ! -d "$DIRECTORIO" ]; then
			echo "El directorio de origen: '$DIRECTORIO' NO EXISTE!!. "
			exit 1
		else
			echo "El directorio de origen: '$DIRECTORIO' existe."
			echo "El nuevo destino sera '$DIRECTORIO_DESTINO$DIRECTORIO'"
			echo "----------------------------------"
		fi
		echo "-----------------------"	
		tar -czvf "$DIRECTORIO_DESTINO/$(basename "$DIRECTORIO")_entrega_$FECHA.tar.gz" -C "$(dirname "$DIRECTORIO")" "$(basename "$DIRECTORIO")"		
		echo "-----------------------"
	done
}


# PROGRAMA PRINCIPAL

check_origen
check_destino

