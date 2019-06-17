#!/bin/bash

# Autor: Óscar Anadon Olalla. NIA: 760628

echo "Numero de usuarios y carga media de trabajo: " | logger -p local0.info
uptime | cut -d ',' -f2-9 | logger -p local0.info

echo "Memoria ocupada y libre, swap utilizado" | logger -p local0.info
free | grep 'total' | awk '{print "           " $2 "       " $3}' | logger -p local0.info
free | grep 'Mem' | awk '{print $1 "       " $3 "    " $4}' | logger -p local0.info
free | grep 'Swap' | awk '{print $1 "      " $3 }' |logger -p local0.info

echo "Espacio ocupado y libre:" | logger -p local0.info
df -hT | grep 'S.ficheros' |awk '{print "  Disco" "       " $4 "    " $5 }' | logger -p local0.info
df -hT | grep '/dev/sda1' |awk '{print $1 "     " $4 "      " $5 }' | logger -p local0.info


port_numbers=$(netstat -atu | wc -l)
connection_numbers=$(netstat | grep 'CONNECTED' | wc -l)
echo "El numero de puertos abiertos y conexiones establecidas es $((port_numbers - 2)) y $connection_numbers respetivamente" | logger -p local0.info


process_numbers=$(ps | wc -l)
echo "El numero de programas en ejecucion es $((process_numbers - 1))" | logger -p local0.info


