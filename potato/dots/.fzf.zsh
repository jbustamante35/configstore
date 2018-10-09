# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jbustamante35/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jbustamante35/.fzf/bin"
fi

# Auto-completion
# ---------------
echo "Sourcing fzf completions"
[[ $- == *i* ]] && source "/home/jbustamante35/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
echo "Sourcing fzf keybindings"
source "/home/jbustamante35/.fzf/shell/key-bindings.zsh"

