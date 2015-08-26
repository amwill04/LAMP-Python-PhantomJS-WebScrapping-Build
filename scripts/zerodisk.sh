#!/bin/bash

# Credits to:
#  - http://vstone.eu/reducing-vagrant-box-size/
#  - https://github.com/mitchellh/vagrant/issues/343

aptitude -y purge ri
aptitude -y purge installation-report landscape-common wireless-tools wpasupplicant ubuntu-serverguide
aptitude -y purge python-dbus libnl1 python-smartpm python-twisted-core libiw30
aptitude -y purge python-twisted-bin libdbus-glib-1-2 python-pexpect python-pycurl python-serial python-gobject python-pam python-openssl libffi5
aptitude -y purge linux-image-3.0.0-12-generic-pae linux-image-extra-3.13.0-62-generic linux-headers-3.13.0-62-generic libruby1.9.1 libx11-doc
aptitude -y purge language-pack-gnome-en-base discover-data language-pack-en-base libfreetype6-dev libx11-dev x11proto-core-dev
aptitude -y purge g++ libnl-genl-3-200 libalgorithm-merge-perl libalgorithm-diff-xs-perl
aptitude -y purge libfile-fcntllock-perl crda hiera biosdevname discover libalgorithm-diff-perl
aptitude -y purge libnl-3-200 libopts25 libdiscover2 libreadline5 libtinfo-dev zlib1g-dev
aptitude -y purge libreadline-gplv2-dev dictionaries-common wamerican wbritish libssl-doc ntp
aptitude -y purge libdpkg-perl dpkg-dev libssl-dev libstdc++-4.8-dev g++-4.8 linux-firmware

# Remove APT cache
apt-get clean -y
apt-get autoclean -y
apt-get autoremove -y

# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Remove bash history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# Whiteout root
count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
rm /tmp/whitespace;

# Whiteout /boot
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
rm /boot/whitespace;

swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart;
swapon $swappart;
