#!/bin/bash

# ARGUMENTOS ---------------------------------------------------
ORIGEN="/home/admin1/Desktop/directorio_origen"
DESTINO="/home/admin1/Desktop/directorio_destino"

# CODIGO -------------------------------------------------------
echo -e "\n> Target: $ORIGEN"
echo -e "> Backup: $DESTINO"

FECHA=$(date +"%d/%m/%Y - Hs: %H:%M:%S")
FECHA_NAME=$(date +"%d-%m-%Y__%H-%M-%S")

mkdir -p "$DESTINO"

if ! [ -d "$ORIGEN" ]; then
    echo -e "\nArchivo de origen inexistente"
    exit
else
    LOG="$DESTINO/"$(ls $DESTINO | grep "backup__" | head -n 1)

    if [ -f "$LOG" ]; then
        echo -e "\n... Actualizando backup"
        {
            echo "============================"
            echo "Fecha: $FECHA"
            rsync -avh --delete "$ORIGEN" "$DESTINO"
        } >> "$LOG" 2>&1
        mv "$LOG" "$DESTINO/backup__$FECHA_NAME.txt"
        LOG="$DESTINO/backup__$FECHA_NAME.txt"
    else
        echo "... Creando backup"
        LOG="$DESTINO/backup__$FECHA_NAME.txt"
        {
        echo "============================"
        echo "LOGS DE $DESTINO"
        echo "============================"
        echo "Fecha: $FECHA"
        rsync -avh --delete "$ORIGEN" "$DESTINO"
        } > "$LOG" 2>&1
    fi

    echo -e "\nSUCCESS!"
    echo -e "\n> Logs: $LOG"
    echo -e "\n\n\n============================"
    echo "Last records"
    echo -e "============================\n"
    tail "$LOG"
fi
