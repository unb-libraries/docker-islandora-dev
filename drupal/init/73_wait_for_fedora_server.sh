#!/usr/bin/env bash

FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR="${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR:-$(echo $FEDORA_SERVER_IP)}"
FEDORASOLRGSEARCH_PORT_8080_TCP_PORT="${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT:-$(echo $FEDORA_SERVER_PORT)}"

string="Repository Information View"
if ! curl -s "http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora/describe" | grep -q "$string"; then
  while [ $RETVAL = "" ];
  do
     RETVAL=`curl -s "http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora/describe" | grep -q "$string"`
     echo -e "\t Waiting for Fedora server on ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}..."
     sleep 10
  done
fi
