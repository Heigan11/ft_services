FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add nginx openssl openssh supervisor

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=RU/ST=Russia/L=Moscow/O=CAO/OU=Moscow21/CN=Jraye" \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /www/index.html
COPY ./supervisord.conf /etc/supervisord.conf

RUN ssh-keygen -A && \
	adduser -D jraye && \
	echo "jraye:123" | chpasswd

RUN mkdir -p /scripts
RUN mkdir -p /www
COPY ./start_db.sh /scripts/start_db.sh
RUN chmod +x /scripts/start_db.sh

RUN mkdir -p /run/nginx

EXPOSE 22 80 443

ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf
