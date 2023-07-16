all : clean build run

build :
	docker build . -t nginx

run	: stop
	docker run --name nginx -dp 443:443 nginx

show :
	docker image ls

stop :
	docker stop nginx

clean : stop
	docker rm nginx
	docker rmi nginx
