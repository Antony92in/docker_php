FROM php:8.1-fpm

WORKDIR /app

ADD ./composer.sh /app

RUN bash /app/composer.sh
RUN mv composer.phar /usr/local/bin/composer

RUN apt update && apt -y install libicu-dev && apt -y install libzip-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql

CMD ["php-fpm"]