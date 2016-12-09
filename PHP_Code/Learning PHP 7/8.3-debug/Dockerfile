FROM php:7.0-apache

# Tweaks if you have permission problem
ENV DOCKER_ID 1000
RUN usermod -u ${DOCKER_ID} www-data && \
    usermod -G staff www-data

RUN a2enmod rewrite
RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y libpng12-dev libjpeg62-turbo-dev \
    	&& docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
    	&& docker-php-ext-install gd
