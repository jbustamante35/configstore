#!/bin/bash
# Create empty file versions of everything in a directory
# to test whatever script you're working on.

file_type=$1
emptydir="empty_versions"
manifest="manifest.txt"

mkdir $emptydir
touch $manifest
ls *$file_type >> $manifest
mv $manifest $emptydir
cd $emptydir
touch $(cat $manifest)
cd ..
