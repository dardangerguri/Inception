#!/bin/sh

# Go to the wordpress directory
cd /var/www/html/wordpress

# Verify if the wordpress is installed
if [ ! -f wp-config.php ]; then
	# Create the wordpress configuration file
	wp config create \
	 --dbname=$DB_DATABASE \
	 --dbuser=$DB_USER \
	 --dbpass=$DB_PASSWORD \
	 --dbhost=$DB_HOST \
	 --allow-root;

	# Install the wordpress
	wp core install \
	 --url=https://$DOMAIN_NAME \
	 --title=$WP_TITLE \
	 --admin_user=$ADMIN_USER \
	 --admin_password=$ADMIN_PASSWORD \
	 --admin_email=$ADMIN_EMAIL \
	 --allow-root;

	# Create an additional user with the role of author
	wp user create \
	 $USER_LOGIN \
	 $USER_EMAIL \
	 --role=author \
	 --user_pass=$USER_PASSWORD \
	 --path=/var/www/html/wordpress \
	 --allow-root;

	 # Refresh the wordpress cache
	 wp cache flush \
	 --allow-root;





	 DOMAIN_NAME=
	 WP_TITLE=
	 ADMIN_USER=
	 ADMIN_PASSWORD=
	 ADMIN_EMAIL=

	 USER_LOGIN=
	 USER_EMAIL=
	 USER_PASSWORD=