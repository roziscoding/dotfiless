## Aliases
alias getme="sudo pacman -S --noconfirm"
alias yo="yaourt -S --noconfirm"
alias reload!="source ~/.zshrc && echo 'ZSH reloaded'"
alias czsh="nano ~/.zshrc"
alias projects="cd ~/Documents/Projects"
alias dc=docker-compose
alias rd="rm -rf"
alias nodec="node && clear"
alias dotfiles="subl ~/dotfiles"
alias nodeup="nvm install node --reinstall-packages-from=node"
alias pig="ping google.com"

## Git
alias ginit="cp ~/.gitignore . && git init"
alias unstage="git reset HEAD"
alias gic="git commit -m 'Initial commit'"
alias gf="git-flow"
alias gff="git flow feature"

## Docker
alias spin="docker start"
alias stop="docker stop"

## Swagger
alias sgmake="swagger project create"
alias sgstart="swagger project start"
alias sgtest="swagger project test"
alias sgcheck="swagger project verify"
alias sgedit="swagger project edit"

## Functions
function mkd {
	mkdir $1
	cd $1
}

function mdn {
	xdg-open https://mdn.io/$1 > /dev/null 2>/dev/null
}

function safemerge {
	git merge --no-commit --no-ff $1
	git checkout HEAD deploy.sh .circleci/
	git merge --continue
}

# $1 - Ambiente (dev, stage, fin)
function mongodown {
	DATE=`date +%d-%m-%Y`
	DEST=$MONGODUMPS_DIR$DATE/$1
	HOST="$1.mantris.com.br:57348"
	echo "Backing '$1' up to '$DEST'"
	mongodump -h $HOST -o $DEST
	echo "Done!"
}

# $1 - Data (dd-mm-yyyy)
# $2 - Ambiente de origem (dev, stage, fin)
# $3 - Ambiente de destino (dev, stage, fin)
function mongoup {
	SOURCE=$MONGODUMPS_DIR$1/$2
	HOST=$3.mantris.com.br:57348
	echo "Restoring '$2' from '$SOURCE' to '$3'"
	mongorestore -v --drop --host $HOST $SOURCE
	echo "Done!"
}

# $1 - Ambiente de origem (dev, stage, fin)
# $2 - Ambiente de destino (dev, stage, fin)
function mongosync {
	DATE=`date +%d-%m-%Y`
	mongodown $1
	mongoup $DATE $1 $2
	echo "Synced! :D"
}