FROM unblibraries/drupal:apache
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

# This is the slug that is used to build the site from the makefile, etc.
ENV DRUPAL_SITE_ID=islandorap

# Islandora modules to enable on build.
ENV ISLANDORA_MODULES="islandora islandora_basic_collection islandora_basic_image islandora_pdf islandora_solr islandora_pdfjs xml_forms"

CMD ["/sbin/my_init"]

# Install OS packages and required solution pack libraries.
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y php5-xsl dnsutils imagemagick poppler-utils ghostscript && \
  apt-get clean

# Create and copy the temporary structure for building.
RUN mkdir -p /tmp/drupal_build/islandora
ADD build/${DRUPAL_SITE_ID}.makefile /tmp/drupal_build/${DRUPAL_SITE_ID}.makefile
ADD build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.info /tmp/drupal_build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.info
ADD build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.install /tmp/drupal_build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.install
ADD build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.profile /tmp/drupal_build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.profile

# Phusion/baseimage inits.
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh
