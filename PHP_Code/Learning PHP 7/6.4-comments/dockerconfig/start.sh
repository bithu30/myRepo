#!/bin/bash

chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && cd /var/www/html \
    && chmod -R 775 var/



rm -rf /var/www/var/*
#/bin/bash -l -c "$*"