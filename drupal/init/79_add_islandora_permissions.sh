#!/usr/bin/env bash

if [[ ! -f /tmp/DRUPAL_DB_LIVE && ! -f /tmp/DRUPAL_FILES_LIVE ]];
then

cd ${DRUPAL_ROOT}

# Set default islandora permissions in Drupal
drush role-add-perm 'anonymous user' 'view fedora repository objects'
drush role-add-perm 'anonymous user' 'search islandora solr'

fi
