#!/bin/bash
# opens 3 terminals, firefox, and google-chrome

# Get total screen space
scrn=$(xrandr | head -n1 | cut -d, -f2 | cut -d" " -f3-5)
ttlX=$(echo $scrn | cut -dx -f1 | tr -d " ")
ttlY=$(echo $scrn | cut -dx -f2 | tr -d " ")

echo "|X=$ttlX|Y=$ttlY|"
echo "Total screen space: $scrn"

#disps=$(xrandr | grep -iw "connected")
numdisplays=$(xrandr | grep -iwc "connected")
patrn='\d+x\d+\+\d+\+\d+'
disps=$(xrandr | grep -iw "connected" | grep -oP $patrn)
if [ $numdisplays > 1 ]; then
        echo "Configuring for $numdisplays displays..."
        for (( n=1; n<=$numdisplays; n++)); do
                dims=$(echo $disps | cut -f$n -d" ")
                loc=$(echo $dims | grep -oP '\d+x\d+')
                size=$(echo $dims | grep -oP '\d+\+\d+')

                dX[$n]=$(echo $dims | grep -oP '\d+x\d+' | cut -d x -f1)
                dY[$n]=$(echo $dims | grep -oP '\d+x\d+' | cut -d x -f2)
                sX[$n]=$(echo $dims | grep -oP '\+\d+\+\d+' | cut -d + -f2-3 | cut -d + -f1)
                sY[$n]=$(echo $dims | grep -oP '\+\d+\+\d+' | cut -d + -f2-3 | cut -d + -f2)
                echo "Display $n: $dims | Cut: ${dX[$n]}|${dY[$n]}|${sX[$n]}|${sY[$n]}"
        done

        # Set up 3 terminals on Display 1
        term1=$((${dX[1]}/2))x${dY[1]}+${sX[1]}+${sY[1]}
        term2=$((${dX[1]}/2))x${dY[1]}+${sX[1]}-${sY[1]}
        term3=$((${dX[1]}/2))x${dY[1]}+${dY[1]}+${sY[1]}

        echo "Setting terminal1 to $term1"
        echo "Setting terminal2 to $term2"
        echo "Setting terminal3 to $term3"

        #gnome-terminal --profile="Arwing" --geometry=$term1
        #gnome-terminal --profile="BlueMarine" --geometry=$term2
        #gnome-terminal --profile="Wolfen" --geometry=$term3

        gnome-terminal --profile="Arwing" --geometry=137x33+0+0
        gnome-terminal --profile="BlueMarine" --geometry=137x42+0-0
        gnome-terminal --profile="Wolfen" --geometry=137x80+1080+0

        # Set up google-chrome and firefox on Display 2
        google-chrome --geometry=150x50-1920+0 &
        firefox --geometry=137x80+1080+0 ;
fi

#gnome-terminal --profile="BlueMarine" --geometry=100x30+0+0
#gnome-terminal --profile="Arwing" --geometry=150x29+0-0
#gnome-terminal --profile="Wolfen" --geometry=100x65+1080+0

#google-chrome &
#firefox ;

