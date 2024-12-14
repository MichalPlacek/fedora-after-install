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

# Install nvidia driver
echo "========== Step: nvidia driver =================="
dnf -y install akmod-nvidia
driver_status=$?

# Install cuda
echo "========== Step: cuda =================="
dnf -y install install xorg-x11-drv-nvidia-cuda
cuda_status=$?

# Install nvtop
echo "========== Step: nvtop =================="
dnf -y install install nvtop
nvtop_status=$?

echo ""
echo ""
echo "========== Summary =================="
print_result "Dirvers" $driver_status
print_result "Cuda" $cuda_status
print_result "Nvtop" $nvtop_status
