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
${sync} ~/bin                          ${main}
${sync} ~/.aliases             ${main}
${sync} ~/.functions           ${main}
${sync} ~/.shortcuts           ${main}
${sync} ~/.bashrc              ${main}
${sync} ~/.gitconfig           ${main}
${sync} ~/.mbsyncrc            ${main}
${sync} ~/.profile             ${main}
${sync} ~/.scripts             ${main}
${sync} ~/.urxvt               ${main}
${sync} ~/.zprofile            ${main}
${sync} ~/.zsh                 ${main}
${sync} ~/.zshrc               ${main}
${sync} ~/.vimrc               ${main}
${sync} ~/.xinitrc             ${main}
${sync} ~/.Xresources          ${main}
${sync} ~/.config/picom        ${main}
${sync} ~/.config/conky        ${main}
${sync} ~/.config/dunst        ${main}
${sync} ~/.config/grub.jpg     ${main}
${sync} ~/.config/i3           ${main}
${sync} ~/.config/i3blocks     ${main}
${sync} ~/.config/lock.jpg     ${main}
${sync} ~/.config/login.jpg    ${main}
${sync} ~/.config/mpd          ${main}
${sync} ~/.config/mutt         ${main}
${sync} ~/.config/ncmpcpp      ${main}
${sync} ~/.config/neofetch     ${main}
${sync} ~/.config/newsboat     ${main}
${sync} ~/.config/nvim         ${main}
${sync} ~/.config/openbox      ${main}
${sync} ~/.config/qutebrowser  ${main}
${sync} ~/.config/ranger       ${main}
${sync} ~/.config/rofi         ${main}
${sync} ~/.config/rtv          ${main}
${sync} ~/.config/sway         ${main}
${sync} ~/.config/tmux         ${main}
${sync} ~/.config/wall.jpg     ${main}
${sync} ~/.config/zathura      ${main}


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

