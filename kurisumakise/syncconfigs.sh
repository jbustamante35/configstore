#!/bin/bash
# Synchronize all configuration files to configstore repository

sync="rsync -avzu --delete --progress -h"
profile=$PROFILE
repo=~/Documents/configstore/$profile
main=$repo/main

# Check if directories exist
if [[ ! -d "$repo" ]]; then
    mkdir $repo
fi

if [[ ! -d "$main" ]]; then
    mkdir $main
fi

echo "Profile: $profile"
echo "Syncing configuration..."

# main
${sync} ~/bin                  ${main}
${sync} ~/.aliases             ${main}
${sync} ~/.functions           ${main}
${sync} ~/.shortcuts           ${main}
${sync} ~/.bashrc              ${main}
${sync} ~/.zshrc               ${main}
${sync} ~/.xinitrc             ${main}
${sync} ~/.Xresources          ${main}
${sync} ~/.config/bspwm        ${main}
${sync} ~/.config/sxhkd        ${main}
${sync} ~/.config/compton      ${main}
${sync} ~/.config/conky        ${main}
${sync} ~/.config/dunst        ${main}
${sync} ~/.config/tmux         ${main}
${sync} ~/.config/rofi         ${main}
${sync} ~/.config/rtv          ${main}
${sync} ~/.config/mpd/mpd.conf ${main}
${sync} ~/.config/mpv          ${main}
${sync} ~/.config/ncmpcpp      ${main}
${sync} ~/.config/ranger       ${main}
${sync} ~/.config/qutebrowser  ${main}
${sync} ~/.config/zathura      ${main}
${sync} ~/.config/wall.jpg     ${main}
${sync} ~/.config/grub.jpg     ${main}
${sync} ~/.config/login.jpg    ${main}
${sync} ~/.config/lock.jpg     ${main}

printf "\nSaving 'main' lists...\n"
maindirs=$(ls -A $main)
mainlist=$repo/mainlist.txt

if [[ ! -f "$mainlist" ]]; then
    touch $mainlist
fi

echo $maindirs | tr " " "\n" > $mainlist

#printf "Copying ${profile}'s scripts to respective directory...\n"
`cp ~/bin/syncconfigs.sh $repo`
`cp ~/bin/loadProfile.sh $repo`
`cp ~/bin/revertProfile.sh $repo`

printf "Finished syncing configuration for $profile"
