#!/bin/bash
# Script to iteratively add submodule to this git repository
# I mostly just want some practice writing shell scripts

split () {
    reponame=$1
    giturl=$2
    repopath=$3

    #echo "adding $reponame: git submodule add $giturl $repopath"
    git submodule add $giturl $repopath
}

manifest=~/.dotify/submodules_manifest.txt

while IFS=" " read -r repo || [ -n "$repo" ]; do
    if [[ ! $repo =~ "#" ]] ; then
        split ${repo}
    fi
done < ${manifest}

