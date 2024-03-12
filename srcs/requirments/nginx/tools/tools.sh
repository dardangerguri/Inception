#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048\
		-out /etc/nginx/ssl/inception.crt\
		-keyout /etc/nginx/ssl/inception.key\
		-subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive Helsinki/OU=dgerguri/CN=dgerguri.42.fr/UID=dgerguri"

nginx -g "daemon off;"

