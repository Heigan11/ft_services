FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add wget nginx openrc openssl supervisor
RUN apk add php7 php7-fpm php7-opcache php7-common php7-iconv \
	php7-json php7-gd php7-curl \
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php7-mbstring php7-session php7-phar php7-tokenizer

RUN wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && rm -f latest.tar.gz
RUN rm -f wordpress/wp-config-sample.php
RUN mv ./wordpress /var/www/wordpress

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./wp-config.php /var/www/wordpress/wp-config.php
COPY ./supervisord.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx
RUN chown -R nginx:nginx /var/www
RUN chmod -R 755 /var/www

EXPOSE 5050

ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf
