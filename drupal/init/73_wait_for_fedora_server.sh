#!/usr/bin/env bash

# Here, we default to using the address from a linked container named 'fedorasolrgsearch', falling back to using the
# details provided through FEDORA_SERVER_IP and FEDORA_SERVER_PORT environment variables.
FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR="${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR:-$(echo $FEDORA_SERVER_IP)}"
FEDORASOLRGSEARCH_PORT_8080_TCP_PORT="${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT:-$(echo $FEDORA_SERVER_PORT)}"

# Is this the initial install? If so, fedorasolrgsearch might be slow to deploy. Make sure it is done before
# proceeding, since the next test will pass during initial deployment.
FEDORA_INIT_STRING="INIT"
FEDORA_INIT_URL="http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/init.txt"
RETVAL_INIT="${FEDORA_INIT_STRING}"
if [[ ! -f /tmp/DRUPAL_DB_LIVE && ! -f /tmp/DRUPAL_FILES_LIVE ]];
then
  while [ ! "${RETVAL_INIT}" == "" ];
  do
    RETVAL_INIT=`curl -s "${FEDORA_INIT_URL}" | grep "${FEDORA_INIT_STRING}"`
    echo -e "\t Waiting for Fedora server initial deployment on ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}..."
    sleep 10
  done
fi

# Crude way to determine if Fedora is ready : test to see if returns data on the /describe page as expected.
FEDORA_ALIVE_STRING="Repository Information"
FEDORA_DESCRIBE_URL="http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora/describe"
if ! curl -s "${FEDORA_DESCRIBE_URL}" | grep -q "${FEDORA_ALIVE_STRING}"; then
  while [ "${RETVAL}" == "" ];
  do
     RETVAL=`curl -s "${FEDORA_DESCRIBE_URL}" | grep "${FEDORA_ALIVE_STRING}"`
     echo -e "\t Waiting for Fedora server on ${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}..."
     sleep 10
  done
fi
