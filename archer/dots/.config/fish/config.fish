# Set environmental variables
set --export SHELL /usr/bin/fish
set --export EDITOR "nvim"
set --export profile "archer"
set -e fish_greeting
#set fish_greeting

# Add to PATH
set --export MYBIN     "~/bin"
set --export LOCAL     "~/.local/bin"
set --export CONDAHOME "~/anaconda3/bin"
set --export RUBYHOME  "~/.gem/ruby/2.6.0/bin"
set --export NPMGLOBAL "~/.npm_global/bin"
#set -gx PATH $MYBIN $LOCAL $CONDAHOME $RUBYHOME $PATH
#set PATH $MYBIN $LOCAL $CONDAHOME $RUBYHOME $PATH
set fish_user_paths $MYBIN $LOCAL $CONDAHOME $RUBYHOME $NPMGLOBAL

# Source abbreviations and functions
source "$HOME/.config/fish/abbr.fish"
source "$HOME/.config/fish/func.fish"

# Source shortcuts
sh ~/.scripts/shortcuts.fsh
source ~/.config/fish/.shortcuts
