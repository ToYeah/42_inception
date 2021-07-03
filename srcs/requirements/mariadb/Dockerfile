FROM alpine

#apk install
RUN		set -eux;\
	apk update;\
	apk  --no-cache add \
	mysql \
	mysql-client 

RUN		mkdir -p /run/mysqld
COPY	./tools/my.cnf /etc/my.cnf

COPY	tools/start.sh /start.sh
RUN		chmod 744 /start.sh

ENTRYPOINT [ "/start.sh" ]