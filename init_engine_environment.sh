#!/bin/bash

apt-get update

chmod o+x /usr/lib/dbus-1.0/dbus-daemon-launch-helper
chmod +x /etc/rc.local

#---------------power management --------------
apt-get install -y busybox pm-utils triggerhappy
cp /etc/Powermanager/triggerhappy.service  /lib/systemd/system/triggerhappy.service

#---------------system--------------
apt-get install -y git fakeroot devscripts cmake binfmt-support dh-make dh-exec pkg-kde-tools device-tree-compiler bc cpio parted dosfstools mtools libssl-dev dpkg-dev isc-dhcp-client-ddns
apt-get install -f -y


echo -e "\033[36m Setup Video.................... \033[0m"
apt-get install -y gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-alsa \
	gstreamer1.0-plugins-base-apps qtmultimedia5-examples
apt-get install -f -y

#---------Xserver---------
echo -e "\033[36m Install Xserver.................... \033[0m"
apt-get build-dep -y xorg-server-source
apt-get install -y libgl1-mesa-dev libgles1 libgles1 libegl1-mesa-dev libc-dev-bin libc6-dev libfontenc-dev libfreetype6-dev \
	libpciaccess-dev libpng-dev libpng-tools libxfont-dev libxkbfile-dev linux-libc-dev manpages manpages-dev xserver-common zlib1g-dev \
	libdmx1 libpixman-1-dev libxcb-xf86dri0 libxcb-xv0
apt-get install -f -y

 #------------------Compile the rely on------------
 echo -e "\033[36m Install Compile the rely on .................... \033[0m"
 apt-get install -y build-essential cmake

 #------------------unho3d depend------------
 echo -e "\033[36m Install unho3d depend .................... \033[0m"
 apt-get update
 apt-get install -y libgles2-mesa-dev
 apt-get install -y libx11-dev libpulse-dev libdbus-1-dev libudev-dev libibus-1.0-dev libssl-dev

 #---------------Custom Script--------------
 systemctl mask systemd-networkd-wait-online.service
 systemctl mask NetworkManager-wait-online.service
 rm /lib/systemd/system/wpa_supplicant@.service

 #---------------Clean--------------
 rm -rf /var/lib/apt/lists/*

