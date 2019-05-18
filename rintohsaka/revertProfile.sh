#!/bin/sh
# Revert configurations back to original profile
# Finds all backup files [all files and directories ending in
# $bakext] and replaces them with their respective dot file name
#
# For example, if the backup file ~/.dotify/.vimrc.yanbak exists, it replaces
# the ~/.dotify/.vimrc file via the mv command:
#   mv ~/.dotify/.vimrc.yanbak ~/.dotify/.vimrc

profile=$PROFILE
bakext=.yanbak
dotdir=~/.dotify

printf "Reverting configuration back to ${profile}...\n\n"

for f in $dotdir/.*$bakext; do
        real=${f%$bakext}
        echo "Restored ${real##*/} from ${f##*/}"
done

printf "\nDone reverting to ${profile}'s original configuration\n"

