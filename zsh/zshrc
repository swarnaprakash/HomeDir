# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=100000
SAVEHIST=100000

export EDITOR=vim

setopt appendhistory
setopt autocd # No need 'cd'. /etc instead of cd /etc
setopt extendedglob # http://zsh.sourceforge.net/Intro/intro_2.html#SEC2
setopt nobeep

setopt hist_ignore_all_dups # prevent history from recording duplicated entries
setopt hist_ignore_space # useful trick to prevent particular entries from being recorded into a history by preceding them with at least one space. 

# Directory history. http://zsh.sourceforge.net/Intro/intro_6.html
# cd -3
# cd =3/fun
# dirs -v
DIRSTACKSIZE=8 # keeps the directory stack from getting too large
setopt autopushd # made cd act like pushd
setopt pushdminus # swapped the meaning of cd +1 and cd -1
setopt pushdsilent # keeps the shell from printing the directory stack each time we do a cd
setopt pushdtohome

bindkey -e # emacs editing mode

zstyle :compinstall filename '/home/prakash/.zshrc'

# enable the famous zsh tab-completion system
autoload -Uz compinit
compinit

#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

export PS1="[%B%* %n@%M %d%b]%(?.. (%?%))
$"

#command aliases
alias ls='ls --classify --color=auto'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'

alias gcc='gcc -lm -W -Wall -Wextra -O2'
alias g++='g++ -W -Wall -Wextra -O2'
