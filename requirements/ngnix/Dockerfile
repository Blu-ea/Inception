FROM	debian:buster-slim
RUN	apt-get update -y	\
&&	apt-get upgrade -y

# Install Package for NGINX
RUN	apt-get install -y nginx	\
&&	apt-get install -y openssl

# Generate SSL Key
RUN		mkdir -p /etc/nginx/ssl \
&&		openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/amiguez.42.fr.key -out /etc/nginx/ssl/amiguez.42.fr.crt -subj /C=FR

EXPOSE 443 9000

