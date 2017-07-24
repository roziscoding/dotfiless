## Aliases
alias getme="sudo pacman -S --noconfirm"
alias yo="yaourt -S --noconfirm"
alias reload!="source ~/.zshrc && echo 'ZSH reloaded'"
alias czsh="nano ~/.zshrc"
alias nano=subl
alias vim=nano
alias projects="cd ~/Documents/Projects"
alias dc=docker-compose
alias rd="rm -rf"
alias docker="sudo docker"
alias nodec="node && clear"

## Git
alias ginit="cp ~/.gitignore . && git init"
alias unstage="git reset HEAD"
alias gic="git commit -m 'Initial commit'"
alias gf="git-flow"
## Docker
alias spin="docker start"
alias stop="docker stop"

## Functions
function mkd {
	mkdir $1
	cd $1
}

function mdn {
	xdg-open https://mdn.io/$1 > /dev/null 2>/dev/null
}