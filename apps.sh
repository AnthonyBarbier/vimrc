#!/bin/bash

sleep 10

#gnome-screensaver &
xscreensaver&
nm-applet &
#gnome-settings-daemon &
conky &
gnome-power-manager &
#gnome-volume-control-applet &
alsa-tray &
#checkgmail &
#amsn &
#pidgin&
#skype &
#tomboy &
#davmail &
thunderbird &
google-chrome &
mount_eis.sh 
mount_projects.sh 
mount_arm.sh 
mount_oldarm.sh 

pkill -9 indicator-appli
