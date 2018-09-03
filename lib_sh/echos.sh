#!/usr/bin/env bash

###############################
# some colorized echo helpers
# @author Adam Eivy
###############################

# Set colors for output
LTRED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

info () {
  printf "\r  [ ${GREEN}..${NC} ] $1\n"
}

user () {
  printf "\r  [ ${BLUE}??${NC} ] $1\n"
}

success () {
  printf "\r\033[2K  [ ${CYAN}OK${NC} ] $1\n"
}

fail () {
  printf "\r\033[2K  ${LTRED}FAIL${NC} $1\n"
  echo ''
  exit
}