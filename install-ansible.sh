#!/bin/bash

pip3 install --user ansible
echo 'export PATH="$PATH:/home/vagrant/.local/bin"' | sudo tee -a /etc/profile
source /etc/profile
