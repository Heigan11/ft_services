#!/bin/sh

openrc boot
rc-update add vsftpd
rc-service vsftpd start

addgroup -S name_group && adduser -S jraye -G name_group -h /var/www
echo "jraye:123" | chpasswd

chmod -R 777 /var/www
chown -R jraye:name_group /var/www

rc-service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf
