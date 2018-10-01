#!/bin/bash
# synchronize all bash/zsh/vim configuration files to configstore repository

sync="rsync -avzu --delete --progress -h"
repo=~/Documents/configstore/rintohsaka/

${sync} ~/.bash* ${repo}
${sync} ~/.zsh* ${repo}
${sync} ~/.oh-my-zsh ${repo}
${sync} ~/.vim* ${repo}

