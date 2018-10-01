#!/bin/bash

man=~/Documents/configstore/synclist.txt

while IFS=" " read -r line || [[ -n "$line" ]]; do
        if [[ ! "$line" =~ "#" ]]; then
                if [[ $line = *[![:space:]]* ]]; then
                        echo "Good line; $line"
                fi
        fi
done < "$man"


