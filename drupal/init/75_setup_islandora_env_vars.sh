#!/usr/bin/env bash

if [[ ! -f /tmp/DRUPAL_DB_LIVE && ! -f /tmp/DRUPAL_FILES_LIVE ]];
then

FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR="${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR:-$(echo $FEDORA_SERVER_IP)}"
FEDORASOLRGSEARCH_PORT_8080_TCP_PORT="${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT:-$(echo $FEDORA_SERVER_PORT)}"

cd ${DRUPAL_ROOT}

# Set Drupal environment variables required by Islandora modules
drush vset islandora_base_url http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora
drush vset islandora_solr_url http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/solr/collection1

fi
