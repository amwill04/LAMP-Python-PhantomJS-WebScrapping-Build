#!/bin/bash

cd /tmp
sudo wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get -y update
sudo apt-get install puppet facter -y
sudo sed -i 's@templatedir=$confdir/templates@@g' /etc/puppet/puppet.conf
