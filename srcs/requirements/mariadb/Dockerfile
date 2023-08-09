# Use Debian bullseye(11) as the base image
FROM debian:bullseye

# Install MariaDB server and client
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client
RUN rm -rf /var/lib/apt/lists/*

# remove pre-installed configuration files and copy the new ones
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# # Create a directory for configuration files and copy the .env file
# RUN mkdir -p /app/config
# COPY ./conf/.env /app/config/.env

# Copy the script to create the database
COPY ./tools/script.sh /root/script.sh
RUN chmod +x /root/script.sh

# Expose ports
EXPOSE 3306

# Start MariaDB server
CMD ["bash", "/root/script.sh"]
