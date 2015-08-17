#!/usr/bin/env bash

cd ${DRUPAL_ROOT}

# Set default islandora permissions in Drupal
drush role-add-perm 'anonymous user' 'view fedora repository objects'
drush role-add-perm 'anonymous user' 'search islandora solr'
