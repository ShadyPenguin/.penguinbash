#!/bin/bash
# All things required when you first clone this repository

# create virtualenvs directories
mkdir -p ~/.virtualenvs/python2
mkdir -p ~/.virtualenvs/python3

# Add default penguinbash to your bashrc
read -p "Do you want me to include all of my preferred bash files for you? [y/n] " ANSWER
if [[ "$ANSWER" == "y" ]]; then
  echo -e "\n\n# Penguin Bash\nsource ~/.penguinbash/bash/bashrc.bash" >> ~/.bashrc
  echo "I updated your ~/.bashrc!"
fi
echo "Successfully set up penguin bash dependencies!"