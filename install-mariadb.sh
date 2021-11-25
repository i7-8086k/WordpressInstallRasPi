#!/bin/bash
# sudo chmod 755 install-mariadb.sh

sudo apt-get install mariadb-server -y

sudo apt-get install mariadb-client -y

sudo service apache2 restart

# Raderar paket som inte behövs
sudo apt autoremove -y