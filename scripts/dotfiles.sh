#!/usr/bin/env bash

cat << EOF
********************
* Install dotfiles *
********************
EOF

# Backup $HOME because we will rewrite over it
OLD_HOME=$HOME
OLD_DIR=$PWD

export HOME=/home/vagrant
cd $HOME

echo "Fetching dotfiles from Github"
git clone https://github.com/martyla/dotfiles.git .dotfiles

# Enter dotfiles directory
cd .dotfiles

echo "Installing dotfiles"
./bootstrap.zsh -f

cd $OLD_DIR
export HOME=$OLD_HOME

# Fix permissions - could make less hacky by running this non root
sudo chown -R vagrant:vagrant /home/vagrant

echo "Done installing dotfiles."
