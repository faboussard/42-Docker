FROM debian:buster

ARG WP_PATH
ARG WP_URL

RUN apt update \
&& apt install -y nginx openssl \
&& mkdir -p /etc/nginx/ssl \
&& openssl req -x509 -nodes \
  -out /etc/nginx/ssl/bundle.crt \
  -keyout /etc/nginx/ssl/private.key \
    -subj  "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=faboussa.42.fr/UID=faboussa"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf


CMD ["nginx"]

EXPOSE 443