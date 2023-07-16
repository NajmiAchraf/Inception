FROM debian:buster

RUN apt-get update && apt-get install -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN apt-get install wget -y
RUN apt-get install vim -y
RUN rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /home/
RUN chmod +x /home/script.sh

RUN openssl genrsa -out /home/private.key 2048
RUN openssl req -new -key /home/private.key -out /home/csr.csr -subj "/C=MA/ST=Casablanca/L=Casablanca/O=1337 School/OU=1337/CN=ft_services" 
RUN openssl x509 -req -days 365 -in /home/csr.csr -signkey /home/private.key -out /home/certificate.crt

#RUN rm -rf /etc/nginx/conf.d/default
# COPY conf/default.conf /etc/nginx/sites-available/default
COPY conf/default.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["bash", "/home/script.sh"]
