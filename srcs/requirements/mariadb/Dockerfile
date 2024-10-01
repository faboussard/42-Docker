FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db_init.sh /usr/local/bin/db_init.sh

RUN chmod +x /usr/local/bin/db_init.sh

ENTRYPOINT ["db_init.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

EXPOSE 3306