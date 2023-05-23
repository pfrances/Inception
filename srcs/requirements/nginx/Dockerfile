FROM debian:buster

RUN apt update && apt upgrade -y && apt install nginx openssl -y && apt clean
RUN mkdir -p /etc/nginx/ssl /var/run/nginx
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pfrances.42.fr/UID=pfrances"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf.d/

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]