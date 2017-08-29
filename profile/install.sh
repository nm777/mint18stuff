#!/bin/bash

# Copy files to home
rsync {--exclude\ \"{.git,.gitignore,*.swp,install.sh}\"} -avh --no-perms . ~

# Remove install.sh, if it was moved there previously
rm ~/install.sh

# Refresh settings, in case new ones were loaded
source ~/.bash_profile;
