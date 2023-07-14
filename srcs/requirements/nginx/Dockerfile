FROM debian:buster

RUN apt-get update && apt-get install -y
RUN apt-get nginx
RUN apt-get openssl
RUN apt-get wget
RUN rm -rf /var/lib/apt/lists/*

COPY config/nginx.conf /etc/nginx/conf.d/

CMD ["tail", "-f", "/dev/null"]
