#nginx

FROM debian:bullseye

# Mettre à jour les paquets et installer nginx et openssl
RUN apt update \
    && apt install -y nginx openssl \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/inception.key \
        -out /etc/nginx/ssl/inception.crt \
        -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=fanny/CN=localhost" \
    && rm -rf /var/lib/apt/lists/*

        

# Créer le répertoire pour le processus nginx
RUN mkdir -p /var/run/nginx

# Copier la configuration nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Définir la commande de démarrage pour nginx
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
# Exposer le port 443 pour HTTPS
EXPOSE 443