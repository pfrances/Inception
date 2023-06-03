# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/23 16:06:22 by pfrances          #+#    #+#              #
#    Updated: 2023/06/03 09:50:21 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS_DIR=./srcs
DOCKER_COMPOSE = $(SRCS_DIR)/docker-compose.yml

WP_VOLUME_DIR=/home/pfrances/data/wordpress/
DB_VOLUME_DIR=/home/pfrances/data/mariadb/

all: up

up: add-host $(WP_VOLUME_DIR) $(DB_VOLUME_DIR)
	docker-compose -f $(DOCKER_COMPOSE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE) stop

down:
	docker-compose -f $(DOCKER_COMPOSE) down

clean: down
	docker-compose -f $(DOCKER_COMPOSE) down --volumes --rmi all

fclean: clean
	sudo rm -rf $(WP_VOLUME_DIR) $(DB_VOLUME_DIR)

$(WP_VOLUME_DIR):
	sudo mkdir -p $(WP_VOLUME_DIR)

$(DB_VOLUME_DIR):
	sudo mkdir -p $(DB_VOLUME_DIR)

re: fclean all

add-host:
	@sudo cat /etc/hosts | grep "pfrances.42.fr" > /dev/null || sudo echo '127.0.0.1	pfrances.42.fr' >> /etc/hosts

build:
	docker-compose -f $(DOCKER_COMPOSE) build --no-cache

.PHONY: all up stop down clean fclean re add-host build