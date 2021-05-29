#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' & sleep 5

mysql -u root -e "CREATE DATABASE $WP_DB_NAME;"
mysql -u root -e "GRANT all privileges on $WP_DB_NAME.* to '$WP_DB_USER'@'%' identified by '$WP_DB_PASS';"
mysql -u root -e "USE $WP_DB_NAME; "
mysql -u root -e "FLUSH PRIVILEGES;"

tail -f /dev/null