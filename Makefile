all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

status:
	docker-compose ps

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

clean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
	docker system prune -f -a

re: down fclean up

.PHONY: all up down stop start logs status clean fclean re
