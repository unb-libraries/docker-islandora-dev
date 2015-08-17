#!/usr/bin/env bash
FEDORA_IP=`dig +short fedora.docker`

# Ensure that Fedora server is ready for Islandora module install.
nc -zw10 ${FEDORA_IP} 8080
RETVAL=$?
while [ $RETVAL -ne 0 ]
do
   nc -zw10 ${FEDORA_IP} 8080
   RETVAL=$?
   echo -e "\t Waiting for Fedora server on $FEDORA_IP:8080..."
   sleep 10
done