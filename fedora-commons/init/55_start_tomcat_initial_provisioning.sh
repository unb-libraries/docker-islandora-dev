#!/usr/bin/env bash

${FEDORA_HOME}/tomcat/bin/startup.sh

# Wait for tomcat to finish app deployment.
while [ ! -f "${FEDORA_HOME}/data/fedora-xacml-policies/repository-policies/default/deny-apim-if-not-localhost.xml" ]
do
  echo -e "\t Sleeping to wait for Tomcat to finish app deployment..."
  sleep 5
done
