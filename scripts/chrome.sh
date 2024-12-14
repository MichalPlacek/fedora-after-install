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

# Install chrome
echo "========== Step: chrome =================="
dnf -y install google-chrome-stable
chrome_status=$?


echo ""
echo ""
echo "========== Summary =================="
print_result "Chrome:" $chrome_status
