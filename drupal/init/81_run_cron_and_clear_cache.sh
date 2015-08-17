#!/usr/bin/env bash

cd /usr/share/nginx/html

drush core-cron
drush cc all
