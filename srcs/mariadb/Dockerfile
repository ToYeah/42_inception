FROM alpine:latest

#apk install
RUN		set -eux;\
	apk update;\
	apk add \
	wget \
	nginx \
	openssl \
	openssh \
	openrc \
	php-fpm \
	php-mbstring \
	mysql \
	mysql-client \
	vim

RUN		mkdir -p /run/mysqld
COPY	./srcs/my.cnf /etc/my.cnf

COPY	srcs/start.sh /start.sh
RUN		chmod 744 /start.sh

ENTRYPOINT [ "/start.sh" ]