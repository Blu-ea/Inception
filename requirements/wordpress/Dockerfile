FROM	debian:buster-slim

ARG		WORDPRESS_DB_NAME
ARG		WORDPRESS_DB_USER
ARG		WORDPRESS_DB_PASSWORD
ARG		WORDPRESS_DB_HOST

RUN		apt-get update -y	\
&&		apt-get upgrade -y

RUN		apt-get install -y php-fpm php-mysql wget \
&&		service php7.3-fpm start && service php7.3-fpm stop \
&&		sed -i "s/\/run\/php\/php7.3-fpm.sock/wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

#	installing WP-CLI
ADD		https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN		chmod +x /usr/local/bin/wp \
&&		mkdir -p /var/www/html/wordpress \
&&		wp core download --path=/var/www/html/wordpress --allow-root

#	modifing this file -> https://github.com/WordPress/WordPress/blob/master/wp-config-sample.php
RUN		cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \ 
		&&	sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" /var/www/html/wordpress/wp-config.php \
		&&	sed -i 		"s/username_here/${WORDPRESS_DB_USER}/" /var/www/html/wordpress/wp-config.php \
		&&	sed -i 	"s/password_here/${WORDPRESS_DB_PASSWORD}/" /var/www/html/wordpress/wp-config.php \
		&&	sed -i 			"s/localhost/${WORDPRESS_DB_HOST}/" /var/www/html/wordpress/wp-config.php

EXPOSE 9000 3306

COPY ./tools/launch_wp.sh /tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]