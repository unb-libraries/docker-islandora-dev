#!/usr/bin/env bash

FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR="${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR:-$(echo $FEDORA_SERVER_IP)}"
FEDORASOLRGSEARCH_PORT_8080_TCP_PORT="${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT:-$(echo $FEDORA_SERVER_PORT)}"

# Ensure that Fedora server is ready for Islandora module install.
nc -zw10 ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR} ${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}
RETVAL=$?
while [ $RETVAL -ne 0 ]
do
   nc -zw10 ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR} ${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}
   RETVAL=$?
   echo -e "\t Waiting for Fedora server on ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}..."
   sleep 10
done
