FROM php:7.4-fpm

RUN apt-get update && apt-get -y install libpq-dev && \
    docker-php-ext-install pgsql

COPY *.php /var/www/html/

RUN mkdir -p /var/share/

COPY zz-docker.conf /usr/local/etc/php-fpm.d/
