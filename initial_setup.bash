#!/bin/bash
# All things required when you first clone this repository

# Add default penguinbash to your bashrc
read -p "Do you want me to include all of my preferred bash files for you? [y/n] " ANSWER
if [[ "$ANSWER" == "y" ]]; then
  echo -e "\n\n# Penguin Bash\nsource ~/.penguinbash/bash/bashrc.bash" >> ~/.bashrc
  echo "I updated your ~/.bashrc!"
fi
echo "Successfully set up penguin bash dependencies!"