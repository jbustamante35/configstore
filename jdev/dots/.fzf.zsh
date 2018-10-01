# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jbustamante/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jbustamante/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jbustamante/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jbustamante/.fzf/shell/key-bindings.zsh"

