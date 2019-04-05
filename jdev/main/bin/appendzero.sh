#!/bin/bash
#
# Script to add leading 0's to all files of 
# the desired extension type. The first argument
# specifies the total length for the 
# outputted filename. The second argument
# specifies the file type extension.
#
# Usage:
#   appendzero.sh [num_zeros] [filetype_extension]
#
# NOTE:
#   For the filetype_extension parameter, be sure
#   to include the "." in your argument [.TIF]
#
# Example:
#   appendzero.sh 4 .TIF
# 
# TODO:
# Currently there seems to be issues with 
# invalid octal numbers for some files. Looking
# into it, the problem is with filenames that begin
# with 08 and 09, due to the Bash language's roots
# in original C-language. 
#
# Unfortunately, this current version removes
# these bad files completely...
#
# I don't have any workarounds currently, so 
# don't run this on directories that are 
# already sorted or have pre-appended 0's.

num=$1
ext=$2
arg=%0${num}d\.${ext}
echo "args: $arg"

for fin in *$ext ; do
    app=${fin%$ext} 
    inp=%0${num}d
    
    fix=$(printf "${inp}" "${app#0}")
    fout=$fix$ext

    mv $fin $fout
    #echo "f: $fin | fout: $fout"
done

echo "Finished renaming all $ext files"


