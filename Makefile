NAME=	Inception

all		: $(NAME)

$(NAME)	:
	docker-compose -f srcs/docker-compose.yml  up  --build -d

up		:
	docker-compose -f srcs/docker-compose.yml  up  --build

down	: 
	docker-compose -f srcs/docker-compose.yml down 

setup	:
	sudo sh srcs/requirements/tools/setup.sh
	sudo mkdir -p /home/totaisei/data/db
	sudo mkdir -p /home/totaisei/data/wp

.PHONY: all Inception up down setup
