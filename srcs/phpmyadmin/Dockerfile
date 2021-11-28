FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add wget nginx openrc openssl supervisor libc6-compat
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-xmlwriter php7-iconv php7-xml \
	php7-zlib php7-curl php7-mbstring php7-json php7-session php7-simplexml php7-tokenizer

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=RU/ST=Russia/L=Moscow/O=CAO/OU=Moscow21/CN=Jraye" \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc2/phpMyAdmin-5.1.0-rc2-all-languages.tar.gz && \
	tar -xzvf phpMyAdmin-5.1.0-rc2-all-languages.tar.gz && \
	rm -f phpMyAdmin-5.1.0-rc2-all-languages.tar.gz && \
	mv phpMyAdmin-5.1.0-rc2-all-languages var/www/phpmyadmin

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./config.inc.php var/www/phpmyadmin/config.inc.php
COPY ./supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/www/phpmyadmin/tmp
RUN mkdir -p /run/nginx
RUN chmod -R 755 /var/www/
RUN chown -R nginx:nginx /var/www/

EXPOSE 5000

ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf
