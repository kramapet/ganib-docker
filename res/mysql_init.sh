#!/usr/bin/env sh
/usr/bin/mysql_install_db
chown -R mysql:mysql /var/lib/mysql
cd /usr; /usr/bin/mysqld_safe &
sleep 15
/usr/bin/mysqladmin -u root password ''
/usr/bin/mysqladmin -u root -h $( uname -n ) password ''
/usr/bin/mysql -u root < /tmp/mysql_db.sql
/usr/bin/mysql -u root ganib < /tmp/ganib.sql
