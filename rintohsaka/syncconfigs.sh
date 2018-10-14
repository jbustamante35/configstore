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
		echo "Creating $repo directory"
        mkdir $repo
fi

if [[ ! -d "$main" ]]; then
		echo "Creating $main directory"
        mkdir $main
fi

if [[ ! -d "$dots" ]]; then
		echo "Creating $dots directory"
        mkdir $dots
fi

echo "Profile: $profile"
echo "Syncing configuration..."

# main
${sync} ~/.dotify/.bash* ${main}
${sync} ~/.dotify/.zsh* ${main}
${sync} ~/.dotify/.oh-my-zsh ${main}
${sync} ~/.dotify/.vim* ${main}

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

