#!/usr/bin/env bash

cd ${DRUPAL_ROOT}

drush core-cron
drush cc all
