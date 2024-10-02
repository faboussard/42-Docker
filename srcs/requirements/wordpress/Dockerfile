FROM debian:buster

# Mise à jour des paquets et installation des dépendances
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y wget \
      php7.3 \
      php7.3-fpm \
	  php7.3-mysql \
	  mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Changer la configuration PHP-FPM
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Télécharger et installer WP-CLI (version stable)
RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

# Copier le script d'initialisation de WordPress
COPY tools/wordpress.sh /var/wordpress.sh

# S'assurer que le script a les bonnes permissions
RUN chmod +x /var/wordpress.sh

# Commande par défaut pour lancer le script d'initialisation
CMD ["bash", "/var/wordpress.sh"]

# Exposer le port pour PHP-FPM
EXPOSE 9000
