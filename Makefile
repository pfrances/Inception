# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pfrances <pfrances@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/23 16:06:22 by pfrances          #+#    #+#              #
#    Updated: 2023/05/26 17:26:21 by pfrances         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS_DIR = ./srcs
REQUIREMENTS_DIR = $(SRCS_DIR)/requirements

NGINX_DIR = $(REQUIREMENTS_DIR)/nginx
MARIADB_DIR = $(REQUIREMENTS_DIR)/mariadb
WORDPRESS_DIR = $(REQUIREMENTS_DIR)/wordpress

DOCKER_COMPOSE = $(SRCS_DIR)/docker-compose.yml

all: start

start: add-host make-volume-dir
	sudo apt update && sudo apt upgrade -y
	docker-compose -f $(DOCKER_COMPOSE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE) stop

re: down build start

down:
	-docker stop `docker ps -qa`
	-docker rm `docker ps -qa`
	-docker rmi -f `docker images -qa`
	-docker volume rm `docker volume ls -q`
	docker-compose -f $(DOCKER_COMPOSE) down
	-docker network rm `docker network ls -q`
	make remove-volume

add-host:
	@sudo cat /etc/hosts | grep "127.0.0.1 pfrances.42.fr" > /dev/null || sudo echo '127.0.0.1 pfrances.42.fr' >> /etc/hosts

make-volume-dir:
	sudo mkdir -p /home/pfrances/data/wordpress
	sudo mkdir -p /home/pfrances/data/mariadb

remove-volume:
	-sudo rm -rf /home/pfrances/data/mariadb/* /home/pfrances/data/wordpress/*

build:
	docker-compose -f $(DOCKER_COMPOSE) down --volumes --rmi all
	docker-compose -f $(DOCKER_COMPOSE) build --no-cache

.PHONY: all start stop rebuild add-host stop-service make-volume-dir remove  n-volume build re