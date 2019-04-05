#!/bin/bash
# Script to create hard links from path names in a text file
#
# NOTE
# This is gonna be pretty dangerous if I don't adequately test this.
#

set -e

fin=$1
dest=$2
#link=echo
link="ln -f"

#for f in $fin; do
while IFS='' read -r line || [[ -n "$line" ]]; do

    #echo "$link $line $dest"
    $link $line $dest
    #printf "Created hard link ${link} for ${line} in ${dest}\n"

done < "$fin"


