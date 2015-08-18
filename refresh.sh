#!/usr/bin/env bash
docker pull unblibraries/drupal
docker pull unblibraries/drupal:apache
docker-compose kill
docker-compose rm
docker-compose build
docker-compose up
