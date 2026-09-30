#!/bin/bash

while true
do
    FECHA=$(date "+%Y-%m-%d %H:%M:%S")

    RAM=$(free -m | awk '/Mem:/ {
        printf "%d/%d MB (%.1f%%)", $3, $2, ($3/$2)*100
    }')

    CPU=$(LC_ALL=C top -bn1 | awk -F',' '/Cpu\(s\)/ {
        for(i=1;i<=NF;i++)
            if($i ~ / id/) {
                gsub(/[^0-9.]/,"",$i)
                printf "%.1f%%", 100-$i
                exit
            }
    }')

    echo "[$FECHA] PID=$$ | RAM=$RAM | CPU=$CPU"

    sleep 1
done
