#!/bin/bash
# Convert filenames to numbers WITHOUT leading zeros
# i.e. fileA.png fileB.png ... filen.png --> 1.png 2.png ... N.png
# NOTE: if you re-run this in an already-converted directory, it will
# mess up the original order of the files. 
# This script is mostly for testing some PhytoMorph algorithms, which 
# require filenames in this specific format.

ext=$1
idx=1

for fin in *$ext ; do
        echo "Input: $fin"
        fout=$((idx++)).png
        echo "Output: $fout"
        mv $fin $fout
done

echo "Finished numerical conversion of all $idx $ext files"
