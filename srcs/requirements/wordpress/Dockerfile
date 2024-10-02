FROM debian:bullseye

RUN apt update && apt upgrade -y \
    && apt-get install -y wget curl php7.4 php-fpm php-mysqli mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ /var/www/html \
    && chown -R www-data:www-data /var/www/*

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./tools/wp-config.sh .
RUN chmod +x wp-config.sh

ENTRYPOINT ["./wp-config.sh"]

CMD ["/usr/sbin/php-fpm7.4", "-F"]

EXPOSE 9000