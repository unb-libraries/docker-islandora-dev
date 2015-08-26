#!/usr/bin/env bash

if [[ ! -f /tmp/DB_LIVE && ! -f /tmp/FILES_LIVE ]];
then

cd ${DRUPAL_ROOT}

# Enable Islandora modules
drush --yes -u 1 en ${ISLANDORA_MODULES}

fi
