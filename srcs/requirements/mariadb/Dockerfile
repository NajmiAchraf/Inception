# CREATE MARIADB IMAGE

# Use Debian bullseye(11) as the base image
FROM debian:bullseye

# Installations
RUN apt-get update
RUN apt-get install -y mariadb-server

# remove pre-installed configuration files and copy the new ones
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to create the database
COPY ./tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh

# Expose ports
EXPOSE 3306

# Start MariaDB server
CMD ["bash", "/home/script.sh"]
