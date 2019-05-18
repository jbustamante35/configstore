#!/bin/sh
# Loads configuration files for desired profile from configstore
# if the 'dots' configs option is selected, all configurations
# found in the dotlist.txt file that are uncommented will be
# loaded. User must comment out configurations that should
# are not desired.
#
# Usage
#   loadProfile.sh [profile] [configs]
#
# Parameters
#   profile: config profile to load
#   configs: set of configurations (main or dots)
#

me=$PROFILE
you=$1
configs=$2
repo=~/Documents/configstore/$you
bakext=.yanbak

# Load profile if found
if [[ ! -d $repo ]]; then
        printf "Profile '${you}' not found. Exiting...\n"
        exit 1
fi

# Load config file
case $configs in
        main)
                list=$repo/mainlist.txt
                ;;
        dots)
                list=$repo/dotlist.txt
                ;;
        *)
                printf "The option '${configs}' not recognized. Exiting... \n"
                exit 1
                ;;
esac

# Iterate through profile's configs and copy into user's .dotify directory
# First create backups of each as a 'config.yanbak' file
while IFS=" " read -r line || [[ -n "$line" ]]; do
        # Ignore commented lines
        if [[ ! "$line" =~ "#" ]]; then
                if [[ $line = *[![:space:]]* ]]; then
                        echo "Creating backup of $line into $line$bakext"
                        echo "Loaded $line"
                        echo ""
                fi
        fi
done < "$list"

