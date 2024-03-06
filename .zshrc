# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#Path to your oh-my-zsh installation.
#if [[ $(uname) == Darwin ]]; then 
	export ZSH="~/.oh-my-zsh"
#	export PATH=/opt/homebrew/Cellar/inetutils/libexec/gnubin:/opt/homebrew/bin:/usr/local/sbin/:$PATH
export TERM="xterm-256color" CLICOLOR=1 LS_COLORS=bbfxcxdxbxegedabagacad

#	export LS_COLORS="$(vivid generate ayu)"
#	export CLICOLOR=0
#	export LSCOLORS=GxFxCxDxBxegedabagaced #(for dark backgrounds)
#	export LSCOLORS=ExFxBxDxCxegedabagacad #(for light background)

#else 
#	export ZSH="/Users/$USER/.oh-my-zsh"
#fi 

# ZSH Options ################################################################

#Options
#ZSH_COLORIZE_STYLE="colorful"
ZSH_THEME="essembeh"
#DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"

# Plugins ################################################################
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	ansible
	aws
	bbedit
#	colored-man-pages
	colorize
	common-aliases
	cp
#	docker
#	docker-compose
	history
	last-working-dir
	macos
	sudo
#	zsh-autosuggestions
)

#Sources ################################################################
source $ZSH/oh-my-zsh.sh
#source /Users/mdries/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#Aliases################################################################
#dirs
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias dir="dirs -v"
#alias -g ls="ls -al -H --color=always"
alias -g ls="ls -alhG "

#Disk tools
alias usage='du -h -d 1 $PWD'

#Docker
alias dps="docker ps" 
alias dcup="docker-compose up"
alias dcdown="docker-compose down"
alias docfile="vi Dockerfile"
alias doccomp="vi docker-compose.yml"

#Find my IP
alias myip="curl http://ipecho.net/plain; echo" 

#systemctl
alias sc-status="sudo systemctl status"
alias sc-stop="sudo systemctl stop " 
#sc-stop(){
#	sudo systemctl stop $firstParam
#}
alias sc-start="sudo systemctl start "
alias sc-res="sudo systemctl restart "
alias sc-reload="sudo systemctl daemon-reload" 

#ZSH
alias zr="source ~/.zshrc"
alias ze="vi ~/.zshrc"

#Suffix aliases
alias -s pac=bbedit
alias -s pem=bbedit

export TERM="xterm-256color" 
export CLICOLOR=1 
export LS_COLORS=Bbfxcxdxbxegedabagacad

