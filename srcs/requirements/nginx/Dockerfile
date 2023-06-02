# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 12:18:51 by pfrances          #+#    #+#              #
#    Updated: 2023/06/02 12:44:09 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && apt install nginx openssl -y && apt clean

COPY ./conf/nginx.conf /etc/nginx/conf.d/www.pfrances.conf
COPY ./tools/setup_nginx.sh /tmp/setup_nginx.sh

RUN chmod +x /tmp/setup_nginx.sh

EXPOSE 443

ENTRYPOINT ["sh", "./tmp/setup_nginx.sh"]