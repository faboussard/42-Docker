#!/bin/bash

# Si le fichier wp-config.php n'existe pas dans le répertoire /var/www/html, changer le répertoire courant à /var/www/html
if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html
fi

# Vérifier si WordPress est installé
if ! wp core is-installed --path="$WP_PATH" --allow-root; then
  # Télécharger WordPress si non installé
    wp core download --locale=en_GB --path="$WP_PATH" --allow-root

  # Créer le fichier de configuration de WordPress
    wp config create --allow-root --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" \
                     --dbhost=mariadb --path="$WP_PATH" --skip-check

  # Installer WordPress
    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="$WP_PATH" --allow-root

  # Créer un nouvel utilisateur WordPress
    wp user create --allow-root "$WP_USER" "$WP_EMAIL" --user_pass="$WP_PASS" --path="$WP_PATH" --allow-root
fi

# Exécuter les commandes supplémentaires passées au script
exit 0