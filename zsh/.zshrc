# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

eval `dircolors ~/.dir_colours`

# Useful pseudo-functions
function lt() { ls -ltha "$@" ; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }

# sample usage: drreview john.doe@gmail.com "i#314159: drsyms on PDP-11"

function drreview {
    echo "Reviewer $1" > /tmp/diffnotes
    echo $2 >> /tmp/diffnotes
    git log -n 1 | sed '/^commit/d;/^Author/d;/^Date/d;s/^    //;' >> /tmp/diffnotes
    #upload.py -r bruening@google.com,zhaoqin@google.com -t $2 -F /tmp/diffnotes --send_mail --cc=dynamorio_devs@googlegroups.com --rev HEAD^
}

# Prevent zsh from correcting wrong stuff
alias sudo='nocorrect sudo'
alias plz='sudo'

export EDITOR='vim'
export MAKEFLAGS=-j8
alias 'mk'='make'
alias 'cmk'='cmake'
alias 'snype'='killall skype'
alias 'v'='vim'
alias 'df'='df -h'
alias 'du'='du -h'
alias 'dmesg'='dmesg -L --reltime'
alias 'ssh=TERM=xterm ssh'
alias 'xlock=xscreensaver -no-splash &; xscreensaver-command --lock'
alias 'upload.py'='python2 /usr/bin/upload.py'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"


#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#export JAVA_FONTS='/usr/share/fonts/TTF'
#
#export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

#alias matlab='MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre/ LIBGL_DEBUG=verbose matlab'
export TERM='screen-256color'

export PATH=$PATH:/opt/ida61

bindkey "^[[A" history-search-backward
bindkey "^[[X" history-search-forward

alias 'matlab'='PATH=$PATH:/home/dtouch3d/Dropbox/ptes\ jam/hosa/hosa matlab'

alias 'ida'='wine .wine/drive_c/Program\ Files/IDA\ 6.5/idaq.exe'
alias 'ida64'='wine .wine/drive_c/Program\ Files/IDA\ 6.5/idaq64.exe'

export CHROMIUM_FLAGS="--ssl-version-min=tls1"

. /usr/share/autojump/autojump.sh


export PATH=$PATH:/opt/oracle/instantclient_12_1
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
export SSH_AUTH_SOCK

export FLEX_SDK_HOME=/opt/flex
alias mxmlc='java -jar "$FLEX_SDK_HOME/lib/mxmlc.jar" +flexlib="$FLEX_SDK_HOME/frameworks" "$@"'

export GOPATH='/home/dtouch3d/gocode'
