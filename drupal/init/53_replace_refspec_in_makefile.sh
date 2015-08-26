#!/usr/bin/env bash

# Determine if we're building HEAD (which uses a revision spec) or a tag.
ISLANDORA_VERSION=${ISLANDORA_VERSION:-HEAD}

if [ "$ISLANDORA_VERSION" == "HEAD" ]; then
  ISLANDORA_REFTYPE=revision
else
  ISLANDORA_REFTYPE=tag
fi

# Sub in appropriate information into makefile.
sed -i "s/ISLANDORA_VERSION/$ISLANDORA_VERSION/g" "/tmp/drupal_build/$DRUPAL_SITE_ID.makefile"
sed -i "s/ISLANDORA_REFTYPE/$ISLANDORA_REFTYPE/g" "/tmp/drupal_build/$DRUPAL_SITE_ID.makefile"
