#!/usr/bin/env bash

# Install stuff that I always want
sudo apt-get update
sudo apt-get install curl

# Install stuff that I may or may not want
TO_INSTALL=
PromptYN "Install Audacity?" "TO_INSTALL=$TO_INSTALL audacity "
PromptYN "Install Docker?" "TO_INSTALL=$TO_INSTALL docker docker-compose docker.io"
PromptYN "Install GIMP?" "TO_INSTALL=$TO_INSTALL gimp"
PromptYN "Install Git?" "TO_INSTALL=$TO_INSTALL git"
PromptYN "Install Grive?" "TO_INSTALL=$TO_INSTALL grive"
PromptYN "Install Handbrake?" "TO_INSTALL=$TO_INSTALL handbrake"
PromptYN "Install HipChat?" "TO_INSTALL=$TO_INSTALL hipchat4"
PromptYN "Install Citrix ICA Client?" "TO_INSTALL=$TO_INSTALL icaclient"
PromptYN "Install KeePassX?" "TO_INSTALL=$TO_INSTALL keepassx"
PromptYN "Install Remmina RDP Manager?" "TO_INSTALL=$TO_INSTALL remmina"
PromptYN "Install TeamViewer?" "TO_INSTALL=$TO_INSTALL teamviewer:i386"
PromptYN "Install Vim?" "TO_INSTALL=$TO_INSTALL vim"
PromptYN "Install Virtualbox?" "TO_INSTALL=$TO_INSTALL virtualbox"
PromptYN "Install VLC?" "TO_INSTALL=$TO_INSTALL vlc"
PromptYN "Install Wireshark?" "TO_INSTALL=$TO_INSTALL wireshark"

sudo apt-get install -y $TO_INSTALL

# Set brightness to auto-adjust with power is connected/dicsonnected
ln -s ~/mint18stuff/custom/control_brightness /usr/local/sbin/control_brightness
echo "setsid /usr/local/sbin/control_brightness >/var/log/bc.log 2>&1 < /dev/null &" >> /etc/rc.local

# Profile settings to link

# Functions used above
function PromptYN {
	while true; do
		read -p "$1" yn
		case $yn in
			[Yy]* ) eval $2; break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done
}
