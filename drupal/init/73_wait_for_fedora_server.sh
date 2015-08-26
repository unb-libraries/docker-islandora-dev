#!/usr/bin/env bash

# Here, we default to using the address from a linked container named 'fedorasolrgsearch', falling back to using the
# details provided through FEDORA_SERVER_IP and FEDORA_SERVER_PORT environment variables.
FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR="${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR:-$(echo $FEDORA_SERVER_IP)}"
FEDORASOLRGSEARCH_PORT_8080_TCP_PORT="${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT:-$(echo $FEDORA_SERVER_PORT)}"

# Crude way to determine if Fedora is ready : test to see if returns data on the /describe page as expected.
FEDORA_ALIVE_STRING="Repository Information View"
if ! curl -s "http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora/describe" | grep -q "$FEDORA_ALIVE_STRING"; then
  while [ $RETVAL = "" ];
  do
     RETVAL=`curl -s "http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora/describe" | grep -q "$FEDORA_ALIVE_STRING"`
     echo -e "\t Waiting for Fedora server on ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}..."
     sleep 10
  done
fi
