#!/bin/bash
# sudo chmod 755 install-apache.sh

# Installerar apache
sudo apt-get install apache2 -y

# Installerar php och php/mysql connector
sudo apt-get install php -y

sudo apt-get install php-mysql -y

sudo a2enmod rewrite

sudo service apache2 restart
