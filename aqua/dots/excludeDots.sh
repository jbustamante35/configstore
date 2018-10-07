#!/bin/bash
# script to iteratively exclude dotfiles managed by dotify

dotlist=~/.dotify/dots2exclude.txt

excludeDot () {
    dot=$1
    #yes | echo "dotify unlink $dot" ;
    yes | dotify unlink $dot;
}

while IFS=" " read -r dot || [ -n "$dot" ]; do
    if [[ ! $dot =~ "#" ]]; then
        excludeDot $dot
    fi
done < ${dotlist}
