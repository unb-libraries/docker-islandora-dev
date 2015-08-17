#!/usr/bin/env bash

cd ${DRUPAL_ROOT}

# Enable Islandora modules
drush --yes -u 1 en ${ISLANDORA_MODULES}
