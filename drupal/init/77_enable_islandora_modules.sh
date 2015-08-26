#!/usr/bin/env bash

# Is this an initial deployment/build?
if [[ ! -f /tmp/DRUPAL_DB_LIVE && ! -f /tmp/DRUPAL_FILES_LIVE ]];
then
  # Enable Islandora modules
  drush --yes -u 1 --root=${DRUPAL_ROOT} --uri=default  en ${ISLANDORA_MODULES}
fi
