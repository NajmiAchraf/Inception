#!/bin/bash


service mariadb start
sleep 1
mkdir -p /run/mysqld/
# create user
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

# grant privileges
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql

# Creating a new user with lower power to avoid using the admin account
echo "CREATE USER '$WP_USER_LOWER'@'%' IDENTIFIED BY '$WP_PASSWORD_LOWER';" | mysql

echo "FLUSH PRIVILEGES;" | mysql


# create database
echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql


# kill $(cat /var/run/mysqld/mysqld.pid)


# service mariadb stop
# mysqld --skip-grant-tables --skip-networking &
# mysqlcheck --repair --all-databases
# service mariadb start

mysqladmin -u root password $MYSQL_ROOT_PASSWORD shutdown


mysqld_safe --bind-address=0.0.0.0
