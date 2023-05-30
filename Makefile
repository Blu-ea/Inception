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

COMPOSE := docker compose -p $(NAME)

all : up

up : build
	$(COMPOSE) up --detach

down :
	$(COMPOSE) down

build : volumes
	$(COMPOSE) build --parallel

create : build
	$(COMPOSE) create

ps :
	docker compose ps --all

clean : 
	docker rmi 

prune: down
	docker system prune -a -f

volumes :
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb

.PHONY : all up down build ps prune
.SILENT: 