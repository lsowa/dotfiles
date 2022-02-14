# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#set -x

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[7;37m\][ \h ]\[\033[0m\] $PWD > '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

### GridKa Shift Aliases ###

alias voproxy='voms-proxy-init --voms cms -valid 192:00 -rfc'
alias gridshift='gsissh -p 1975 cms-sl7-kit.gridka.de'


######################
# some more ls aliases
######################

# set umlaute for english keyboard
if setxkbmap -query | grep -q 'layout:     us,us'; then 
xmodmap /home/lsowa/.Xmodmap;
fi

# basic
alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ll="ls -ohF  --time-style=\"+%F %T %z\" --group-directories-first"
alias lx="ls -ohFX --time-style=\"+%F %T %z\" --group-directories-first"
alias la="ls -ohFA --time-style=\"+%F %T %z\" --group-directories-first"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cdlocal="cd /local/scratch/ssd1/lsowa/"
alias cdw='cd /work/lsowa/'
alias cdc='cd /ceph/lsowa/'

#Setup to work in jupyter-notebook on deepthought & worksapce
alias sshL='ssh -X -L2222:localhost:2222 dt'
alias setup='cdw && conda activate snowflake && jupyter notebook --no-browser --port=2222'
alias gbasf='source /work/lsowa/gbasf2KEK/BelleDIRAC/gbasf2/tools/setup && gb2_proxy_init -g belle'
alias basf='source /cvmfs/belle.cern.ch/tools/b2setup light-2002-ichep'
alias ts='~/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh'
alias cmssw='. ~/.cmsenv.sh'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

HISTSIZE=50000
set -o physical

#load packages on different hosts
if [ "${HOSTNAME}" = "ekplx92" ] 
then
    cd storageC
    . setup_NNFlow_venv.sh
    echo NNFlow_venv loaded
fi

#echo -e "Load BelleII software and specific software releasetools:\n\tsource /cvmfs/belle.cern.ch/tools/b2setup light-2002-ichep"
#echo -e 'Load gbasf2:\n\t source /work/lsowa/gbasf2KEK/BelleDIRAC/gbasf2/tools/setup && gb2_proxy_init -g belle'

# do not activate conda when working on bms machines
if [ "${HOSTNAME:0:3}" = "bms" ]
then
    echo "no conda loaded"
    python --version
else
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/work/lsowa/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/work/lsowa/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/work/lsowa/miniconda3/etc/profile.d/conda.sh"   
        elif [ -e ~/.miniconda/etc/profile.d/conda.sh ]; then
            source ~/.miniconda/etc/profile.d/conda.sh
        else
            export PATH="/work/lsowa/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi

#export PYTHONPATH=/work/lsowa/main/
export PATH="~/.miniconda/bin:$PATH" 
 
