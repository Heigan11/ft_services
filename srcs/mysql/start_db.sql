CREATE DATABASE wordpress;
CREATE USER 'jraye'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'jraye'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;