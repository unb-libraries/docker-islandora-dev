#!/usr/bin/env bash
FEDORA_IP=`dig +short fedora.docker`

# Wait for Fedora Server to complete deployment
nc -zw10 ${FEDORA_IP} 8080
RETVAL=$?
while [ $RETVAL -ne 0 ]
do
   nc -zw10 ${FEDORA_IP} 8080
   RETVAL=$?
   echo -e "\t Waiting for Fedora server on $FEDORA_IP:8080..."
   sleep 10
done

cd /usr/share/nginx/html

# Set environment variables required by modules
drush vset islandora_base_url http://${FEDORA_IP}:8080/fedora

# Enable modules
drush --yes -u 1 en ${ISLANDORA_MODULES}
drush cc all
