FROM unblibraries/drupal
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

ENV DRUPAL_SITE_ID=islandorap
ENV ISLANDORA_MODULES="islandora islandora_basic_collection islandora_basic_image islandora_pdf islandora_solr"

CMD ["/sbin/my_init"]

# Install packages and required solution pack libraries
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y php5-xsl dnsutils imagemagick poppler-utils ghostscript && \
  apt-get clean

RUN mkdir -p /tmp/drupal_build/islandora
ADD build/${DRUPAL_SITE_ID}.makefile /tmp/drupal_build/${DRUPAL_SITE_ID}.makefile

ADD build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.info /tmp/drupal_build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.info
ADD build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.install /tmp/drupal_build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.install
ADD build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.profile /tmp/drupal_build/${DRUPAL_SITE_ID}/${DRUPAL_SITE_ID}.profile

ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh
