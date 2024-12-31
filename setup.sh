git clone --bare https://github.com/tdiedrich-mdlive/dotfiles.git ~/.dotfiles
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
config config status.showUntrackedFiles no
config checkout
source ~/.zshrc
