# Use the official Alpine Linux 3.18 image as the base image
FROM	alpine:3.18

# Install NGINX and create necessary directories https://wiki.alpinelinux.org/wiki/Nginx#Installation
RUN		apk update &&\
		apk add nginx &&\
		apk add openssl &&\
		mkdir -p /etc/nginx/ssl

# Generate SSL certificate and key without a password
# RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 		-out /etc/nginx/ssl/inception.crt \
# 		-keyout /etc/nginx/ssl/inception.key \
# 		-subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive Helsinki/OU=dgerguri/CN=dgerguri.42.fr/UID=dgerguri"

COPY 	./tools/tools.sh .

RUN		chmod +x tools.sh

COPY 	conf/nginx.conf /etc/nginx/nginx.conf

# Expose port
EXPOSE 443

# Command to start NGINX
# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["sh", "tools.sh"]
