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

