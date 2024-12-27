# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_THEME="powerlevel10k/powerlevel10k"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# remind when time to update
zstyle ':omz:update' mode reminder

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# dotfiles config
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias cst="config status"

# zshrc
alias zshconfig="nvim ~/.zshrc && source ~/.zshrc"

# docker
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"
alias dcud="docker compose up -d"
alias dcudb="docker compose up -d --build"
alias dcubd="docker compose up -d --build"
alias dps="docker ps"

# neovim
export EDITOR='nvim'
alias v="nvim"
alias vim="nvim"
alias swaps="cd ~/.local/state/nvim/swap/"

# notes
alias notes="cd ~/notes && nvim ."
function save-notes() {
    local commit_message="${1:-'Auto-commit'}"
    cd ~/notes || return
    git add .
    git commit -m "$commit_message"
    git push origin main
}

# python
alias python="python3"
alias pip="pip3"

# mac copy pipe
alias copy="pbcopy"

# git
alias gcan="git commit --amend --no-edit"
function gsha () {
  local num_commits=${1:-1}

  commits=$(git log -n $num_commits --pretty=format:"%H %s")

  shas=$(echo "$commits" | awk '{print $1}' | tac | tr '\n' ' ')
  messages=$(echo "$commits" | cut -d' ' -f2-)

  echo "$shas" | pbcopy

  local index=$num_commits
  while read -r message; do
    echo "$index.) $message"
    index=$((index - 1 ))
  done <<< "$messages"
}

# tmuxinator
alias mux="tmuxinator"

# mdlive dev env
function mdlive () {
  (cd ~/mdlive/mdlive-dev-environment && make $1)
}

# fzf
export FZF_DEFAULT_OPTS='--tmux'
source <(fzf-tmux --zsh)

# p10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load rbenv
eval "$(rbenv init -)"
export PATH="$PATH:/opt/homebrew/Cellar/tmuxinator/3.3.0/libexec/gems/"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
