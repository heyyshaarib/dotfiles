# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  sudo 
  brew 
  command-not-found
  zsh-interactive-cd
  zsh-autosuggestions
  zsh-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-color "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# aliases
alias z='zoxide'
alias cl='clear'
alias rr='ranger'
alias ls='ls --color'
alias exp="explorer.exe"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git -a"

# update and upgrade
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# shel integrations
eval "$(zoxide init --cmd cd zsh)"
# eval $(thefuck --alias) 
source <(fzf --zsh)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$PATH:/mnt/c/Users/ashar/AppData/Local/Programs/Microsoft VS Code/bin"
export JAVA_HOME=/usr/lib/jvm/jdk-23.0.1
export PATH=$PATH:$JAVA_HOME/bin
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.cargo/bin:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source /home/heyyshaarib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh