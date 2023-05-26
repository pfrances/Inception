# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 12:19:44 by pfrances          #+#    #+#              #
#    Updated: 2023/05/26 18:31:45 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && apt upgrade -y && apt install wget php7.3 php-fpm php-mysql mariadb-client -y	\
	&& wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www							\
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar			\
	&& apt remove wget -y && apt clean \
	&& cd /var/www && tar -xzf wordpress-6.2.2.tar.gz && rm wordpress-6.2.2.tar.gz
RUN chown -R root:root /var/www/wordpress
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN echo "clear_env=no" >> /etc/php/7.3/fpm/php-fpm.conf
RUN echo "listen=wordpress:9000" >> /etc/php/7.3/fpm/php-fpm.conf

COPY conf/auto_config.sh /tmp/
RUN chmod +x /tmp/auto_config.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/tmp/auto_config.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]