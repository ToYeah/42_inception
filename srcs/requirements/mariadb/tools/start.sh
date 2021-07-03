#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal 

cat << EOF > /tmp/init.sql
SET PASSWORD FOR root@localhost=password('$DB_ROOT_PASS');
CREATE DATABASE $WP_DB_NAME;
GRANT all privileges on $WP_DB_NAME.* to '$WP_DB_USER'@'%' identified by '$WP_DB_PASS';
GRANT all privileges on *.* to '$DB_USER_NAME_1'@'%' identified by '$DB_USER_PASS_1';
GRANT all privileges on $WP_DB_NAME.* to '$DB_USER_NAME_2'@'%' identified by '$DB_USER_PASS_2';
USE $WP_DB_NAME; 
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --init-file=/tmp/init.sql