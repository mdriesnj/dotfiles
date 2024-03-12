# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="fox"
#ZSH_THEME=

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
 DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#		aliases
		colored-man-pages
		colorize
		command-not-found 
#		common-aliases
#		copyfile
#		copypath
#		dirhistory
#		extract
#		eza
#		fancy-ctrl-z
#		fig
#		fzf
		git		
		jsontools
		nmap
		safe-paste
		sudo
		systemadmin
)

ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

source $ZSH/oh-my-zsh.sh
#source $HOME/dotfiles/essembeh.zsh-theme
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Aliases################################################################
#dirs
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias dir="dirs -v"
#alias -g ls="ls -al -H --color=always"
#alias -g ls="ls -alhG "
alias ls="eza -l" 
alias la="eza -al" 

#Disk tools
alias usage='du -h -d 1 $PWD'

#Test
#alias quit='cd ~/dotfiles && git commit -m "exit" && git push && exit' 

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

function exit(){
	cd ~/dotfiles
	git add .zshrc
	git add .vimrc
	git push
	git commit -m "$(date +%m.%d.%y-%H:%M:%S)"
	logout


}



#==================================================================================
# My custom theme:
#   - single line
#   - quite simple by default: user@host:$PWD
#   - green for local shell as non root
#   - red for ssh shell as non root
#   - magenta for root sessions
#   - prefix with remote address for ssh shells
#   - prefix to detect docker containers or chroot
#   - git plugin to display current branch and status

# git plugin
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

function zsh_essembeh_gitstatus {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    GIT_STATUS=$(git_prompt_status)
    if [[ -n $GIT_STATUS ]]; then
        GIT_STATUS=" $GIT_STATUS"
    fi
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# by default, use green for user@host and no prefix
local ZSH_ESSEMBEH_COLOR="green"
local ZSH_ESSEMBEH_PREFIX=""
if [[ -n "$SSH_CONNECTION" ]]; then
    # display the source address if connected via ssh
    ZSH_ESSEMBEH_PREFIX="%{$fg[yellow]%}[$(echo $SSH_CONNECTION | awk '{print $1}')]%{$reset_color%} "
    # use red color to highlight a remote connection
    ZSH_ESSEMBEH_COLOR="red"
elif [[ -r /etc/debian_chroot ]]; then
    # prefix prompt in case of chroot
    ZSH_ESSEMBEH_PREFIX="%{$fg[yellow]%}[chroot:$(cat /etc/debian_chroot)]%{$reset_color%} "
elif [[ -r /.dockerenv ]]; then
    # also prefix prompt inside a docker container
    ZSH_ESSEMBEH_PREFIX="%{$fg[yellow]%}[docker]%{$reset_color%} "
fi
if [[ $UID = 0 ]]; then
    # always use magenta for root sessions, even in ssh
    ZSH_ESSEMBEH_COLOR="magenta"
fi
PROMPT='${ZSH_ESSEMBEH_PREFIX}%{$fg[$ZSH_ESSEMBEH_COLOR]%}%n@%M%{$reset_color%}:%{%B$fg[yellow]%}%~%{$reset_color%b%} $(zsh_essembeh_gitstatus)%(!.#.
$) '
RPROMPT="%(?..%{$fg[red]%}%?%{$reset_color%})"

