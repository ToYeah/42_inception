NAME=	Inception

all		: $(NAME)

$(NAME)	: setup
	docker-compose -f srcs/docker-compose.yml  up  --build -d

up		: setup
	docker-compose -f srcs/docker-compose.yml  up  --build

down	: 
	docker-compose -f srcs/docker-compose.yml down 

setup	:
	sh srcs/requirements/tools/setup.sh

.PHONY: all Inception up down setup
