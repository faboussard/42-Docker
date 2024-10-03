
FROM debian:bullseye

RUN apt update \
    && apt install -y nginx openssl \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/inception.key \
        -out /etc/nginx/ssl/inception.crt \
        -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=faboussa/CN=faboussa.42.fr/UID=faboussa" \
    && rm -rf /var/lib/apt/lists/*

        
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

EXPOSE 443