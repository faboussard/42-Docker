#!/bin/bash

sleep 10

if [ ! -f ./wp-config.php ]; then
 wp core download --locale=en_GB --path=$WP_PATH --allow-root

  wp config create \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb \
    --path=$WP_PATH \
    --allow-root

  wp core install \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_email=$WP_ADMIN_EMAIL \
    --admin_password=$WP_ADMIN_PASS \
    --path=$WP_PATH \
    --allow-root

  wp user create \
    $WP_USER \
    $WP_EMAIL \
    --user_pass=$WP_PASS \
    --path=$WP_PATH \
    --allow-root

fi

exec "$@"
