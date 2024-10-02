#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html
fi

if ! wp core is-installed --path="$WP_PATH" --allow-root; then
    wp core download --locale=en_GB --path="$WP_PATH" --allow-root

    wp config create --allow-root --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" \
                     --dbhost=mariadb --path="$WP_PATH" --skip-check

    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="$WP_PATH" --allow-root

    wp user create --allow-root "$WP_USER" "$WP_EMAIL" --user_pass="$WP_PASS" --path="$WP_PATH" --allow-root
fi

exec "$@"