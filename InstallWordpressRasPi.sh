#!/bin/bash
sudo apt update && sudo apt upgrade -y

source scripts/install-apache.sh

source scripts/install-mariadb.sh

source scripts/install-phpmyadmin.sh

source scripts/install-wordpress.sh

source scripts/set-permissions.sh