#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y

sudo nano /etc/crontab

echo '0 3 * * * /sbin/shutdown -r now' | sudo tee -a /etc/crontab

sudo nano /home/pi/.config/lxsession/LXDE-pi/autostart

echo 'sudo nano /home/pi/.config/lxsession/LXDE-pi/autostart
@xset s off
@xset -dpms
@xset s noblank
@chromium-browser –kiosk https://i7-8086k.github.io/Kiosk/' | sudo tee -a sudo nano /home/pi/.config/lxsession/LXDE-pi/autostart
