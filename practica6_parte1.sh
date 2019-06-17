#!/bin/bash
#Autor: Oscar Anadon O. NIA: 760628
#p6 p1

#logger escribe enrtadas en systemlog

#ojo con los awk y tal preguntar si es necesario coger todo

#uptime muestra numero de usuarios y carga media de trabajo
uptime | awk -F",  " '{print $2}' | logger -p local0.info
uptime | awk -F",  " '{print $2,$3}'| logger -p local0.info
#igual  de aqui hay que hacer un read y luego echo
uptime | awk -F",  " '{print $3}' |awk -F" " '{print $3,$4,$5}' | logger -p local0.info


#free memoria libre y usada y swap utilizado
#memoria
free |grep Mem |awk -F"        " '{print $2}' | awk -F"      " '{print $2,$3}' | logger -p local0.info
#swap
free |grep Swap|awk -F"           " '{print $2}'|cut -d" " -f1 | logger -p local0.info

#df espacio ocupado y libre,
df |  logger -p local0.info

#netstat numero de puertos abiertos y conexiones establecidads
#obien netstat -an,no se cual usar
netstat -tulpn |grep LISTEN | wc| awk -F"      " '{print $2}'  | logger -p local0.info

#ps numero de programas en ejecucion
#-1 por la linea de los titulos
ps |  wc| awk -F"      " '{print $2-1}' | logger -p local0.info

