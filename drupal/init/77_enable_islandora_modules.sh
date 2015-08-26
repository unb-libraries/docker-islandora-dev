#!/usr/bin/env bash

if [[ ! -f /tmp/DRUPAL_DB_LIVE && ! -f /tmp/DRUPAL_FILES_LIVE ]];
then

cd ${DRUPAL_ROOT}

# Enable Islandora modules
drush --yes -u 1 en ${ISLANDORA_MODULES}

fi
