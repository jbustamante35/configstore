#!/bin/bash

# synchronize all configuration files to configstore repository
repo=~/Dropbox/ComputerProgramming/configstore/rintohsaka/
sync="rsync -avzu --delete --progress -h"

${sync} ~/.bash* ${repo}
${sync} ~/.zsh* ${repo}

