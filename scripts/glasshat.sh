#!/usr/bin/env bash

# Needed for karma-phantomjs
sudo apt-get install -y libfontconfig

# Install gulp/bower globally
npm install -g gulp
npm install -g bower

# Set permissions
sudo chown -R vagrant:vagrant /usr/lib/node_modules
sudo chmod -R 755 /usr/lib/node_modules
