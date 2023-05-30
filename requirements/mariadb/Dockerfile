FROM	debian:buster

ARG		WORDPRESS_DB_NAME
ARG		MARIADB_ROOT_PASSWD
ARG		WORDPRESS_DB_USER
ARG		WORDPRESS_DB_PASSWORD

RUN		apt-get update -y	\
&&		apt upgrade -y

RUN		apt-get install -y mariadb-server 

RUN		service mysql start \
		&&  mysql -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};\
			  ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWD}';\
			  GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';\
			  FLUSH PRIVILEGES;"

EXPOSE	3306

ENTRYPOINT	["mysqld", "--bind-address=0.0.0.0"]
