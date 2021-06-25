FROM alpine:3.14

#apk install
RUN		set -eux;\
	apk update;\
	apk add \
	nginx \
	openssl \
	openssh \
	openrc

#copy files
RUN		rm -f /var/lib/nginx/html/index.html
COPY	./tools/ft_nginx.conf /etc/nginx/http.d/ft_nginx.conf
COPY	./tools/index.html /var/lib/nginx/html/index.html

#setup nginx workspace
RUN		mkdir -p /run/nginx;\
	rm /etc/nginx/http.d/default.conf;

#setup ssl
RUN		 mkdir /etc/nginx/ssl;\
	openssl genrsa -out /etc/nginx/ssl/server.key 2048;\
	openssl req -new -subj /CN=localhost -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr;\
	openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt;

COPY	./tools/start.sh /
RUN		chmod 744 /start.sh

ENTRYPOINT [ "/start.sh" ]