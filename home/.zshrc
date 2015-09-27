# Path to your oh-my-zsh installation.
export ZSH=/home/katt/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux systemd)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/vogl:/home/katt/.scripts:/home/katt/bin:/home/katt/node_modules/.bin:/home/katt/.scripts:/home/katt/bin:/home/katt/node_modules/.bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# User configuration

PATH="$PATH:$HOME/.scripts:$HOME/bin:$HOME/node_modules/.bin"
export PATH
export GOPATH=~/gopath

## zsh
eval `dircolors ~/.dir_colors`
export HISTSIZE=1000000
setopt CORRECT
setopt HIST_VERIFY
setopt HIST_IGNORE_DUPS

## defaults
export BROWSER="google-chrome-stable"
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL="vim"

## steam
export STEAM_RUNTIME=1

## video acceleration
#export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=radeonsi

# Java stuff
export MATLAB_JAVA=/usr/lib/jvm/java-8-jdk/jre
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

## mpd tweak
export MPD_HOST=/home/katt/.config/mpd/socket

## xbmc (kodi) tweak
export SDL_VIDEO_FULLSCREEN_HEAD=0

# dont spawn dbus stuff for gtk
export NO_AT_BRIDGE=1


## aliases
alias update="sudo powerpill -Syu"
alias aupdate="pacaur -Syu"
alias pkspot="pkill spotify"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias cproxy='chromium --proxy-server="socks5://localhost:9999" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost"'

#######################
# Functions
#######################

music()
{
    mpd
    sleep 0.5
    mpdscribble
    sleep 3
    ncmpcpp
}

startaxon()
{
    wine .wine/drive_c/Program\ Files/DolbyAxon/Axon.exe
}


# Unified Remote server control
urserver()
{
    if [ ! $1 ] ; then
        print "please specify start or stop argument"
    elif [ $1 = "start" ] ; then
        sudo /opt/urserver/urserver-start --no-manager
    elif [[ $1 = "stop" ]] ; then
        sudo /opt/urserver/urserver-stop
    fi  
}


