#!/usr/bin/env bash

cd /usr/share/nginx/html

# Set default islandora permissions in Drupal
drush role-add-perm 'anonymous user' 'view fedora repository objects'
drush role-add-perm 'anonymous user' 'search islandora solr'
