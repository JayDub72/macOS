#!/usr/bin/env bash
#
# Create user accounts desired on the Mac installation

set -e


# Create Larissa account
sudo dscl . -create /Users/larissaw
sudo dscl . -create /Users/larissaw UserShell /bin/bash
sudo dscl . -create /Users/larissaw RealName "Larissa Worthen"
sudo dscl . -create /Users/larissaw UniqueID "505"
sudo dscl . -create /Users/larissaw PrimaryGroupID 20
sudo dscl . -create /Users/larissaw NFSHomeDirectory /Users/larissaw
echo "Enter password for Larissa"
read e_pwd
sudo dscl . -passwd /Users/larissaw "$e_pwd"
sudo mkdir /Users/larissaw
sudo chown larissaw:staff /Users/larissaw

# Create Rebekah account
sudo dscl . -create /Users/rebekahw
sudo dscl . -create /Users/rebekahw UserShell /bin/bash
sudo dscl . -create /Users/rebekahw RealName "Rebekah Worthen"
sudo dscl . -create /Users/rebekahw UniqueID "530"
sudo dscl . -create /Users/rebekahw PrimaryGroupID 20
sudo dscl . -create /Users/rebekahw NFSHomeDirectory /Users/rebekahw
echo "Enter password for Rebekah"
read e_pwd
sudo dscl . -passwd /Users/rebekahw "$e_pwd"
sudo mkdir /Users/rebekahw
sudo chown rebekahw:staff /Users/rebekahw
