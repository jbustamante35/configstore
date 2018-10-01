# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jbustamante35/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jbustamante35/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jbustamante35/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jbustamante35/.fzf/shell/key-bindings.bash"

