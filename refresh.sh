#!/usr/bin/env bash
# A helper script for quickly tearing down the containers and rebuilding them.

docker pull mysql:5.6
docker pull unblibraries/fedora-solr-gsearch:3.8.x
docker pull unblibraries/drupal:apache
docker-compose kill
docker-compose rm
docker-compose build
docker-compose up
