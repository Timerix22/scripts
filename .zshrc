export ZSH="$HOME/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Update automatically without asking
zstyle ':omz:update' mode auto

ZSH_THEME="my-afowler"

# Case-sensitive completion
CASE_SENSITIVE="false"

# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Enable command auto-correction.
ENABLE_CORRECTION="false"

# history command timestamp format
HIST_STAMPS="%Y/%m/%d"

plugins=(
	git
	zsh-autosuggestions
	zsh-history-substring-search
)

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#608570,underline"

#bindkey '	' autosuggest-accept
bindkey '^h' backward-kill-word

# zsh-
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.allrc
