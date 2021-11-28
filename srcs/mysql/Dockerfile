FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add mysql mysql-client

RUN mkdir -p /run/mysqld
COPY ./my.cnf /etc/my.cnf
COPY start_db.sh start_db.sql wordpress.sql ./

EXPOSE 3306

ENTRYPOINT sh ./start_db.sh
