#!/bin/bash

sleep 10

# Check if WordPress is already installed
if ! $(wp core is-installed --path=$WP_PATH --allow-root); then
  wp core download --locale=en_GB --path=$WP_PATH --allow-root

  # Ensure the WordPress installation path is writable
  chmod -R 755 $WP_PATH

  wp config create \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb \
    --path=$WP_PATH \
    --allow-root \
    --skip-check

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