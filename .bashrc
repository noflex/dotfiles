# ~/.bashrc: Last update 10/11-2011
# noflex on a archlinux 

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

## show time in history list
export HISTTIMEFORMAT="%d/%m/%y %T "


# append to the history file, don't overwrite it
shopt -s histappend
# check spelling
shopt -s cdspell
# Tab complete for sudo
complete -cf sudo                
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## Path setup
export PATH=$PATH:~/bin 


##  Exports {{{1
if [ -z "${DISPLAY:-}" ]; then
  BROWSER='elinks'
  EDITOR='vim'
  PAGER='less -FiRSwX -c'
else
  BROWSER='firefox'
  EDITOR='gvim'
fi

export PERLDOC_PAGER="vimpager"

## vi-like behavior for bash
set -o vi

## tab complete for sudo
complete -cf sudo

## prevent overwriting files with cat
set -o noclobber

## color for diff filetype.
if [ -f ~/.dir_colors ]; then
            eval `dircolors -b ~/.dir_colors`
fi

## Color man pages:
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode                 
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box                              
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

## function to make my day a bit easyer. ##

## use ack and not grep
g (){
    ack "$*" --all-types --color-match=green --color-filename=blue --smart-case
}
gw (){
    ack "$*" --all-types --color-match=green --color-filename=blue --word-regexp --smart-case
}
gnolog (){
    ack "$*" --all-types --ignore-dir=log --color-match=green --color-filename=blue --smart-case
}
f (){
    ack -i -g ".*$*[^\/]*$" | highlight blue ".*/" green "$*[^/]"
}

monitor_traffic(){
  sudo ngrep -W byline -qld en1 "$1" 
}

## google search from commandline.
google ()
{
  elinks http://google.com/search?q=$(echo "$@" | sed s/\ /+/g)
}

## easy to make tar files
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
## extract archives -- usage: extract
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjvpf $1 ;;
      *.tar.gz) tar xzvpf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xvpf $1 ;;
      *.tbz2) tar xjvpf $1 ;;
      *.tgz) tar xzvpf $1 ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# config awesome  
awconfig () {
    awconfdir="$HOME/.config/awesome"
    if [ $1 ] ; then
        case $1 in
            rc|main)        $EDITOR $awconfdir/rc.lua       ;;
            wg|widgets)     $EDITOR $awconfdir/widgets.lua  ;;
            th|theme)       $EDITOR $awconfdir/theme.lua    ;;
            vol|volume)     $EDITOR $awconfdir/volume.lua   ;;
            mm|menu)        $EDITOR $awconfdir/mainmenu.lua   ;;
            *)              echo "Invalid option"           ;;
        esac
    else
        $EDITOR $awconfdir/rc.lua
    fi
    unset awconfdir
}

## ceneral config 
config () {
    case $1 in
        bash)       $EDITOR ~/.bashrc ;;
        xdefs)      $EDITOR ~/.Xdefaults ;;
        xinit)      $EDITOR ~/.xinitrc ;;
        mpd)        $EDITOR ~/.mpdconf ;;
        ncmpcpp)    $EDITOR ~/.ncmpcpp/config ;;
        fstab)      sudo $EDITOR /etc/fstab ;;
        rc)         sudo $EDITOR /etc/rc.conf ;;
        vim)        $EDITOR ~/.vimrc ;;
        inittab)    sudo $EDITOR /etc/inittab ;;
        tint2)      $EDITOR ~/.config/tint2/tint2rc ;;
        dmenu)      $EDITOR ~/.config/dmenu/conf ;;
        xorg)        sudo $EDITOR /etc/X11/xorg.conf ;;
        *)          if [ -f "$1" ]; then 
                        $EDITOR $1 
                    else 
                        echo "Invalid Option" 
                    fi ;;
    esac
}

## conky config 
conkycfg () {
    conkydir="$HOME/.conky"
    default="$conkydir/rc"
    if [ "$1" ]; then
        if [ -f "$conkydir/$1" ]; then
            $EDITOR $conkydir/$1
        else
            echo "Invalid File"
            exit 1
        fi
    else
        $EDITOR $default
    fi
}

## make a new directories and go to it
mcd () 
{
  mkdir "$@" && cd "$@"
}

## function to cd in to a dir and list it
function cdl () 
{ 
  cd $1;ls;
} 

function cdla () { cd $1;la;}
function cdll () { cd $1;ll;}

# goes to doc file for a program
function doc() 
{ 
  pushd "/usr/share/doc/$1" && ls;
}

## encrypt file 
encrypt ()
{
  gpg -ac –no-options "$1"
}

## decrypt file 
decrypt ()
{
  gpg –no-options "$"
}

## find a file type excample ft noflex.txt
function ft {
find . -name "*."$1 -print
}

#find a file name like this
#example: f index
function fin {
find . -name $1 -print
}

## Translate
translate(){ wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=%7C${2:-en}" | sed 's/.*{"translatedText":"\([^"]*\)".*/\1\n/'; }

## wiki search/check
function wiki() #check wikipedia
{ dig +short txt "${@}".wp.dg.cx | awk 'BEGIN{RS="\" \"";ORS=""} // {gsub("\"",""); sub("htt","\nhtt"); print}';}
## get stuff from commandline fu
function cmdfu()  
{ wget -O - "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext";}

# Prompt
PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\]:\[\033[00m\]'

##
## term welcome
clear
cal -3
archbey -c cyan
fortune
