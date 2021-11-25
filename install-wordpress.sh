#!/bin/bash
# sudo chmod 755 install-wordpress.sh

sudo rm /var/www/html/*

cd /var/www/html

sudo wget http://wordpress.org/latest.tar.gz

sudo tar xzf latest.tar.gz

sudo mv wordpress/* . 

sudo rm -rf wordpress latest.tar.gz

# Permissions
source set-permissions.sh

# Lägger till så uppdateringar fungerar i wordpress.
echo 'define( 'FS_METHOD', 'direct' );' | sudo tee -a /var/www/html/wp-config.php
