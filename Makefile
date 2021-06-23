NAME=	Inception

all		: $(NAME)

$(NAME)	:
	docker-compose -f srcs/docker-compose.yml  up  --build

up		: $(NAME)

down	: 
	docker-compose -f srcs/docker-compose.yml down 