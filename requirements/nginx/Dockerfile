FROM	debian:buster-slim

# ENV DEBIAN_FRONTEND=noninteractive

RUN	apt-get update -y	\
&&	apt-get upgrade -y

# Install Package for NGINX
RUN	apt-get install -y nginx	\
&&	apt-get install -y openssl

# Generate SSL Key
RUN		mkdir -p /etc/nginx/ssl \
&&		openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
		-keyout /etc/nginx/ssl/amiguez.42.fr.key   -out /etc/nginx/ssl/amiguez.42.fr.crt \
		-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=amgiguez.42.fr/emailAddress=amiguez@student.42lyon.fr"

COPY	./tools/nginx.conf /etc/nginx/conf.d/amiguez.conf 
# COPY	./tools/nginx.conf /etc/nginx/sites-available/amiguez.42.fr.conf
# RUN		ln -s /etc/nginx/sites-available/amiguez.42.fr.conf /etc/nginx/sites-enabled/amiguez.42.fr.conf


EXPOSE 443 9000

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
