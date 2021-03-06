#!/bin/bash

# Copy files to home
rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude "*.swp" \
      --exclude "install.sh" \
      -avh --no-perms . ~

# Remove install.sh, if it was moved there previously
if [ -f ~/install.sh ]; then
    rm ~/install.sh
fi

# Remove .git folder, if it was moved there previously
if [ -d ~/.git ]; then
    rm -rf ~/.git
fi

# Refresh settings, in case new ones were loaded
source ~/.bash_profile;
