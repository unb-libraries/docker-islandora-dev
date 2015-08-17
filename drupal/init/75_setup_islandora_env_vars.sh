#!/usr/bin/env bash

cd /usr/share/nginx/html

# Set Drupal environment variables required by Islandora modules
drush vset islandora_base_url http://${FEDORA_IP}:8080/fedora
drush vset islandora_solr_url http://${FEDORA_IP}:8080/solr/collection1
