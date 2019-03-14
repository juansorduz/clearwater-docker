#!/bin/bash
#/usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh

set -e

num_users=${1:-50000}
#echo $num_users         50000
top_number=$(expr 2010000000 + $num_users - 1)
#echo $top_number         2010049999
numbers=$(seq 2010000000 $top_number)
#echo $numbers          2010.000.000  2010.000.001  ... 2010049999
#$numbers contiene los numeros de 2010000000 hasta 2010049999

filename=/tmp/$$.users.csv
#echo $filename         /tmp/2070.users.csv
#$$ es el PID del proceso de bash
#root@f48b8b192e35:/tmp# ps -p $$
#PID TTY          TIME CMD
# 2070 pts/0    00:00:03 bash


. /etc/clearwater/config; for DN in $numbers ; do
# /etc/clearwater/config ejecuta los scripts . /etc/clearwater/shared_config y . /etc/clearwater/user_settings
echo sip:$DN@$home_domain,$DN@$home_domain,$home_domain,7kkzTyGW ;
#sip:2010006319@example.com,2010006319@example.com,example.com,7kkzTyGW   Cambia con $DN
done > $filename
#Se almacenan los echo en el filename     /tmp/2070.users.csv
#sip:2010000000@example.com,2010000000@example.com,example.com,7kkzTyGW
#sip:2010000001@example.com,2010000001@example.com,example.com,7kkzTyGW
#sip:2010000002@example.com,2010000002@example.com,example.com,7kkzTyGW
#...
#sip:2010049996@example.com,2010049996@example.com,example.com,7kkzTyGW
#sip:2010049997@example.com,2010049997@example.com,example.com,7kkzTyGW
#sip:2010049998@example.com,2010049998@example.com,example.com,7kkzTyGW
#sip:2010049999@example.com,2010049999@example.com,example.com,7kkzTyGW

echo "Creating $num_users users..."


/usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/bulk_create.py $filename > /dev/null 2>&1
#Se ejecuta el script de python y la salida se elimina
#Cuando se elimina la redireccion de la salida se tiene lo siguiente
#root@f48b8b192e35:/dev# /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/bulk_create.py $filename
#Generating bulk provisioning scripts for users in /tmp/2070.users.csv...
#Generated homestead bulk provisioning scripts
#- /tmp/2070.users.create_homestead.sh            - run this script on Homestead
#- /tmp/2070.users.create_homestead_cache.casscli - copy this file onto Homestead
#- /tmp/2070.users.create_homestead_provisioning.casscli - copy this file onto Homestead
#Generated homer bulk provisioning scripts
#- /tmp/2070.users.create_xdm.sh                  - run this script on Homer
#- /tmp/2070.users.create_xdm.cqlsh               - copy this file onto Homer


/tmp/$$.users.create_homestead.sh > /dev/null 2>&1
#Ejecuta el script que llama otros archivos pesados que aparentemente realizan el registro


echo "Created $num_users users"

rm /tmp/$$.users.*
#Eliminan los temporales
