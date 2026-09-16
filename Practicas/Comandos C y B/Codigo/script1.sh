#!/bin/bash
#
# script1.sh
# Práctica de Sistemas Operativos - Manejo de directorios y archivos en Ubuntu
#
# Este script automatiza la creación de carpetas, la copia de archivos y
# directorios, y la eliminación de archivos, siguiendo los pasos realizados
# manualmente durante la práctica.
#
# Uso:
#   chmod +x script1.sh
#   ./script1.sh
#

# Se detiene la ejecución si ocurre algún error en cualquier comando
set -e

# Ruta base donde se trabajará (carpeta Documentos del usuario actual)
BASE_DIR="$HOME/Documentos"

echo "==> Ingresando a la carpeta base: $BASE_DIR"
cd "$BASE_DIR"

# -----------------------------------------------------------------------
# 1. Creación de las carpetas principales con mkdir
# -----------------------------------------------------------------------
echo "==> Creando las carpetas practica1 y practica2"
mkdir -p practica1
mkdir -p practica2

# -----------------------------------------------------------------------
# 2. Creación del archivo Readme.txt dentro de practica1
#    (en la práctica original se usó "sudo gedit Readme.txt" de forma
#    interactiva; aquí se crea el archivo de forma automática con un
#    contenido de ejemplo para que el script sea reproducible)
# -----------------------------------------------------------------------
echo "==> Creando el archivo Readme.txt dentro de practica1"
echo "Este es el archivo Readme de la practica1." > practica1/Readme.txt

# -----------------------------------------------------------------------
# 3. Verificación del contenido del directorio con ls -l
# -----------------------------------------------------------------------
echo "==> Contenido de practica1 (ls -l):"
ls -l practica1

# -----------------------------------------------------------------------
# 4. Copia del archivo Readme.txt de practica1 a practica2
# -----------------------------------------------------------------------
echo "==> Copiando Readme.txt de practica1 a practica2"
cp -v practica1/Readme.txt practica2/

# -----------------------------------------------------------------------
# 5. Creación de las subcarpetas "vacia" e "info" dentro de practica2
# -----------------------------------------------------------------------
echo "==> Creando las subcarpetas vacia e info dentro de practica2"
mkdir -p practica2/vacia
mkdir -p practica2/info

echo "==> Creando un archivo de texto dentro de la carpeta info"
echo "Archivo de informacion de la practica." > practica2/info/info.txt

# -----------------------------------------------------------------------
# 6. Copia recursiva de las carpetas "vacia" e "info" hacia practica1
# -----------------------------------------------------------------------
echo "==> Copiando la carpeta vacia hacia practica1"
cp -r practica2/vacia practica1/

echo "==> Copiando la carpeta info hacia practica1"
cp -r practica2/info practica1/

echo "==> Contenido de practica1 despues de las copias (ls -l):"
ls -l practica1

# -----------------------------------------------------------------------
# 7. Eliminación del archivo Readme.txt y de la carpeta info en practica1
#    Advertencia: rm y rm -r eliminan de forma permanente, sin papelera.
# -----------------------------------------------------------------------
echo "==> Eliminando el archivo Readme.txt dentro de practica1"
rm practica1/Readme.txt

echo "==> Eliminando la carpeta info dentro de practica1"
rm -r practica1/info

echo "==> Contenido final de practica1 (ls -l):"
ls -l practica1

echo "==> Script finalizado correctamente."
