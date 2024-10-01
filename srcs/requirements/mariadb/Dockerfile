FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


COPY ./tools/db_init.sh .

RUN chmod +x db_init.sh

CMD ["bash", "db_init.sh"]

EXPOSE 3306