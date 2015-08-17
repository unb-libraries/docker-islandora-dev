#!/usr/bin/env bash

cd /usr/share/nginx/html

# Enable Islandora modules
drush --yes -u 1 en ${ISLANDORA_MODULES}
