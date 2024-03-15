all: up

up:
	# mkdir -p /home/dgerguri/data/wordpress_data
	# mkdir -p /home/dgerguri/data/mariadb_data
	mkdir -p /Users/dardangerguri/data/wordpress_data
	mkdir -p /Users/dardangerguri/data/mariadb_data
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down
	# sudo rm -rf /home/dgerguri/data/mariadb_data
	# sudo rm -rf /home/dgerguri/data/wordpress_data
	sudo rm -rf /Users/dardangerguri/data/mariadb_data
	sudo rm -rf /Users/dardangerguri/data/wordpress_data

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

status:
	docker-compose ps

logs:
	docker-compose -f srcs/docker-compose.yml logs

clean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
	docker system prune -f -a --volumes --all

re: down fclean up

.PHONY: all up down stop start logs status clean fclean re
