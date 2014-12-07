#!/usr/bin/env bash

cat << EOF
********
* Ruby *
********
EOF

# Download and install Ruby Version Manager
curl -sSL https://get.rvm.io | bash -s stable

# Source rvm script
source "/usr/local/rvm/scripts/rvm"

# Install ruby
rvm use --install --default 1.9.3

echo "Done installing Ruby."

# Maybe need to give permissions to vagrant:vagrant
