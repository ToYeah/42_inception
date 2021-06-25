FROM alpine:3.14

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
COPY	./tools/my.cnf /etc/my.cnf

COPY	tools/start.sh /start.sh
RUN		chmod 744 /start.sh

ENTRYPOINT [ "/start.sh" ]