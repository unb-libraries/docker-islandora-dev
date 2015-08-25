#!/usr/bin/env bash
docker pull unblibraries/fedora-solr-gsearch:3.8.x
docker pull unblibraries/drupal:apache
docker-compose kill
docker-compose rm
docker-compose build
docker-compose up
