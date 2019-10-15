FROM php:7-fpm-alpine 

RUN apk update && apk add libjpeg libpng-dev libxml2-dev openssl-dev imagemagick-dev wget rsync imap-dev
RUN apk add ssmtp
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath dom xml simplexml calendar exif  hash iconv json mbstring posix sockets tokenizer
RUN docker-php-ext-configure imap --with-imap-ssl \
    && docker-php-ext-install imap

RUN mkdir -p /usr/src/php/ext && curl -L https://pecl.php.net/get/imagick-3.4.4.tgz >> /usr/src/php/ext/imagick.tgz
RUN tar -xf /usr/src/php/ext/imagick.tgz -C /usr/src/php/ext/ && rm /usr/src/php/ext/imagick.tgz
RUN docker-php-ext-install imagick-3.4.4

