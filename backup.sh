#!/bin/bash

ORIGEN="/home/admin1/Desktop/directorio_origen"
DESTINO="/home/admin1/Desktop/directorio_destino"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
mkdir -p "$DESTINO"

LOG=$(ls $DESTINO | grep "backup--" | head -n 1)

if [ -f "$DESTINO/$LOG" ]; then
    echo "Actualizando backup"
    {
        echo "============================"
        echo "Fecha: $FECHA"
        rsync -avh --delete "$ORIGEN" "$DESTINO"
        echo "============================"
    } >> "$DESTINO/$LOG" 2>&1
    mv "$DESTINO/$LOG" "$DESTINO/backup--$FECHA"
    echo "$DESTINO/$LOG" "$DESTINO/backup--$FECHA"
else
    echo "Creando backup"
    LOG="$DESTINO/backup--$FECHA"
    {
    echo "============================"
    echo "Fecha: $FECHA"
    rsync -avh --delete "$ORIGEN" "$DESTINO"
    echo "============================"
    } > "$LOG" 2>&1
fi

echo "Origen: $ORIGEN"
echo "Destino: $DESTINO"
echo "Log: $DESTINO/$LOG"
echo "Backup completado exitosamente el $FECHA."
