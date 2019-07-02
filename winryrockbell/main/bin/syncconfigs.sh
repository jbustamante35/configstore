#!/bin/bash
# Synchronize all configuration files to configstore repository
# Must have dotifytracking configuration files

sync="rsync -avzu --delete --progress -h"
profile=$PROFILE
repo=~/Documents/configstore/$profile
main=$repo/main
dots=$repo/dots
dotdirs=$(ls -A ~/.dotify)

# Check if directories exist
if [[ ! -d "$repo" ]]; then
    mkdir $repo
fi

if [[ ! -d "$main" ]]; then
    mkdir $main
fi

if [[ ! -d "$dots" ]]; then
    mkdir $dots
fi

echo "Profile: $profile"
echo "Syncing configuration..."

# main
${sync} ~/bin                          ${main}
${sync} ~/.dotify/.aliases             ${main}
${sync} ~/.dotify/.functions           ${main}
${sync} ~/.dotify/.shortcuts           ${main}
${sync} ~/.dotify/.bashrc              ${main}
${sync} ~/.dotify/.zshrc               ${main}
${sync} ~/.dotify/.vimrc               ${main}
${sync} ~/.dotify/.xinitrc             ${main}
${sync} ~/.dotify/.Xresources          ${main}
${sync} ~/.dotify/.config/awesome      ${main}
${sync} ~/.dotify/.config/i3           ${main}
${sync} ~/.dotify/.config/i3blocks     ${main}
${sync} ~/.dotify/.config/fluxbox      ${main}
${sync} ~/.dotify/.config/openbox      ${main}
${sync} ~/.dotify/.config/compton      ${main}
${sync} ~/.dotify/.config/conky        ${main}
${sync} ~/.dotify/.config/dunst        ${main}
${sync} ~/.dotify/.config/tmux         ${main}
${sync} ~/.dotify/.config/rofi         ${main}
${sync} ~/.dotify/.config/rtv          ${main}
${sync} ~/.dotify/.config/mpd/mpd.conf ${main}
${sync} ~/.dotify/.config/mpv          ${main}
${sync} ~/.dotify/.config/ncmpcpp      ${main}
${sync} ~/.dotify/.config/ranger       ${main}
${sync} ~/.dotify/.config/qutebrowser  ${main}
${sync} ~/.dotify/.config/zathura      ${main}
${sync} ~/.dotify/.config/grub.jpg     ${main}
${sync} ~/.dotify/.config/wall.jpg     ${main}
${sync} ~/.dotify/.config/lock.jpg     ${main}

# dots
for dot in $dotdirs; do
    ${sync} ~/.dotify/${dot} ${dots}
done

printf "\nSaving 'main' and 'dots' lists...\n"
maindirs=$(ls -A $main)
mainlist=$repo/mainlist.txt
dotlist=$repo/dotlist.txt

if [[ ! -f "$mainlist" ]]; then
    touch $mainlist
fi

if [[ ! -f "$dotlist" ]]; then
    touch $dotlist
fi
echo $dotdirs | tr " " "\n" > $dotlist
echo $maindirs | tr " " "\n" > $mainlist

#printf "Copying ${profile}'s scripts to respective directory...\n"
`cp ~/bin/syncconfigs.sh $repo`
`cp ~/bin/loadProfile.sh $repo`
`cp ~/bin/revertProfile.sh $repo`

printf "Finished syncing configuration for $profile"

