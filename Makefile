# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amiguez <amiguez@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/08 12:24:29 by amiguez           #+#    #+#              #
#    Updated: 2023/05/12 03:02:08 by amiguez          ###   ########.fr        #
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
	mkdir -p /home/amiguez/data/wordpress
	mkdir -p /home/amiguez/data/mariadb

.PHONY : all up down build ps prune
.SILENT: 