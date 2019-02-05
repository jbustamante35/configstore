#!/usr/bin/env bash

# Builds Polybar on Fedora-based systems
# Tested on Fedora 25, Fedora 26 and Korora 25, untested on others
# To get started:
#
# wget -O- https://gist.githubusercontent.com/nathanchere/22491daf4f917b100a35e5c284a5fec5/raw/install-polybar.sh | bash

# Main build dependencies #
###########################

sudo dnf install -y cmake @development-tools gcc-c++
sudo dnf install -y cairo-devel xcb-proto xcb-util-devel xcb-util-wm-devel xcb-util-image-devel

# Optional module dependencies #
################################

# i3
sudo dnf -y install i3-ipc jsoncpp-devel

# Volume
sudo dnf -y install alsa-lib-devel

# Network
sudo dnf -y install wireless-tools-devel

# MPD
sudo dnf -y install libmpdclient-devel

# Github
sudo dnf -y install libcurl-devel

# Get latest Polybar source #
#############################

# Clone repo locally
rm -rf /tmp/polybar
git clone --recursive https://github.com/jaagr/polybar /tmp/polybar
cd /tmp/polybar

# Check out the latest tagged release
currentRelease=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $currentRelease

./build.sh -f
