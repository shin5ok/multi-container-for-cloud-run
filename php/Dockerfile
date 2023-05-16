FROM php:7.4-fpm

RUN apt update && apt -y install libpq-dev && \
    docker-php-ext-install pgsql

COPY *.php /var/www/html/
COPY zz-docker.conf /usr/local/etc/php-fpm.d/
