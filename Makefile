run :
	docker compose -f ./srcs/docker-compose.yml up --build &

stop :
	docker-compose down -f ./srcs/docker-compose.yml

