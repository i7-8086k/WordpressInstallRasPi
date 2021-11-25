#!/bin/bash
sudo apt update && sudo apt upgrade -y

echo '0 3 * * * /sbin/shutdown -r now' | sudo tee -a /etc/crontab

sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit

startx



echo '@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash
/usr/bin/chromium-browser --kiosk  --disable-restore-session-state https://i7-8086k.github.io/Kiosk/' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart