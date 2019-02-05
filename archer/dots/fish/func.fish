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
    la -F;
end

