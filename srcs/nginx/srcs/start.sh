#!/bin/sh
if [ ! -e /var/www/html/index.html ]; then
	mv /var/lib/nginx/html/index.html /var/www/html/index.html
fi
chown -R nginx:nginx /var/www/html/

usr/sbin/nginx -g "daemon off;"