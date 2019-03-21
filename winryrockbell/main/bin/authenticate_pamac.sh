#!/bin/sh
# Configure polkit and keyring for pamac-manager authentication

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & \
    eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

