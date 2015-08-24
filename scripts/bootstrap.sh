#!/usr/bin/env bash
cat << EOF
*************
* BOOTSTRAP *
*************
EOF

# Update ubuntu
sudo apt-get update -qq

# Set timezone to Australia/Sydney
echo "Setting timezone to Australia/Sydney"
sudo ln -fs "/usr/share/zoneinfo/Australia/Sydney" "/etc/localtime"
sudo dpkg-reconfigure --frontend noninteractive tzdata

# Set language to en_AU UTF-8
sudo dpkg-reconfigure locales
sudo locale-gen en_AU.UTF-8

# Install basic dependencies
echo "Installing curl, wget, git, vim, build-essential"
sudo apt-get install -y curl wget git-core vim build-essential

# Give access to bin folder for vagrant
sudo chmod 755 /usr/bin
sudo chown vagrant:vagrant /usr/bin

# While box is being provisioned vagrant user doesn't exist
if [ ! -d /home/vagrant ]; then
  sudo mkdir -p /home/vagrant
fi

sudo chmod 755 /home/vagrant
sudo chown vagrant:vagrant /home/vagrant

# Store time which box was provisioned
date > /home/vagrant/.VAGRANT_PROVISIONED_AT
sudo chmod 755 /home/vagrant/.VAGRANT_PROVISIONED_AT
sudo chown vagrant:vagrant /home/vagrant/.VAGRANT_PROVISIONED_AT

# Disable extended bash completion as it is slow
echo "Disabling extended bash completions"
sudo apt-get remove -y bash-completion
sudo dpkg --purge bash-completion
complete -r

# Use zsh shell
echo "Switching shell to zsh"
sudo apt-get install -y zsh
sudo chsh -s /bin/zsh vagrant
zsh
