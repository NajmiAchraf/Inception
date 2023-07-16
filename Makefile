# shell cmd :docker image ls -q

run : stop
	docker image rm $(shell docker image ls -q) 2> /dev/null || true
	docker compose -f ./srcs/docker-compose.yml up --build &

stop :
	docker-compose down -f ./srcs/docker-compose.yml
