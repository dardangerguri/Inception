#!/bin/sh

echo "Starting WordPress setup script".

while ! mariadb -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_DATABASE_NAME &>/dev/null;
do
	echo "Waiting for the database to be ready";
	sleep 10;
done
echo "ready!"

# Verify if the wordpress is installed
if [ -f wp-config.php ]; then
	echo "WordPress: already installed"
else
	echo "WordPress: installing"
	# Create the wordpress configuration file
	wp config create \
		--dbname=$DB_DATABASE_NAME \
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
		--allow-root;
		# --path=/var/www/html/wordpress	 \

		# Refresh the wordpress cache
	wp cache flush \
		--allow-root;
		# --path=/var/www/html/wordpress \

		# Install the wordpress theme
	wp theme install \
		twentynineteen \
		--activate \
		--allow-root;
		# --path=/var/www/html/wordpress \

	# Wordpress siteurl option
	wp option update siteurl "https://$DOMAIN_NAME" \
		--allow-root;
		# --path=/var/www/html/wordpress \

	# Wordpress home option update
	wp option update home "https://$DOMAIN_NAME" \
		--allow-root;
		# --path=/var/www/html/wordpress \

	chown -R www-data:www-data /var/www/html
	chmod -R 775 /var/www/html
	echo "WordPress: installed"

fi

exec /usr/sbin/php-fpm81 -F -R

