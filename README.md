Create simple backups for Linux devices.

### How to execute

```
git clone https://github.com/TobiasCoding/backup.git
```

```
cd backup
```

```
chmod 755 backup.sh
```

```
./backup.sh
```

The code will create a backup of the example folder `directorio_origen`.

### Configure the variables
To implement this script, you must change the variables in `backup.sh`:
```
ORIGEN="/home/admin1/Desktop/prueba/shell_scripts/directorio_origen"

DESTINO="/home/admin1/Desktop/prueba/shell_scripts/directorio_destino"
```

### Logs file

Example:

```
cat backup__29-08-2024__22-50-44
```

```
============================
Fecha: 29-08-2024__22-50-24
sending incremental file list
directorio_origen/
directorio_origen/file2
directorio_origen/file3
directorio_origen/file5
directorio_origen/file6
directorio_origen/file8
directorio_origen/file9
directorio_origen/folder/
directorio_origen/folder/file1

sent 544 bytes  received 165 bytes  1,42K bytes/sec
total size is 16  speedup is 0,02
============================
Fecha: 29-08-2024__22-50-43
sending incremental file list

sent 233 bytes  received 18 bytes  502,00 bytes/sec
total size is 16  speedup is 0,06
============================
Fecha: 29-08-2024__22-50-44
sending incremental file list

sent 233 bytes  received 18 bytes  502,00 bytes/sec
total size is 16  speedup is 0,06
```


______
Developed by tobiasrimoli@protonmail.com
