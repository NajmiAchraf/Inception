all : clean build run

build :
	docker build . -t wordpress

run	:
	docker run --name wordpress -dp 9000:9000 wordpress

show :
	docker image ls
	docker ps -a

ip :
	docker inspect -f '{{ .Name }} - {{ .NetworkSettings.IPAddress }}' wordpress

bash :
	docker exec -it wordpress bash

logs :
	docker logs wordpress

stop :
	-docker stop wordpress

clean : stop
	-docker rm wordpress
	-docker rmi wordpress
