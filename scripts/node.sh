#!/usr/bin/env bash

cat << EOF
******************
* Install NodeJS *
******************
EOF

sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update -qq
sudo apt-get install -y nodejs

sudo chown -R vagrant:vagrant /usr/lib/nodejs
sudo chmod -R 755 /usr/lib/nodejs

echo "Done installing NodeJS"
