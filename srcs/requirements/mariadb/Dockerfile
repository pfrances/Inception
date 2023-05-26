# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 12:19:53 by pfrances          #+#    #+#              #
#    Updated: 2023/05/26 12:19:54 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && apt upgrade -y && apt install mariadb-server -y && apt clean

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup_mariadb.sh /tmp
RUN chmod +x /tmp/setup_mariadb.sh

ENTRYPOINT ["sh", "/tmp/setup_mariadb.sh"]