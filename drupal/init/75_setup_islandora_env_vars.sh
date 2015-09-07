#!/usr/bin/env bash

# Here, we default to using the address from a linked container named 'fedorasolrgsearch', falling back to using the
# details provided through FEDORA_SERVER_IP and FEDORA_SERVER_PORT environment variables.
FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR="${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR:-$(echo $FEDORA_SERVER_IP)}"
FEDORASOLRGSEARCH_PORT_8080_TCP_PORT="${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT:-$(echo $FEDORA_SERVER_PORT)}"

## Set Drupal environment variables required by Islandora modules
# Core
drush --root=${DRUPAL_ROOT} --uri=default vset islandora_base_url http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/fedora

# Solr
drush --root=${DRUPAL_ROOT} --uri=default vset islandora_solr_url http://${FEDORASOLRGSEARCH_PORT_8080_TCP_ADDR}:${FEDORASOLRGSEARCH_PORT_8080_TCP_PORT}/solr/collection1

# Imagemagick
drush --root=${DRUPAL_ROOT} --uri=default vset image_toolkit imagemagick
drush --root=${DRUPAL_ROOT} --uri=default vset imagemagick_convert /usr/bin/convert
