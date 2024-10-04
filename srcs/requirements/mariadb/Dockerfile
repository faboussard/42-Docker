FROM debian:bullseye

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db_init.sh /usr/local/bin/db_init.sh

RUN chmod +x /usr/local/bin/db_init.sh

ENTRYPOINT ["db_init.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]

EXPOSE 3306