#!/usr/bin/env bash

ISLANDORA_VERSION=${$ISLANDORA_VERSION:-HEAD}

if [ "$ISLANDORA_VERSION" == "HEAD" ]; then
  ISLANDORA_REFTYPE=revision
else
  ISLANDORA_REFTYPE=tag
fi

sed -i "s/ISLANDORA_VERSION/$ISLANDORA_VERSION/g" "/tmp/drupal_build/$DRUPAL_SITE_ID.makefile"
sed -i "s/ISLANDORA_REFTYPE/$ISLANDORA_REFTYPE/g" "/tmp/drupal_build/$DRUPAL_SITE_ID.makefile"
