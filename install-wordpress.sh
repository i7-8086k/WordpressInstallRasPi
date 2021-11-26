#!/bin/bash
# sudo chmod 755 install-wordpress.sh

# Variabler
WP_URL="http://wordpress.org/latest.tar.gz"
WP_CONFIG="/var/www/html/wp-config.php"
HTML_DIR="/var/www/html"

sudo rm "$HTML_DIR/*"

# Byter till HTML_DIR
cd $HTML_DIR

# Laddar ner Wordpress.
sudo wget $WP_URL

sudo tar xzf latest.tar.gz

sudo mv wordpress/* . 

sudo rm -rf wordpress latest.tar.gz

# Ändrar så pi har rättigheter för html dir.
sudo chown -R $USER:www-data $HTML_DIR
sudo chmod -R 775 $HTML_DIR


# Kollar om define( 'FS_METHOD', 'direct' ); redan finns i wp-config.php
if grep -q "define( 'FS_METHOD', 'direct' );" $WP_CONFIG; then
    echo "Hello world...."
else
    # Lägger till så uppdateringar fungerar i wordpress.
    echo "define( 'FS_METHOD', 'direct' );" | sudo tee -a $WP_CONFIG
fi

