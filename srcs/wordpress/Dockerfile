FROM alpine

#apk install
RUN		set -eux;\
	apk update;\
	apk --no-cache add \
	wget \
	nginx \
	openssl \
	openssh \
	openrc \
	php7 \
	php7-fpm \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-fileinfo \
	php7-json \
	php7-mbstring \
	php7-mysqli \
	php7-sodium \
	php7-openssl \
	php7-imagick \
	php7-xml \
	php7-zip

#copy files
RUN		rm -f /var/lib/nginx/html/index.html
COPY	./srcs/ft_wp_nginx.conf /etc/nginx/http.d/ft_wp_nginx.conf
COPY	./srcs/index.html /var/lib/nginx/html/

#setup nginx workspace
RUN		mkdir -p /run/nginx;\
	rm /etc/nginx/http.d/default.conf;\
	chown -R nginx:nginx /var/lib/nginx/html/

#setup wordpress
COPY	./srcs/latest.tar.gz /tmp/latest.tar.gz

RUN		set -eux;\
	#wget -O /tmp/latest.tar.gz --no-check-certificate https://wordpress.org/latest.tar.gz;\
	mkdir /usr/src/;\
	tar -xvzf /tmp/latest.tar.gz -C /usr/src/;\		
	rm /tmp/latest.tar.gz;

RUN		rm /etc/php7/php-fpm.d/www.conf

COPY	./srcs/wp-config.php /usr/src/wordpress/wp-config.php
COPY 	./srcs/www.conf  /etc/php7/php-fpm.d/www.conf

RUN		chown -R nginx:nginx /usr/src/wordpress

#setup ssl
RUN		 mkdir /etc/nginx/ssl;\
	openssl genrsa -out /etc/nginx/ssl/server.key 2048;\
	openssl req -new -subj /CN=localhost -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr;\
	openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt;

COPY	srcs/start.sh /start.sh
RUN		chmod 744 /start.sh

ENTRYPOINT [ "/start.sh" ]