#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y

echo '0 3 * * * /sbin/shutdown -r now' | sudo tee -a /etc/crontab

sudo apt-get install unclutter

sudo service lightdm restart

echo '@lxpanel --profile LXDE
@pcmanfm --desktop --profile LXDE
@xset s off
@xset -dpms
@xset s noblank
@chromium-browser –kiosk https://i7-8086k.github.io/Kiosk/

@/home/pi/run.sh' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart

touch /home/pi/run.sh

chmod +x /home/pi/run.sh