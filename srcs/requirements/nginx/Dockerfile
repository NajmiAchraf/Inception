# CREATE NGINX IMAGE

# Use Debian bullseye(11) as the base image
FROM debian:bullseye

# Installations
RUN apt-get update && apt-get install -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN apt-get install wget -y
RUN apt-get install vim -y

# Copy the script
COPY ./tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh

# Generate SSL certificate
RUN openssl genrsa -out /home/private.key 2048
RUN openssl req -new -key /home/private.key -out /home/csr.csr -subj "/C=MA/ST=Casablanca/L=Casablanca/O=1337 School/OU=1337/CN=ft_services" 
RUN openssl x509 -req -days 365 -in /home/csr.csr -signkey /home/private.key -out /home/certificate.crt

# Copy the configuration files
COPY conf/default.conf /etc/nginx/conf.d

# Expose ports
EXPOSE 443

# Start nginx server
CMD ["bash", "/home/script.sh"]
