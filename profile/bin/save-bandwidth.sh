#!/usr/bin/env bash

# Are we enabling or disabling stuff?
if [ "${1,,}" == "reset" ]; then
    echo "Turning things back on again"

    # Enable automatic updates
    sudo sed -i 's/APT::Periodic::Update-Package-Lists "0";/APT::Periodic::Update-Package-Lists "1";/' /etc/apt/apt.conf.d/10periodic

    # Enable grive
    crontab -l | sed 's_^#\(.*/usr/bin/grive \)_\1_' | crontab -

    # Kill Pidgin and HipChat, then restart them normally
    pkill HipChat
    pkill pidgin
    nohup hipchat4 >/dev/null 2>&1 &
    nohup pidgin -f >/dev/null 2>&1 &
else
    echo "Reducing bandwidth usage"

    # Disable automatic updates
    pkill mintUpdate
    sudo sed -i 's/APT::Periodic::Update-Package-Lists "1";/APT::Periodic::Update-Package-Lists "0";/' /etc/apt/apt.conf.d/10periodic

    # Disable grive schedule
    crontab -l | sed 's_^\([^#].*/usr/bin/grive \)_#\1_' | crontab -

    # Kill Pidgin and HipChat, then restart them with limited bandwidth
    pkill HipChat
    pkill pidgin
    nohup trickle -u 1 -d 1 hipchat4 >/dev/null 2>&1 &
    nohup trickle -u 1 -d 1 pidgin -f >/dev/null 2>&1 &

    # Kill other stuff that doesn't need to run
    sudo pkill teamviewerd
fi
