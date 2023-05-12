FROM	debian:buster
RUN	apt-get update -y	\
&&	apt-get upgrade -y

# Install Package for NGINX
RUN	apt-get install -y nginx	\
&&	apt-get install -y openssl

# Generate SSL Key
RUN		mkdir -p /etc/nginx/ssl \
&&		openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout \
		/etc/nginx/ssl/amiguez.42.fr.key -out /etc/nginx/ssl/amiguez.42.fr.crt \
		-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=amiguez.42.fr/emailAddress=amiguez@student.42lyon.fr"

COPY	./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443 9000

# ENTRYPOINT [ "nginx" ]

