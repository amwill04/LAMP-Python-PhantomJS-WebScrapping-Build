#!/bin/bash

grep 'export WORKON_HOME=$HOME/.virtualenvs' ~/.profile || echo -e '\nexport WORKON_HOME=$HOME/.virtualenvs' | tee -a ~/.profile
grep '/usr/local/bin/virtualenvwrapper.sh' ~/.profile || echo 'source /usr/local/bin/virtualenvwrapper.sh' | tee -a ~/.profile
grep 'export DISPLAY=:10' ~/.profile || echo -e '\nexport DISPLAY=:10' | tee -a ~/.profile
rm -f /home/vagrant/profile.sh
