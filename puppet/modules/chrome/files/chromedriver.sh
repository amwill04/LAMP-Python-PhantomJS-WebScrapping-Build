#!/bin/bash

cd /tmp
wget http://chromedriver.storage.googleapis.com/2.16/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm chromedriver_linux64.zip
chmod +x chromedriver
sudo mv -f chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
rm -f /home/vagrant/chromedriver.sh
