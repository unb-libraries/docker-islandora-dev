#!/usr/bin/env bash
docker pull unblibraries/drupal
docker-compose kill
docker-compose rm
docker-compose build
docker-compose up
