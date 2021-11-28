#!/bin/sh

openrc boot
rc-update add mariadb
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root --skip-password < start_db.sql
mysql wordpress -u root --skip-password < wordpress.sql
rc-service mariadb stop
/usr/bin/mysqld_safe
