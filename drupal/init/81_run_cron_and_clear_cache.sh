#!/usr/bin/env bash

# Run cron and clear cache.
drush --root=${DRUPAL_ROOT} --uri=default  core-cron
drush --root=${DRUPAL_ROOT} --uri=default  cc all
