NAME=	Inception

all		: $(NAME)

$(NAME)	:
	docker-compose -f srcs/docker-compose.yml  up  --build -d

up		: 
	docker-compose -f srcs/docker-compose.yml  up  --build

down	: 
	docker-compose -f srcs/docker-compose.yml down 