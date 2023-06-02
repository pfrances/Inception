#!/bin/sh

mkdir -p /etc/nginx/ssl -p /var/run/nginx
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout $SSL_CRT_PRIV_PATH -out $SSL_CRT_PUB_PATH \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=student/CN=$DOMAIN_NAME/UID=$LOGIN"
chmod 755 /var/www/html
chown www-data:www-data -R /var/www/html $SSL_CRT_PUB_PATH $SSL_CRT_PRIV_PATH

nginx -g "daemon off;"