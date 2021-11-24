#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install xdotool unclutter sed

nano /home/pi/kiosk.sh

echo '#!/bin/bash
xset s noblank
xset s off
xset -dpms
unclutter -idle 0.5 -root &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk https://pimylifeup.com https://www.adafruit.com &
--kiosk
--noerrdialogs
--disable-infobars
https://i7-8086k.github.io/Kiosk/' | sudo tee -a /home/pi/kiosk.sh

sudo nano /lib/systemd/system/kiosk.service

echo '[Unit]
Description=Chromium Kiosk
Wants=graphical.target
After=graphical.target

[Service]
Environment=DISPLAY=:0.0
Environment=XAUTHORITY=/home/pi/.Xauthority
Type=simple
ExecStart=/bin/bash /home/pi/kiosk.sh
Restart=on-abort
User=pi
Group=pi

[Install]
WantedBy=graphical.target' | sudo tee -a /lib/systemd/system/kiosk.service

sudo nano /etc/crontab


echo '0 3 * * * /sbin/shutdown -r now' | sudo tee -a /etc/crontab

sudo systemctl enable kiosk.service

