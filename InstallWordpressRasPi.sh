#!/bin/bash
sudo apt update && sudo apt upgrade -y

sudo apt-get install apache2 -y

sudo apt-get install php -y

sudo apt-get install php-mysql -y

sudo a2enmod rewrite

sudo apt install phpmyadmin -y

sudo mysql -u root -p

# GRANT ALL PRIVILEGES ON *.* TO 'pi'@'localhost' IDENTIFIED BY 'raspberry' WITH GRANT OPTION;

echo 'Include /etc/phpmyadmin/apache.conf' | sudo tee -a /etc/apache2/apache2.conf

sudo apt-get install mariadb-server -y

sudo apt-get install mariadb-client -y

sudo apt autoremove -y

sudo service apache2 restart

sudo rm /var/www/html/*

cd /var/www/html

sudo wget http://wordpress.org/latest.tar.gz

sudo tar xzf latest.tar.gz

sudo mv wordpress/* . 

sudo rm -rf wordpress latest.tar.gz

source set-permissions.sh

echo 'define( 'FS_METHOD', 'direct' );' | sudo tee -a /var/www/html/wp-config.php

sudo chown -R $USER:www-data /var/www/html
sudo chmod -R 775 /var/www/html