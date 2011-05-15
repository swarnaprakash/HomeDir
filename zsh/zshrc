export EDITOR=vim

# emacs editing mode
bindkey -e 

# The program 'X' is currently not installed. You can install it by typing ...
if [ -f /etc/zsh_command_not_found ];then
    source /etc/zsh_command_not_found
fi

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
DIRSTACKSIZE=16 # keeps the directory stack from getting too large

setopt autocd # type '<dir>' instead of 'cd <dir>'
setopt extendedglob # http://zsh.sourceforge.net/Intro/intro_2.html#SEC2
setopt nobeep
setopt interactivecomments # allow comments on cmd line
setopt nohup    # Don't HUP running jobs on logout
setopt promptsubst # expansion performed in prompt

setopt hist_ignore_all_dups #No dups
setopt hist_ignore_space # Don't record if cmd preceded with space
setopt appendhistory
setopt banghist # Allow ! for accessing history 

setopt autopushd # cd acts like pushd
setopt pushdminus # swap cd +1 and cd -1
setopt pushdsilent 
setopt pushdtohome

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

zstyle ':completion:*' users resolve
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion*:default' menu 'select=1'

#Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*:cd:*' ignore-parents parent pwd

# “cd …./dir”
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot

bindkey . rationalise-dot
autoload -Uz compinit
compinit

autoload -Uz colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

export PS1="[%B%* %n@%M %d%b]%(?.. (%?%))
$"
RPROMPT=$'$(vcs_info_wrapper)'

#command aliases {{{
alias ls='ls --classify --color=auto'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'

alias gcc='gcc -lm -W -Wall -Wextra -O2'
alias g++='g++ -W -Wall -Wextra -O2'
#}}}

HIGHLIGHT=`echo -e '\033[41m\033[1;33m'`
NORMAL=`echo -e '\033[0m'`

colorpattern() {
   sed -e "s/$1/$HIGHLIGHT&$NORMAL/g"
}

icolorpattern() {
   sed -e "s/$1/$HIGHLIGHT&$NORMAL/gi"
}
