#!/bin/bash

# Install neovim
dnf -y install neovim

# Install Brave
dnf -y install dnf-plugins-core

dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

dnf -y install brave-browser

# Install mc
dnf -y install mc

# rpm fusion and codecs
dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

dnf -y install lame\* --exclude=lame-devel

dnf -y group upgrade --with-optional Multimedia

# install git
dnf -y install git
