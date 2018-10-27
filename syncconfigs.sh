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
${sync} ~/.dotify/.aliases ${main}
${sync} ~/.dotify/.functions ${main}
${sync} ~/.dotify/.bashrc ${main}
${sync} ~/.dotify/.zshrc ${main}
${sync} ~/.dotify/.vimrc ${main}
#${sync} ~/.dotify/.config/i3/config ${main}
#${sync} ~/.dotify/.config/i3blocks/config ${main}
#${sync} ~/.dotify/.bash_aliases ${main}
#${sync} ~/.dotify/.bash_functions ${main}
#${sync} ~/.dotify/.zsh_aliases ${main}
#${sync} ~/.dotify/.zsh_functions ${main}
#${sync} ~/.dotify/.oh-my-zsh ${main}
#${sync} ~/.dotify/.vim* ${main}

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

