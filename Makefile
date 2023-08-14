all : down up

up :
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

re: clean up

# stop :
# 	-docker stop $(shell docker ps -aq)

# clean : stop
# 	-docker rm $(shell docker ps -aq) -f
# 	-docker image rm $(shell docker image ls -q) -f
# 	-docker volume rm $(shell docker volume ls -q) -f
# 	-docker network rm $(shell docker network ls -q)

logs :
	@printf "\033[1;31m" && printf "Nginx logs\n" && printf "\033[0m"
	@docker logs nginx
	@printf "\033[1;31m" && printf "MariaDB logs\n" && printf "\033[0m"
	@docker logs mariadb
	@printf "\033[1;31m" && printf "Wordpress logs\n" && printf "\033[0m"
	@docker logs wordpress

show :
#	show images
	docker images
#	show containers
	docker ps -a
#	show volumes
	docker volume ls
#	show networks
	docker network ls

sh_nginx :
	docker exec -it nginx bash

sh_maridb :
	docker exec -it mariadb bash

sh_wordpress :
	docker exec -it wordpress bash

db :
	docker exec -it mariadb mysql -u root