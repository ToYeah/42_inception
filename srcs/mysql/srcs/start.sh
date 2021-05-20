#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' & sleep 5

mysql -u root -e "CREATE DATABASE wpdb;"
mysql -u root -e "GRANT all privileges on wpdb.* to 'wpuser'@'%' identified by 'wppassword';"
mysql -u root -e "USE wpdb; "
mysql -u root -e "FLUSH PRIVILEGES;"

tail -f /dev/null