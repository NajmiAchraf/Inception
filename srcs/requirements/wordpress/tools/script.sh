#!/bin/bash

sleep 2
# Downloading and extracting Wordpress core files to the current directory
wp core download --allow-root

# Creating the wp-config.php file using this command.
wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

# Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
wp core install --url=${DOMAIN_NAME} --title=Inception --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL} --allow-root

# Creating a new user with lower power to avoid using the admin account
wp user create ${WP_USER_LOWER} ${WP_EMAIL_LOWER} --user_pass=${WP_PASSWORD_LOWER} --role=author --allow-root

chmod 777 -R /var/www/html/wordpress/wp-content

exec /usr/sbin/php-fpm7.4 -F