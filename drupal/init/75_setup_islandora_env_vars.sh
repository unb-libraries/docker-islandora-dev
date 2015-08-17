#!/usr/bin/env bash
FEDORA_IP=`dig +short fedora.docker`

cd ${DRUPAL_ROOT}

# Set Drupal environment variables required by Islandora modules
drush vset islandora_base_url http://${FEDORA_IP}:8080/fedora
drush vset islandora_solr_url http://${FEDORA_IP}:8080/solr/collection1
