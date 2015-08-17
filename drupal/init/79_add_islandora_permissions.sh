#!/usr/bin/env bash

cd /usr/share/nginx/html

# Set default islandora permissions in Drupal
drush role-add-perm 'anonymous user' 'view repository objects'
