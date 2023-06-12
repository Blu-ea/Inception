#!/bin/bash

if ! wp core is-installed --allow-root --path=/var/www/html/wordpress
then

wp core install	--allow-root \
				--path=/var/www/html/wordpress \
				--url=$DOMAIN_URL \
				--title="$DOMAIN_TITLE" \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_MAIL

wp user create	--allow-root \
				--path=/var/www/html/wordpress \
				$USER_LOGIN $USER_MAIL \
				--user_pass=$USER_PASS --role=editor

fi

php-fpm7.3 -F