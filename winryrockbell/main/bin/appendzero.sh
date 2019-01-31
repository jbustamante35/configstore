#!/bin/bash
# Appends leading-zeros for numerical organization of files
# in current directory. User specifies the number of leading
# zeros to add, as well as the image extension.
#
# Usage:
#	appendZeros.sh <number-zeros> <image-extension>
#

num=$1
app=$2
arg=%0${num}d\.${app}
echo "args: $arg"

for x in *$app ; do
    inp=%0$num
    ext=${x%$app} 
    y=$(printf ${inp}d$app $ext)
    if [ $x != $y ]; then
        mv $x $y
    fi
done

echo "Finished renaming all $app files"
