#wordpress

FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get -y install \
    wget \
    php \
    php-mysql \
    php-fpm \
    mariadb-client \
    php-redis \
    tini

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy PHP configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Prepare PHP runtime directory
RUN mkdir /run/php
RUN chown -R www-data:www-data /run/php

# Copy the WordPress initialization script
COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh

# Set the working directory
WORKDIR /var/www/html/

# Use tini as the init system
ENTRYPOINT ["/usr/bin/tini", "--"]

# Set the default command
CMD ["/usr/local/bin/wordpress.sh"]