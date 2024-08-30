#!/bin/bash

# PARAMETROS ---------------------------------------------------
ORIGEN="/home/admin1/Desktop/directorio_origen"
DESTINO="/home/admin1/Desktop/directorio_destino"

# CODIGO -------------------------------------------------------
FECHA=$(date +"%d-%m-%Y__%H-%M-%S")
mkdir -p "$DESTINO"

if ! [ -d "$ORIGEN" ]; then
    echo "Archivo de origen inexistente"
    exit
else
    LOG="$DESTINO/"$(ls $DESTINO | grep "backup__" | head -n 1)
    echo "$LOG"

    if [ -f "$LOG" ]; then
        echo "Actualizando backup"
        {
            echo "============================"
            echo "Fecha: $FECHA"
            rsync -avh --delete "$ORIGEN" "$DESTINO"
        } >> "$LOG" 2>&1
        mv "$LOG" "$DESTINO/backup__$FECHA"
        LOG="$DESTINO/backup--$FECHA"
    else
        echo "Creando backup"
        LOG="$DESTINO/backup__$FECHA"
        {
        echo "============================"
        echo "Fecha: $FECHA"
        rsync -avh --delete "$ORIGEN" "$DESTINO"
        } > "$LOG" 2>&1
    fi

    echo "Origen: $ORIGEN"
    echo "Destino: $DESTINO"
    echo "Log: $LOG"
    echo "Backup completado exitosamente el $FECHA."
fi
