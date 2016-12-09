FROM php:7.0-apache

# Tweaks if you have permission problem
ENV DOCKER_ID 1000
RUN usermod -u ${DOCKER_ID} www-data && \
    usermod -G staff www-data

RUN a2enmod rewrite
RUN docker-php-ext-install pdo_mysql
