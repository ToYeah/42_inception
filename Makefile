NAME=	Inception

all		: $(NAME)

$(NAME)	:
	docker-compose -f srcs/docker-compose.yml down 
	sudo rm -rf /home/totaisei
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env  --build up