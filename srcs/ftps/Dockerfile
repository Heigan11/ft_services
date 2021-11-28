FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add vsftpd openrc openssl

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=RU/ST=Russia/L=Moscow/O=CAO/OU=Moscow21/CN=Jraye" \
	-newkey rsa:2048 -keyout /etc/ssl/private/ftps-selfsigned.key \
	-out /etc/ssl/certs/ftps-selfsigned.crt

RUN mkdir -p /var/www
COPY ./vsftpd.conf /etc/vsftpd.conf
COPY setup.sh ./

EXPOSE 20 21 49001

ENTRYPOINT sh ./setup.sh
