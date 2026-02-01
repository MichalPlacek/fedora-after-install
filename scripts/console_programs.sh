#!/bin/bash

print_result () {
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  echo -n "$1: "
  if [ $2 -eq 0 ]
  then
     echo -e "${GREEN}OK${NC}"
  else
     echo -e "${RED}FAILED${NC}"
  fi
}

# Install kitty
echo "========== Step: kitty =================="
dnf -y install kitty
kitty_status=$?

# Install htop
echo "========== Step: htop =================="
dnf -y install htop
htop_status=$?

echo ""
echo ""
echo "========== Summary =================="
print_result "Kitty" $kitty_status
print_result "Htop" $htop_status
