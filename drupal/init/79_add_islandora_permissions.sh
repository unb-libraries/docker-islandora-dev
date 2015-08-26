#!/usr/bin/env bash

# Is this an initial deployment?
if [[ ! -f /tmp/DRUPAL_DB_LIVE && ! -f /tmp/DRUPAL_FILES_LIVE ]];
then
  # Set up some islandora permissions in Drupal
  drush --root=${DRUPAL_ROOT} --uri=default  role-add-perm 'anonymous user' 'view fedora repository objects'
  drush --root=${DRUPAL_ROOT} --uri=default  role-add-perm 'anonymous user' 'search islandora solr'
fi
