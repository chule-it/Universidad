#!/bin/bash

FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo "=============================================" >> ~/salud_pc.log
echo "SALUD DE LA COMPUTADORA" >> ~/salud_pc.log
echo "Fecha y hora: $FECHA" >> ~/salud_pc.log
echo "=============================================" >> ~/salud_pc.log

echo "" >> ~/salud_pc.log
echo "--- MEMORIA RAM ---" >> ~/salud_pc.log
free -h >> ~/salud_pc.log

echo "" >> ~/salud_pc.log
echo "--- ALMACENAMIENTO ---" >> ~/salud_pc.log
df -h >> ~/salud_pc.log

echo "" >> ~/salud_pc.log
echo "--- PROCESADOR ---" >> ~/salud_pc.log
uptime >> ~/salud_pc.log

echo "" >> ~/salud_pc.log
