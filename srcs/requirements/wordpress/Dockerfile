# CREATE WORDPRESS IMAGE

# Use Debian bullseye(11) as the base image
FROM debian:bullseye

# Installations for wordpress
RUN apt-get update
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql mariadb-client curl sendmail

# Create folder for wordpress
RUN mkdir -p /var/www/html/wordpress

# Copy PHP-FPM pool configuration
COPY conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# Downloading WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh

# Expose port 9000 to connect to php-fpm container
EXPOSE 9000

# Run the script.sh file
ENTRYPOINT ["bash", "/home/script.sh"]

# Run php-fpm
CMD ["php-fpm7.4", "-R", "-F"]