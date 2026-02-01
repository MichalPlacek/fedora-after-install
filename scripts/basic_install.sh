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

# Install neovim
echo "========== Step: neovim =================="
dnf -y install neovim
neovim_status=$?


# Install brave
echo "========== Step: brave =================="
dnf -y install dnf-plugins-core
brave_status=$?
if [ $brave_status -eq 0 ]
then
  dnf config-manager addrepo --id=brave-browser --set=name='Brave Browser' --set=baseurl='https://brave-browser-rpm-release.s3.brave.com/$basearch'
  brave_status=$?
  if [ $brave_status -eq 0 ]
  then
    dnf -y install brave-browser
    brave_status=$?
  fi
fi


# Install mc
echo "========== Step: mc =================="
dnf -y install mc
mc_status=$?



# rpm fusion
echo "========== Step: rpm fusion =================="
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
fusion_status=$?
if [ $fusion_status -eq 0 ]
then
  dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  fusion_status=$?
fi


# video codecs
echo "========== Step: video codecs =================="
codecs_status=-1
if [ $fusion_status -eq 0 ]
then
   dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
   codecs_status=$?
   if [ $codecs_status -eq 0 ]
   then
      dnf -y install lame\* --exclude=lame-devel
      codecs_status=$?
      if [ $codecs_status -eq 0 ]
      then
         dnf -y group upgrade --with-optional Multimedia
         codecs_status=$?
      fi
   fi
fi

# Install git
echo "========== Step: git =================="
dnf -y install git
git_status=$?

echo ""
echo ""
echo "========== Summary =================="
print_result "Neovim" $neovim_status
print_result "Brave" $brave_status
print_result "Mc" $mc_status
print_result "Rpm fusion" $fusion_status
print_result "Video codecs" $codecs_status
print_result "Git" $git_status
