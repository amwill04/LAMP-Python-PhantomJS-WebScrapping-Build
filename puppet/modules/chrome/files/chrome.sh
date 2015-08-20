#!/bin/bash

if google-chrome --version
then
  rm -f /home/vagrant/chrome.sh
else
  cd /tmp
  sudo apt-get install libxss1 libappindicator1 libindicator7 -y
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome*.deb
  sudo apt-get install -f -y
  sudo apt-get install xvfb -y
  Xvfb :10 -screen 0 1024x768x8 &
  sudo rm -f /tmp/google-chrome*
  rm -f /home/vagrant/chrome.sh
fi
