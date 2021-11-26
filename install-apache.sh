#!/bin/bash
# sudo chmod 755 install-apache.sh

# Installerar apache
sudo apt-get install apache2 -y

# Installerar php och php/mysql connector
sudo apt-get install php -y

sudo apt-get install php-mysql -y

# Rewrite för länkar ska fungera korrekt i wordpress
sudo a2enmod rewrite

# Lägger till texten på första raden.
sudo sed -i '1i <Directory /var/www/html>\n\tOptions Indexes FollowSymLinks MultiViews\n\tAllowOverride All\n\tRequire all granted\n</Directory>\n\n' /etc/apache2/sites-available/000-default.conf

# Startar om apache service, måste köras för att nya apache.conf ska gälla.
sudo systemctl restart apache2

