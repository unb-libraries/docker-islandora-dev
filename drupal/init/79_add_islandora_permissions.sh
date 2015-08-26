#!/usr/bin/env bash

if [[ ! -f /tmp/DB_LIVE && ! -f /tmp/FILES_LIVE ]];
then

cd ${DRUPAL_ROOT}

# Set default islandora permissions in Drupal
drush role-add-perm 'anonymous user' 'view fedora repository objects'
drush role-add-perm 'anonymous user' 'search islandora solr'

fi
