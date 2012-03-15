##  alias for ls
alias reload="source ~/.bashrc" 
alias ls="ls -aF --color=always --group-directories-first"
alias ll="ls -lhF --color --group-directories-first"
alias la="ls -lahF --color --group-directories-first"
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'      # sort by change time
alias lu='ls -lur'      # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al |more'         # pipe through 'more'

## alias chmod commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

## alias grep commands 
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias less='less -FiRSwX -c '

## alias for dir
alias ..="cd .."
alias ...="cd ../.."
alias back="cd $OLDPWD"
alias home="cd ~"
alias doc="cd ~/Documents/ && ls -a"
alias dl="cd ~/Downloads/ && ls -a"
alias desk="cd ~/Desktop/ && ls -a"
alias book="cd ~/code/Ebooks/ && ls -a"
alias drop="cd ~/Dropbox/ && ls -a"
alias ccode="cd ~/code/c-code/ && ls -a"
alias cppcode="cd ~/code/cpp-code/ && ls -a"
alias perlcode="cd ~/code/perl/ && ls -a"
alias pix="cd ~/images/ && ls -a"
alias music="cd ~/music/ && ls -a"
alias video="cd ~/video/ && ls -a"
alias bin="cd ~/bin/"
alias mkdir='mkdir -p -v'
alias rmdir='rmdir -p -v'
alias -- +='pushd .'
alias -- -='popd'


## alias misc
alias x="exit"
alias c="clear"
alias h="htop"
alias rm="rm -i"
alias e="vim"
alias vi="vim"
alias kff="killall firefox"
alias kgc="killall google-chrome"
alias openp="netstat -nape --inet"
alias ns="netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 |tail +2"
alias appson="netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq"
alias rscp='rsync -aP --no-whole-file --inplace'
alias rsmv='rscp --remove-source-files'
alias netpid="netstat -tlnp"
alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"
alias numfiles="echo $(ls -1 | wc -l)"
alias diff="colordiff"
alias bashal='grep alias ~/.bashrc'

## handle files in Downloads 
alias rndpix='mv *.{jpg,JPG,gif,GIF,png,PNG,bmp,BMP} ~/images/$date/'
alias rndmov='mv *.{avi,mp4,mpg,mkv} ~/video/newstuff/'


## arch Alias
alias install="packer -S"
alias remove="sudo pacman -Rns"
alias search="packer -Ss"
alias update="packer -Syyuf"
alias clean="sudo pacman -Sc"
alias yup="sudo yaourt -Syu ..aur"
alias y="sudo yaourt"

## Default to human readable figures
alias df='df -h'
alias du='du -h'
alias dut='du -h -c -d 1'
alias ps='ps auxf'
alias pg='ps aux | grep'
alias un='tar -zxvf'
alias ping='ping -c 10'

# Edit conf files on my system
alias vimrc="vim ~/.vimrc"
alias bachrc="vim ~/.bashrc"
alias rc.lua="vim ~/.config/awesome/rc.lua"
alias gvimrc="vim ~/.gvimrc"
alias muttrc="vim ~/.muttrc"
alias xinitrc="vim ~/.xinitrc"

# handle music from mpd with mpc
alias pplay="mpc play"
alias pn="mpc next"
alias pp="mpc prev"
alias pps="mpc stop"
alias mpcup="mpc update"

## set time by ntp-server.
alias ntp="sudo ntpdate ntp.inet.tele.dk"

## kill and restart mpd server. 
alias kmpd="sudo killall mpd && sudo /etc/rc.d/mpd restart"

## git aliases
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gd="git diff | mate"
alias gl="git pull --rebase"
alias gp="git push origin HEAD"
alias gcp="git cherry-pick"
alias gst="git status"
alias ga="git add"
alias gr="git rm"
alias gu="git pull --rebase && git push origin HEAD"


