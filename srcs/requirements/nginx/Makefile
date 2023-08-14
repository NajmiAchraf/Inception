all : clean build run

build :
	docker build . -t nginx

run	:
	docker run --name nginx -dp 443:443 nginx

show :
	docker image ls
	docker ps -a

ip :
	docker inspect -f '{{ .Name }} - {{ .NetworkSettings.IPAddress }}' nginx

bash :
	docker exec -it nginx bash

logs :
	docker logs nginx

stop :
	-docker stop nginx

clean : stop
	-docker rm nginx
	-docker rmi nginx
