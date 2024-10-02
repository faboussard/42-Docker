#!/bin/bash

# Attendre que MariaDB démarre
sleep 10

# Vérifier si WordPress est déjà installé
if ! wp core is-installed --path=$WP_PATH --allow-root; then
  # Télécharger WordPress si non installé
  wp core download --locale=en_GB --path=$WP_PATH --allow-root

  # S'assurer que le répertoire d'installation est accessible en écriture
  chmod -R 755 $WP_PATH

  # Créer le fichier de configuration wp-config.php
  wp config create \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb \
    --path=$WP_PATH \
    --allow-root \
    --skip-check

  # Installer WordPress
  wp core install \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$WP_ADMIN_USER \
    --admin_email=$WP_ADMIN_EMAIL \
    --admin_password=$WP_ADMIN_PASS \
    --path=$WP_PATH \
    --allow-root

  # Créer un utilisateur supplémentaire
  wp user create \
    $WP_USER \
    $WP_EMAIL \
    --user_pass=$WP_PASS \
    --path=$WP_PATH \
    --allow-root
fi

# Run PHP
mkdir -p /run/php
php-fpm7.3 -F
