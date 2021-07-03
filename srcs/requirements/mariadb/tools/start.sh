#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal 

cat << EOF > /tmp/init.sql
SET PASSWORD FOR root@localhost=password('$DB_ROOT_PASS');
CREATE DATABASE $WP_DB_NAME;
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER_NAME_1'@'%' IDENTIFIED BY '$DB_USER_PASS_1';
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$DB_USER_NAME_2'@'%' IDENTIFIED BY '$DB_USER_PASS_2';
USE $WP_DB_NAME; 
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --init-file=/tmp/init.sql