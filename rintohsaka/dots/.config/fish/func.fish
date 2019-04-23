# vim: filetype=fish
#############
# FUNCTIONS #
#############

# create directory and move to it
function mvcd
    mkdir $1;
    cd $1;
end

# move to directory and show contents
function cl
    cd $1 ;
    ls -AF;
end

# easily create alias [not very flexible yet]
function ali
    abbr $1 $2
end

# Show status of dropbox syncing
function drchk
    cd $HOME/Dropbox;
    dropbox-cli filestatus && printf "\n\n\n" && dropbox-cli status;
    cd -;
end

# Reload color schemes
function clrs
    xrdb -load ~/.cache/wal/colors.Xresources;
    xrdb -merge ~/.Xresources;
end

# unzip into directory of the same name
function uz
    unzip $1.zip -d $1 ;
end

# convert webm to mp4
function convert2mp4
    set fin $argv[1]
    set type $argv[2]
    #printf "ffmpeg -fflags +genpts -i $fin.$type -r 24 $fin.mp4 \n"
    ffmpeg -fflags +genpts -i $fin.$type -r 24 $fin.mp4
end

# convert all to mp4
function all2mp4
    set dir $argv[1]
    set type $argv[2]
    for fin_raw in *.$type
        set fin $dir/(basename $fin_raw .$type)
        #printf "ffmpeg -fflags +genpts -i $fin.$type -r 24 $fin.mp4 \n"
        ffmpeg -fflags +genpts -i $fin.$type -r 24 $fin.mp4
    end

    printf "Finished converting all .$type files in $dir \n"
end

