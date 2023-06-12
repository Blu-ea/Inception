# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bluwu <bluwu@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/08 12:24:29 by bluwu           #+#    #+#              #
#    Updated: 2023/05/19 16:03:27 by bluwu          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Check if .env is there and create it if not there and ask to fill it acordingly
NAME := inception

COMPOSE := docker-compose -p $(NAME)

# IMAGES = ''
# VOLUMES = ''
all : up

up : build
	$(COMPOSE) up --detach

down :
	$(COMPOSE) down

reboot : down up

build : volumes
	$(COMPOSE) build --parallel

create : build
	$(COMPOSE) create

ps :
	$(COMPOSE) ps --all

logs :
	$(COMPOSE) logs

conf :
	$(COMPOSE) config

clean : down
ifneq ($(shell docker images -q),)
	docker rmi $(shell docker images -q) --force
endif

fclean : clean 
ifneq ($(shell docker volume ls -q),)
	docker volume rm $(shell docker volume ls -q) --force
endif
	sudo rm -rf ~/data
volumes :
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb

re : fclean up

prune : fclean
	docker system prune --all --force

.PHONY : all up down build ps prune re volumes create clean conf logs reboot
.SILENT: 