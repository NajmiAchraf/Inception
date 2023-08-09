#!/bin/sh

service mariadb start 

# create user
mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# grant privileges
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# create database
mysql -e "CREATE DATABASE $MYSQL_DATABASE;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld