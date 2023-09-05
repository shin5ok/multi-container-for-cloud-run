FROM php:8.2-fpm

RUN apt update && apt -y install libpq-dev && \
    docker-php-ext-install pgsql

COPY *.php /var/www/html/

RUN mkdir -p /var/share/

COPY zz-docker.conf /usr/local/etc/php-fpm.d/
