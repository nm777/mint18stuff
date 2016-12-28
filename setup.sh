#!/usr/bin/env bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")                                                                                                                                                     
# Absolute path this script is in, thus /home/user/bin
SCRIPTDIR=$(dirname "$SCRIPT")

# Install stuff that I always want
sudo apt-get update
sudo apt-get -y install acpi curl xbacklight

# Install stuff that I may or may not want
TO_INSTALL=
PromptYN "Install Audacity?" "TO_INSTALL=$TO_INSTALL audacity "
PromptYN "Install Docker?" "TO_INSTALL=$TO_INSTALL docker docker-compose docker.io"
PromptYN "Install GIMP?" "TO_INSTALL=$TO_INSTALL gimp"
PromptYN "Install Git?" "TO_INSTALL=$TO_INSTALL git"
PromptYN "Install Grive?" "TO_INSTALL=$TO_INSTALL grive && sudo add-apt-repository ppa:nilarimogard/webupd8"
PromptYN "Install Handbrake?" "TO_INSTALL=$TO_INSTALL handbrake && sudo add-apt-repository ppa:stebbins/handbrake-releases"
PromptYN "Install HipChat?" "TO_INSTALL=$TO_INSTALL hipchat4"
# PromptYN "Install Citrix ICA Client?" "TO_INSTALL=$TO_INSTALL icaclient"
PromptYN "Install KeePassX?" "TO_INSTALL=$TO_INSTALL keepassx"
PromptYN "Install Remmina RDP Manager?" "TO_INSTALL=$TO_INSTALL remmina"
PromptYN "Install TeamViewer?" "curl https://download.teamviewer.com/download/teamviewer_i386.deb > /tmp/tv.deb && sudo dpkg -i /tmp/tv.deb && sudo apt-get install -f"
PromptYN "Install Vim?" "TO_INSTALL=$TO_INSTALL vim"
PromptYN "Install Virtualbox?" "TO_INSTALL=$TO_INSTALL virtualbox"
PromptYN "Install VLC?" "TO_INSTALL=$TO_INSTALL vlc"
PromptYN "Install Wireshark?" "TO_INSTALL=$TO_INSTALL wireshark"

sudo apt-get update && sudo apt-get install -y $TO_INSTALL

# Set brightness to auto-adjust with power is connected/disconnected
sudo ln -s ~/mint18stuff/custom/control_brightness /usr/local/bin/control_brightness
sudo ln -s ~/mint18stuff/custom/brightness.service /etc/systemd/system/brightness.service
sudo chmod 644 /etc/systemd/system/brightness.service
#sudo echo "setsid /usr/local/bin/control_brightness >/var/log/bc.log 2>&1 < /dev/null &" >> /etc/rc.local

# Link files to the profile
cd $HOME
for D in `find $SCRIPTDIR/profile -type d`
do
	if [ ! -d "$D" ]
	then
		mkdir $D
	fi
done
STRIP=`echo -n "$SCRIPTDIR/profile/" | wc -c`
for F in `find $SCRIPTDIR/profile -type f`
do
	if [ -f "$F" ]
	then
		# Rename the file .old
		mv $F $F.old
	fi
	ln -s $F $HOME/${F:$STRIP}
done
cp -r -s $SCRIPTDIR/profile/. .

####################################################################################3
# Functions used above
####################################################################################3

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
