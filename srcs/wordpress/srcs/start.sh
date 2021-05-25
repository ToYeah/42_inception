#!/bin/sh
if [ ! -e /var/www/html/wordpress ]; then
	mv /usr/src/wordpress /var/www/html/wordpress;
fi
php-fpm7
nginx -g 'daemon off;'