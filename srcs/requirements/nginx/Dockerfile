# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 12:18:51 by pfrances          #+#    #+#              #
#    Updated: 2023/05/26 12:18:52 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && apt upgrade -y && apt install nginx openssl -y && apt clean
RUN mkdir -p /etc/nginx/ssl /var/run/nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048	\
	-keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt	\
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=student/CN=pfrances.42.fr/UID=pfrances"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf.d/default.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]