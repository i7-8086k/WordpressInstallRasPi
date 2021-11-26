#!/bin/bash
# sudo chmod 755 install-phpmyadmin.sh

APACHE_CONF="/etc/apache2/apache2.conf"
CONF_STRING="Include /etc/phpmyadmin/apache.conf"
DB_USER='root'
DB_PASSWORD=''

# Installerar phpmyadmin
sudo apt install phpmyadmin -y

# Följande måste ni kopiera och sedan klistra in i putty. (kopiera EJ #)
sudo mysql --user=$DB_USER --password=$DB_PASSWORD << EOF
GRANT ALL PRIVILEGES ON *.* TO 'pi'@'localhost' IDENTIFIED BY 'raspberry' WITH GRANT OPTION;
exit
EOF

# Lägger till längst ner i apache2.conf
#echo 'Include /etc/phpmyadmin/apache.conf' | sudo tee -a /etc/apache2/apache2.conf

# Kollar om Include /etc/phpmyadmin/apache.conf finns i apache.conf
if grep -q $CONF_STRING $APACHE_CONF; then
    echo "$CONF_STRING finns redan i filen."
else
    # Lägger till Include /etc/phpmyadmin/apache.conf i slutet av apache.conf.
    echo $CONF_STRING | sudo tee -a $APACHE_CONF
fi

# Startar om apache.
sudo service apache2 restart