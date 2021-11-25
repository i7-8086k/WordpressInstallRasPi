#!/bin/bash
sudo apt update && sudo apt upgrade -y

echo '0 3 * * * /sbin/shutdown -r now' | sudo tee -a /etc/crontab

sudo apt-get install unclutter -y

sudo service lightdm restart

touch /etc/xdg/lxsession/LXDE-pi/autostart

echo '@lxpanel --profile LXDE
@pcmanfm --desktop --profile LXDE
@xset s off
@xset -dpms
@xset s noblank
@chromium-browser –kiosk https://i7-8086k.github.io/Kiosk/

@/home/pi/run.sh' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart

touch /home/pi/run.sh

cho '#!/bin/sh
/usr/bin/chromium-browser --app=https://i7-8086k.github.io/Kiosk/
  --kiosk
  --noerrdialogs
  --disable-session-crashed-bubble
  --disable-infobars
  --check-for-update-interval=604800
  --disable-pinch' | sudo tee -a /home/pi/run.sh

chmod +x /home/pi/run.sh
./home/pi/run.sh