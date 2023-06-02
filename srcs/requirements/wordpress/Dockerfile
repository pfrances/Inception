# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 12:19:44 by pfrances          #+#    #+#              #
#    Updated: 2023/06/02 12:45:02 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && apt install wget php7.3 php7.3-fpm php-mysql mariadb-client -y	\
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar			\
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
	&& mkdir -p /var/www/html/wordpress -p /run/php/ \
	&& wp core download --path=/var/www/html/wordpress --allow-root \
	&& chown -R root:root /var/www/html/wordpress	\
	&& apt remove wget -y && apt clean
RUN echo "clear_env=no" >> /etc/php/7.3/fpm/php-fpm.conf
RUN echo "listen=wordpress:9000" >> /etc/php/7.3/fpm/php-fpm.conf

COPY conf/setup_wordpress.sh /tmp/
RUN chmod +x /tmp/setup_wordpress.sh

WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT ["sh", "/tmp/setup_wordpress.sh"]