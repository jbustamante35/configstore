#############
# FUNCTIONS #
#############

# create directory and move to it
mvcd () {
	mkdir $1;
	cd $1;
}

# move to directory and show contents
cl () {
	cd $1 && la -F;
}

# easily create alias [not very flexible yet]
ali () {
	alias $1=$2
}

# check current status of dropbox syncing
drchk () {
	cd $HOME/Dropbox 
	dropbox filestatus && printf "\n\n\n" && dropbox status
	cd -
}

# [in progress] determine compressed filetype and extract files
extr () {
	extract $1
}

