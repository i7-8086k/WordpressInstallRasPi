#!/bin/bash
# sudo chmod 755 install-phpmyadmin.sh

sudo apt install phpmyadmin -y

sudo mysql -u root -p

# GRANT ALL PRIVILEGES ON *.* TO 'pi'@'localhost' IDENTIFIED BY 'raspberry' WITH GRANT OPTION;

# Lägger till längst ner i apache2.conf
echo 'Include /etc/phpmyadmin/apache.conf' | sudo tee -a /etc/apache2/apache2.conf


sudo service apache2 restart