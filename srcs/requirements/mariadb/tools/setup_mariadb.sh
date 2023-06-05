#!/bin/sh

service mysql start

if ! [ -d "/var/lib/mysql/$MYSQL_DB_NAME" ]; then
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;" > temp.sql
    echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> temp.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';" >> temp.sql
    echo "FLUSH PRIVILEGES;" >> temp.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> temp.sql

    mysql -u root -p$MYSQL_ROOT_PASSWORD < temp.sql
    rm -f temp.sql
fi

mysqld