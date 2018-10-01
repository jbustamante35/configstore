#!/bin/bash

man=~/Documents/configstore/dotlist.txt

while IFS=" " read -r line || [[ -n "$line" ]]; do
        if [[ ! "$line" =~ "#" ]]; then
                if [[ $line = *[![:space:]]* ]]; then
                        echo "$line"
                fi
        fi
done < "$man"


