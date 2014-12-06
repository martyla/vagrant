#!/usr/bin/env bash

# Needed for karma-phantomjs
sudo apt-get install -y libfontconfig

npm install -g gulp

# Set permissions
sudo chown -R vagrant:vagrant /usr/lib/node_modules
sudo chmod -R 755 /usr/lib/node_modules
