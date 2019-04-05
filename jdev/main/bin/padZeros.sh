#!/bin/bash

num=$1
ext=$2
X=1;

arg=%0${num}d\.${app}
echo "args | $arg"

for i in *$ext; do
    inp="%0${num}d.%s"
    echo "mv $i $(printf ${inp} ${X%.*} ${i##*.})"
    #mv $i $(printf ${inp} ${X%.*} ${i##*.})
    #mv $i $(printf %05d.%s ${X%.*} ${i##*.})
	let X="$X+1"
done

#arg=%0${num}d\.${app}
#inp=%0$num
#ext=${i%$app}
#
#  3 num=$1
#  4 app=$2
#  5 arg=%0${num}d\.${app}
#  6 echo "args: $arg"
#  7 
#  8 for x in *$app ; do
#  9     inp=%0$num
# 10     ext=${x%$app}
# 11     y=$(printf ${inp}d$app $ext)
# 12     if [ $x != $y ]; then
# 13         #mv $x $y
# 14         echo "mv $x | $y"
# 15     fi
# 16 done
# 17 
# 18 echo "Finished renaming all $app files"
