#!/bin/sh

# editing for my personal configuration but feel free to leverage

# Set colors for output
LTRED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

# Get local computer name and replace spaces and apostrophes
# CompName=$(sudo scutil --get ComputerName)
# CompName=${CompName// /.}
# CompName=${CompName//\'/.}
# CompName=${CompName//\’/}

# Set backup path
# Leverages OneDrive but you can change to anything you like
# ** rsync copies break if path has a space in them **
echo "What is the computer name you want to restore from?"
read -e CompName
SourcePath="/Users/${USER}/OneDrive/Backup/$CompName"

# Get list of users and echo to a dotfile in local directory
# This file will be deleted at the end of the script
dscl . list /Users | grep -v '^_' >${HOME}/.users

# set up rsync to work
rsync_cmd="/usr/bin/rsync"
rsync_options="-aNHXsR --fileflags --delete-before --force-delete"

# step through each user in the .users file
while read p; do
  [ $p == "daemon" ] && continue
  [ $p == "nobody" ] && continue
  [ $p == "root" ] && continue
  [ $p == "Guest" ] && continue

  # set target directory for backup
  BackupPath="$SourcePath/$p"
  target_dir="/Users/$p"

  echo "${LTRED}› ${BLUE}Making directories for ${GREEN}$p${BLUE} account${NC}"
  sudo mkdir -p "$target_dir/Documents"
  sudo mkdir -p "$target_dir/Desktop"
  sudo mkdir -p "$target_dir/Downloads"
# removing minecraft
# mkdir -p "$target_dir/Minecraft"

  echo "${LTRED}› ${BLUE}Restoring Documents for ${GREEN}$p${NC}"
  sudo rsync -rq "$BackupPath/Documents" "$target_dir"

  echo "${LTRED}› ${BLUE}Restoring Desktop for ${GREEN}$p${NC}"
  sudo rsync -rq "$BackupPath/Desktop" "$target_dir"

  echo "${LTRED}› ${BLUE}Restoring Downloads for ${GREEN}$p${NC}"
  sudo rsync -rq "$BackupPath/Downloads" "$target_dir"

  echo "${LTRED}› ${BLUE}Restoring Fonts for ${GREEN}$p${NC}"
  sudo rsync -rq "$BackupPath/Fonts" "$target_dir"

  echo "${LTRED}› ${BLUE}Correcting permissions ${GREEN}$p${NC}"
  sudo chown -R $p "$target_dir/Documents"
  sudo chown -R $p "$target_dir/Desktop"
  sudo chown -R $p "$target_dir/Downloads"
  sudo chown -R $p "$target_dir/Fonts"


# removing minecraft
#  echo "${LTRED}› ${BLUE}Backing up Minecraft for ${GREEN}$p${NC}"
#  src_dir="/Users/$p/Library/Application Support/minecraft"
#  sudo rsync -rq "$src_dir" "$target_dir"

done <${HOME}/.users

# echo "${LTRED}› ${BLUE}Correcting all permissions -- just in case${NC}"
# sudo chown -R $USER "$BackupPath"

rm ${HOME}/.users

echo "${CYAN}Complete!${NC}"
