# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# zshrc
alias zshconfig="nvim ~/.zshrc"

# docker
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"
alias dcud="docker compose up -d"
alias dcudb="docker compose up -d --build"
alias dcubd="docker compose up -d --build"
alias dps="docker ps"

# neovim
alias v="nvim"
alias vim="nvim"
alias swaps="cd ~/.local/state/nvim/swap/"

# notes
alias notes="cd ~/cigna && nvim ."

# python
alias python="python3"

# mac copy pipe
alias copy="pbcopy"

# mdlive dev env
function mdlive () {
  (cd ~/mdlive/mdlive-dev-environment && make $1)
}

# p10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
